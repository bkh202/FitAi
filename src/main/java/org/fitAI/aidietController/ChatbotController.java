package org.fitAI.aidietController;

import java.net.URI;
import java.net.http.*;
import java.util.Map;
import org.json.JSONArray; // ADDED IMPORT
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/chatbot")
public class ChatbotController {

    @Value("${openrouter.api.key}")
    private String apiKey;

    @PostMapping("/ask")
    public String askBot(@RequestBody Map<String, String> body) throws Exception {
        String prompt = body.get("prompt");

        HttpClient client = HttpClient.newHttpClient();
        
        // Build JSON using proper JSON classes
        JSONObject message = new JSONObject();
        message.put("role", "user");
        message.put("content", prompt);
        
        JSONArray messagesArray = new JSONArray(); // CORRECT TYPE
        messagesArray.put(message);
        
        JSONObject requestBody = new JSONObject();
        requestBody.put("model", "mistralai/mistral-7b-instruct");
        requestBody.put("messages", messagesArray); // PASS ARRAY
        
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create("https://openrouter.ai/api/v1/chat/completions"))
                .header("Authorization", "Bearer " + apiKey)
                .header("Content-Type", "application/json")
                .POST(HttpRequest.BodyPublishers.ofString(requestBody.toString()))
                .build();

        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
        
        String responseBody = response.body();
        //System.out.println("API Response: " + responseBody); // Debug

        try {
            JSONObject obj = new JSONObject(responseBody);
            if (obj.has("error")) {
                return "❌ Error: " + obj.getJSONObject("error").getString("message");
            }
            return obj.getJSONArray("choices")
                      .getJSONObject(0)
                      .getJSONObject("message")
                      .getString("content");
        } catch (Exception e) {
            return "❌ Response Error: " + responseBody;
        }
    }
}