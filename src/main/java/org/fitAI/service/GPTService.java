package org.fitAI.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class GPTService {

    private final WebClient.Builder webClientBuilder;

    @Value("${openrouter.api.key}")
    private String apiKey;

    public GPTService(WebClient.Builder webClientBuilder) {
        this.webClientBuilder = webClientBuilder;
    }

    public String generateDietPlan(String prompt) {
        WebClient webClient = webClientBuilder.build();
        ObjectMapper mapper = new ObjectMapper();

        System.out.println("📥 Prompt: " + prompt);

        // 1. Use Map for safe JSON construction
        Map<String, Object> requestMap = new HashMap<>();
        requestMap.put("model", "mistralai/mistral-7b-instruct");
        
        Map<String, String> message = new HashMap<>();
        message.put("role", "user");
        message.put("content", prompt);
        
        requestMap.put("messages", Collections.singletonList(message));
        requestMap.put("temperature", 0.7);

        try {
            String requestBody = mapper.writeValueAsString(requestMap);
            System.out.println("📤 Request Body:\n" + requestBody);

            // 2. Add required OpenRouter headers
            String responseJson = webClient.post()
                .uri("https://openrouter.ai/api/v1/chat/completions")
                .header("Authorization", "Bearer " + apiKey)
                .header("Content-Type", "application/json")
                .header("HTTP-Referer", "http://yourdomain.com") // REQUIRED
                .header("X-Title", "Your App Name") // REQUIRED
                .bodyValue(requestBody)
                .retrieve()
                .onStatus(status -> !status.is2xxSuccessful(), 
                          response -> response.bodyToMono(String.class).map(Exception::new))
                .bodyToMono(String.class)
                .block();

            System.out.println("🌐 Raw Response:\n" + responseJson);

            // 3. Parse response safely
            JsonNode root = mapper.readTree(responseJson);
            if (root.has("error")) {
                return "❌ API Error: " + root.get("error").get("message").asText();
            }
            
            JsonNode choices = root.path("choices");
            if (choices.isEmpty()) {
                return "❌ No choices in response";
            }
            
            String reply = choices.get(0)
                .path("message")
                .path("content")
                .asText()
                .trim();
            
            System.out.println("✅ Reply:\n" + reply);
            return reply;

        } catch (Exception e) {
            e.printStackTrace();
            return "❌ Error: " + e.getMessage();
        }
    }
}
