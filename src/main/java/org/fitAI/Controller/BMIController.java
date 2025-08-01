package org.fitAI.Controller;

import java.time.LocalDate;
import java.util.Map;

import org.fitAI.model.Entity.BMIRecord;
import org.fitAI.model.Entity.User;
import org.fitAI.service.BMIService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpSession;

@RestController
public class BMIController {

	@Autowired
	private BMIService bmiService;

	@PostMapping("/api/save-bmi")
	public ResponseEntity<String> saveBMI(@RequestBody Map<String, Object> payload, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("User not logged in");
		}

		try {
			double height = Double.parseDouble(payload.get("height").toString());
			double weight = Double.parseDouble(payload.get("weight").toString());
			double bmi = Double.parseDouble(payload.get("bmi").toString());
			String category = payload.get("category").toString();

			BMIRecord record = new BMIRecord();
			record.setUser(user);
			record.setHeight(height);
			record.setWeight(weight);
			record.setBmi(bmi);
			record.setCategory(category);
			record.setDate(LocalDate.now());
			

			bmiService.saveBMI(record);

			return ResponseEntity.ok("Saved");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error saving BMI");
		}
	}
}
