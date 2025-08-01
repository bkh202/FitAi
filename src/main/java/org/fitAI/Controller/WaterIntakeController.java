package org.fitAI.Controller;



import java.time.LocalDateTime;

import org.fitAI.model.Entity.WaterLog;
import org.fitAI.repository.WaterLogRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class WaterIntakeController {

	
	@PostMapping("/dashboard/water-intake")
	public String calculateWaterIntake(@RequestParam double weight,
	                                   @RequestParam String gender,
	                                   @RequestParam String activity,
	                                   @RequestParam String climate,
	                                   HttpServletRequest request) {

	    double intake = weight * 0.033; // Base: 33ml per kg

	    if (gender.equals("male")) intake += 0.2;
	    if (activity.equals("moderate")) intake += 0.3;
	    else if (activity.equals("high")) intake += 0.5;
	    if (climate.equals("hot")) intake += 0.4;

	    request.setAttribute("waterIntake", intake);
	    return "waterIntake"; // Renders waterIntake.jsp with result
	}

}
