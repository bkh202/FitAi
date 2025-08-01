package org.fitAI.service;

import java.net.URI;
import java.net.http.*;
import java.time.Duration;
import java.util.Map;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class OpenRouterService {

    @Value("${openrouter.api.key}")
    private String apiKey; // ✅ now it will be injected properly

    private static final String OPENROUTER_URL = "https://openrouter.ai/api/v1/chat/completions";

    public String getDietPlanFromAI(String prompt) throws Exception {
        Map<String, Object> requestBodyMap = Map.of(
            "model", "mistralai/mistral-7b-instruct",
            "messages", List.of(Map.of("role", "user", "content", prompt)),
            "temperature", 0.7
        );

        String requestBody = new ObjectMapper().writeValueAsString(requestBodyMap);

        HttpRequest request = HttpRequest.newBuilder()
            .uri(URI.create(OPENROUTER_URL))
            .header("Authorization", "Bearer " + apiKey) // ✅ now it will not be null
            .header("Content-Type", "application/json")
            .timeout(Duration.ofSeconds(30))
            .POST(HttpRequest.BodyPublishers.ofString(requestBody))
            .build();

        HttpClient client = HttpClient.newHttpClient();
        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

        Map<String, Object> responseMap = new ObjectMapper().readValue(response.body(), Map.class);
        Object choicesObj = responseMap.get("choices");

        if (choicesObj == null) {
            throw new RuntimeException("❌ Error from OpenRouter: " + response.body());
        }

        Map<?, ?> choice = (Map<?, ?>) ((List<?>) choicesObj).get(0);
        Map<?, ?> message = (Map<?, ?>) choice.get("message");
        String reply = message.get("content").toString();

        return reply.trim();
    }

	
}
