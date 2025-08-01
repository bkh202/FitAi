package org.fitAI.aidietController;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@RestController
@RequestMapping("/api")
public class SupplementAIController {

    @Value("${openrouter.api.key}")
    private String apiKey; // ✅ Injected from application.properties

    @PostMapping("/ai-supplements")
    public ResponseEntity<?> getSupplements(@RequestBody Map<String, String> request) {
        String budget = request.get("budget");
        String purpose = request.get("purpose");

        String prompt = "Return ONLY a raw valid JSON array of 3-5 Indian gym supplements under ₹" + budget +
        	    " for the purpose of " + purpose + ". Format strictly like this: " +
        	    "[{\"name\":\"Product Name\",\"price\":1234,\"purpose\":\"Short description\",\"link\":\"https://...\"}] " +
        	    "NO explanation. No text. JSON array only.";

        try {
            HttpHeaders headers = new HttpHeaders();
            headers.set("Authorization", "Bearer " + apiKey); // ✅ Using injected API key
            headers.setContentType(MediaType.APPLICATION_JSON);

            Map<String, Object> requestBody = new HashMap<>();
            requestBody.put("model", "mistralai/mistral-7b-instruct");
            requestBody.put("messages", List.of(
                    Map.of("role", "user", "content", prompt)
            ));

            HttpEntity<Map<String, Object>> entity = new HttpEntity<>(requestBody, headers);

            RestTemplate restTemplate = new RestTemplate();
            ResponseEntity<Map> response = restTemplate.postForEntity(
                    "https://openrouter.ai/api/v1/chat/completions", entity, Map.class);

            Map responseMap = response.getBody();
            if (responseMap == null) {
                return ResponseEntity.status(500).body(Map.of("error", "Empty response from AI API"));
            }

            Map message = (Map) ((Map) ((List) responseMap.get("choices")).get(0)).get("message");
            String content = (String) message.get("content");

            System.out.println("🔍 AI content:\n" + content);

            String jsonArrayString = extractJsonArray(content);
          

            if (jsonArrayString == null) {
                return ResponseEntity.status(500).body(Map.of("error", "Could not extract valid JSON"));
            }

            // Fix incorrectly escaped characters
            jsonArrayString = jsonArrayString
                    .replace("\\\"", "\"")
                    .replaceAll("\\\\n", "")
                    .replaceAll("\\\\t", "")
                    .replaceAll("\\\\r", "")
                    .replaceAll("\\\\", "");

            System.out.println("🧼 Cleaned JSON: " + jsonArrayString);

            ObjectMapper mapper = new ObjectMapper();
            List<Map<String, Object>> suggestions = mapper.readValue(jsonArrayString, List.class);

            double totalUsed = 0;
            for (Map<String, Object> item : suggestions) {
                Object priceObj = item.get("price");
                double price = parsePrice(priceObj);
                item.put("price", price);
                totalUsed += price;
            }

            Map<String, Object> result = new HashMap<>();
            result.put("suggestions", suggestions);
            result.put("totalUsed", totalUsed);
            result.put("budget", Double.parseDouble(budget));
            return ResponseEntity.ok(result);

        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body(Map.of("error", "Server error: " + e.getMessage()));
        }
    }

    private String extractJsonArray(String content) {
        int start = content.indexOf("[");
        int end = content.lastIndexOf("]");
        if (start == -1 || end == -1 || start >= end) return null;
        return content.substring(start, end + 1);
    }

    private double parsePrice(Object priceObj) {
        if (priceObj == null) return 0;
        String priceStr = priceObj.toString();
        Pattern pattern = Pattern.compile("(\\d+(\\.\\d+)?)");
        Matcher matcher = pattern.matcher(priceStr);
        if (matcher.find()) {
            return Double.parseDouble(matcher.group(1));
        }
        try {
            return Double.parseDouble(priceStr);
        } catch (NumberFormatException e) {
            return 0;
        }
    }
}
