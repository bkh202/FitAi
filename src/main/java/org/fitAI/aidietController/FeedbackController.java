package org.fitAI.aidietController;

import org.fitAI.model.Entity.BMIRecord;
import org.fitAI.model.Entity.ProgressTracker;
import org.fitAI.model.Entity.User;
import org.fitAI.repository.ProgressTrackerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpSession;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.List;

@RestController
public class FeedbackController {
	
	@Autowired
	private ProgressTrackerRepository progressRepo;

    @Value("${openrouter.api.key}")
    private String openRouterApiKey;

    @PostMapping("/dashboard/aiFeedback")
    @ResponseBody
    public String getAIFeedback(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "Please login";

        List<ProgressTracker> lastRecords = progressRepo.findTop5ByUserIdOrderByDateDesc(user.getId());
        if (lastRecords == null || lastRecords.isEmpty()) {
            return "No progress records found.";
        }

        StringBuilder prompt = new StringBuilder("Give a motivational and analytical health feedback for the following progress:\n");

        for (ProgressTracker record : lastRecords) {
            prompt.append("Date: ").append(record.getDate())
                  .append(", Weight: ").append(record.getWeight()).append("kg")
                  .append(", Note: ").append(record.getNotes()).append("\n");
        }

        try {
            String jsonBody = "{\n" +
                    "  \"model\": \"mistralai/mistral-7b-instruct\",\n" +
                    "  \"messages\": [\n" +
                    "    {\n" +
                    "      \"role\": \"user\",\n" +
                    "      \"content\": \"" + prompt.toString().replace("\"", "\\\"") + "\"\n" +
                    "    }\n" +
                    "  ]\n" +
                    "}";

            HttpClient client = HttpClient.newHttpClient();
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create("https://openrouter.ai/api/v1/chat/completions"))
                    .header("Authorization", "Bearer " + openRouterApiKey)
                    .header("Content-Type", "application/json")
                    .POST(HttpRequest.BodyPublishers.ofString(jsonBody))
                    .build();

            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
            return response.body();

        } catch (Exception e) {
            e.printStackTrace();
            return "❌ AI Feedback Failed: " + e.getMessage();
        }
    }
}
