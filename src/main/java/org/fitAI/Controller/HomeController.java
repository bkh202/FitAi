package org.fitAI.Controller;

import org.fitAI.model.Entity.User;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

	@GetMapping("/")
	public String Home() {
		return "home";
	}

	@GetMapping("/dashboard")
	public String Index(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login";
		} else {
			return "dashboard";
		}
	}

	@GetMapping("/dashboard/supplement")
	public String Supplement(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login";
		} else {
			return "supplement";
		}
	}

	@GetMapping("/dashboard/supplement-result")
	public String SupplementResult(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login";
		} else {
			return "supplement-result";
		}
	}

	@GetMapping("/dashboard/aiDiet")
	public String AiDiet(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login";
		} else {
			return "aiDiet";
		}

	}

//	@GetMapping("/dashboard/progress")
//	public String Progress(HttpSession session) {
//		User user = (User) session.getAttribute("user");
//		if (user == null) {
//			return "redirect:/login";
//		} else {
//			return "progress";
//		}
//	}

	@GetMapping("/dashboard/healthTips")
	public String showHealthGoalPage(@RequestParam(required = false) String goal, HttpSession session) {
		if (session.getAttribute("user") == null)
			return "redirect:/login";

		if (goal == null)
			return "healthTips"; // must match healthTips.jsp

		switch (goal) {
		case "weightgain":
			return "weightgain";
		case "fatloss":
			return "fatloss";
		case "musclegain":
			return "musclegain";
		case "general":
			return "generalhealth";
		default:
			return "error";
		}
	}

	@GetMapping("/workout")
	public String showWorkoutByMuscleGroup(@RequestParam(required = false) String group, HttpSession session) {
		if (session.getAttribute("user") == null)
			return "redirect:/login";

		if (group == null)
			return "muscleGroups"; // default page agar koi group nahi diya ho

		switch (group.toLowerCase()) {
		case "chest":
			return "Chest";
		case "back":
			return "back";
		case "biceps":
			return "biceps";
		case "triceps":
			return "triceps";
		case "shoulders":
			return "shoulders";
		case "legs":
			return "legs";
		case "abs":
			return "abs";
		default:
			return "error"; // unknown group
		}
	}

	@GetMapping("/dashboard/healthTipsResult")
	public String showHealthTipsResult(@RequestParam String goal, Model model, HttpSession session) {
		if (session.getAttribute("user") == null)
			return "redirect:/login";

		model.addAttribute("goal", goal);
		return "healthTipsResult";
	}

	@GetMapping("/dashboard/WorkoutSuggest")
	public String Exercise(HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "redirect:/login";
		} else {
			return "WorkoutSuggest";
		}

	}

	@GetMapping("/aiWorkout")
	public String Workout(HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "redirect:/login";
		} else {
			return "aiWorkout";
		}

	}

	@GetMapping("/MuscleGroups")
	public String musclegroup(HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "redirect:/login";
		} else {
			return "MuscleGroups"; // ✅ Must match JSP name (without .jsp)
		}
	}

	@GetMapping("/bmi")
	public String Bmi() {
		return "bmi";
	}

	@GetMapping("/dashboard/waterIntake")
	public String Weightloss(HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "redirect:/login";
		} else {
			return "waterIntake";
		}

	}

	@GetMapping("/dashboard/chatbot")
	public String Weightgain(HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "redirect:/login";
		} else {
			return "chatbot";
		}

	}

}
