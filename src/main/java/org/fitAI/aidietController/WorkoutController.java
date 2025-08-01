package org.fitAI.aidietController;



import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.*;
import java.util.*;

@Controller
public class WorkoutController {

    @Value("${openrouter.api.key}")
    private String apiKey;

    @PostMapping("/dashboard/generate-workout")
    public String generateWorkout(HttpServletRequest request, Model model) {

        // Get user input
        String gender = request.getParameter("gender");
        String goal = request.getParameter("goal");
        String muscleGroup = request.getParameter("muscleGroup");
        String level = request.getParameter("level");
        String equipment = request.getParameter("equipment");

        
        
        // 👇 Prompt for Mistral-7B
        String prompt = String.format("""
            You are a professional fitness trainer.
            Create a personalized workout plan based on:
            - Gender: %s
            - Goal: %s
            - Target Muscle Group: %s
            - Fitness Level: %s
            - Available Equipment: %s

            Output JSON array like this:
            [
              {
                "exercise": "Push Ups",
                "description": "Targets chest and triceps using bodyweight.",
                "level": "Beginner",
                "image": "https://link-to-image.jpg",
                "video": "https://youtube.com/video123"
              },
              ...
            ]
            Keep it concise and beginner-friendly.
        """, gender, goal, muscleGroup, level, equipment);

        // 🔁 Build API Request
        RestTemplate restTemplate = new RestTemplate();
        String url = "https://openrouter.ai/api/v1/chat/completions";

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setBearerAuth(apiKey);

        Map<String, Object> message = Map.of(
            "role", "user",
            "content", prompt
        );

        Map<String, Object> requestBody = Map.of(
        		"model", "mistralai/mistral-7b-instruct",
        	    "messages", List.of(message),
        	    "temperature", 0.7
        	);


        HttpEntity<Map<String, Object>> entity = new HttpEntity<>(requestBody, headers);

        try {
            ResponseEntity<Map> response = restTemplate.postForEntity(url, entity, Map.class);
            Map<String, Object> responseBody = response.getBody();
            System.out.println("RAW AI Response: " + responseBody);


            if (responseBody != null && responseBody.containsKey("choices")) {
                String content = ((Map<String, String>) ((Map<String, Object>) ((List<?>) responseBody.get("choices")).get(0)).get("message")).get("content");
                System.out.println("Content: " + content);

                String jsonOnly = content.replaceAll("(?s)^.*?(\\[.*\\]).*$", "$1");
                // Store in model for JSP
                model.addAttribute("aiResponse", jsonOnly);
                System.out.println("Generated JSON: " + jsonOnly);

                return "workout-result"; // Next JSP page
            }
        } catch (Exception e) {
        	e.printStackTrace();
            model.addAttribute("error", "Failed to generate workout: " + e.getMessage());
        }

        return "aiWorkout"; // Return to form on error
    }
}

