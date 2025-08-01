package org.fitAI.aidietController;

import java.io.ByteArrayOutputStream;
import java.net.URI;
import java.net.http.*;
import java.time.Duration;
import java.util.List;
import java.util.Map;

import org.fitAI.service.GPTService;
import org.fitAI.service.OpenRouterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.itextpdf.text.Document;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

@RestController
@RequestMapping("/api")
public class AIDietOpenRouterController {

	@Value("${openrouter.api.key}")
	private String apiKey;

	@Autowired
	private OpenRouterService openRouterService;
	
	@Autowired
	private GPTService gptService;


	private static final String OPENROUTER_URL = "https://openrouter.ai/api/v1/chat/completions";

	@PostMapping("/ai-diet")
	public ResponseEntity<String> getDiet(@RequestBody Map<String, String> input) throws Exception {
		String bmi = input.get("bmi");
		String category = input.get("category");
		String age = input.get("age");
		String gender = input.get("gender");

		String prompt = "Suggest a healthy daily diet plan for a " + age + " year old " + gender +
		                " with a BMI of " + bmi + " in the " + category + " category.";

		String requestBody = new ObjectMapper().writeValueAsString(Map.of(
		    "model", "mistralai/mistral-7b-instruct",
		    "messages", new Object[]{ Map.of("role", "user", "content", prompt) },
		    "temperature", 0.7
		));

		HttpRequest request = HttpRequest.newBuilder()
			.uri(URI.create(OPENROUTER_URL))
			.header("Authorization", "Bearer " + apiKey)
			.header("Content-Type", "application/json")
			.timeout(Duration.ofSeconds(30))
			.POST(HttpRequest.BodyPublishers.ofString(requestBody))
			.build();

		HttpClient client = HttpClient.newHttpClient();
		HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

		Map<String, Object> responseMap = new ObjectMapper().readValue(response.body(), Map.class);
		Object choicesObj = responseMap.get("choices");

		if (choicesObj == null) {
			return ResponseEntity.status(500).body("❌ Error from OpenRouter: " + response.body());
		}

		Map<?, ?> choice = (Map<?, ?>) ((List<?>) choicesObj).get(0);
		Map<?, ?> message = (Map<?, ?>) choice.get("message");
		String reply = message.get("content").toString();

		return ResponseEntity.ok(reply.trim());
	}

	@PostMapping("/downloadAIDietPdf")
	public ResponseEntity<byte[]> getPdfDietPlan(@RequestParam String bmi,
	                                             @RequestParam String category,
	                                             @RequestParam String age,
	                                             @RequestParam String gender) throws Exception {

		String prompt = "Suggest a healthy daily diet plan for a " + age + " year old " + gender +
		                " with a BMI of " + bmi + " in the " + category + " category.";

		String dietPlan = openRouterService.getDietPlanFromAI(prompt);

		ByteArrayOutputStream out = new ByteArrayOutputStream();
		Document document = new Document();
		PdfWriter.getInstance(document, out);
		document.open();
		document.add(new Paragraph("AI Diet Plan", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16)));
		document.add(new Paragraph("\nBMI: " + bmi + " | Category: " + category + " | Age: " + age + " | Gender: " + gender));
		document.add(new Paragraph("\n\nDiet Plan:\n\n" + dietPlan));
		document.close();

		byte[] pdfBytes = out.toByteArray();

		return ResponseEntity.ok()
			.header("Content-Disposition", "attachment; filename=diet-plan.pdf")
			.contentType(org.springframework.http.MediaType.APPLICATION_PDF)
			.body(pdfBytes);
	}
	
	@PostMapping("/ai-diet-full")
	@ResponseBody
	public String getAIDietPlan(@RequestBody Map<String, String> input) {
	    String age = input.get("age");
	    String weight = input.get("weight");
	    String goal = input.get("goalType");
	    String targetKg = input.get("targetKg");
	    String duration = input.get("duration");
	    String gender = input.get("gender");
	   
	    


	    String prompt = String.format(
	        "Create a personalized Indian diet plan for a %s-year-old %s, weighing %s kg, who wants to %s %s kg in %s weeks. " +
	        "Include meals for breakfast, lunch, dinner, and snacks with meal timing. Ensure the plan is healthy, simple, and realistic.",
	        age, gender, weight, goal, targetKg, duration
	    );
         System.out.println(prompt);
	    return gptService.generateDietPlan(prompt);
	}

}
