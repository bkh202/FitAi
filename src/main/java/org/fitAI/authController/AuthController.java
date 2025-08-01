package org.fitAI.authController;

import org.fitAI.model.Entity.User;
import org.fitAI.repository.UserRepository;
import org.fitAI.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class AuthController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserRepository userRepo;

	@PostMapping("/signup")
	public String registerUser(@RequestParam String name,
	                           @RequestParam String email,
	                           @RequestParam String password,
	                           @RequestParam int age,
	                           @RequestParam String gender,
	                           Model model) {

	    User user = new User();
	    user.setName(name);
	    user.setEmail(email);
	    user.setPassword(password);
	    user.setAge(age);
	    user.setGender(gender);

	    userRepo.save(user);

	    return "redirect:/login";
	}

	@PostMapping("/login")
	public String login(@RequestParam String email, @RequestParam String password, HttpSession session) {
		User user = userService.loginUser(email, password);
		

		if (user != null) {
			session.setAttribute("user", user);
			session.setAttribute("userId", user.getId());
			System.out.println("Logged in userId: " + user.getId());
			System.out.println("Session userId: " + session.getAttribute("userId"));

			return "redirect:/dashboard";
		} else {
			session.setAttribute("msg", "Invalid credentials");
			return "login";
		}
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
}
