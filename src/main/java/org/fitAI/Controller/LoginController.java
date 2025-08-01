package org.fitAI.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {
	
   @GetMapping("/login")
   public String loginPage() {
	   return "login";
   }
   
   @GetMapping("/signup")
   
   public String signupPage() {
	   return "signup";
   }
   
   
   // Handle signup form POST
//   @PostMapping("/signup")
//   public String signup(HttpServletRequest req) {
//       // signup logic (as before)
//   }

   // Handle login form POST
//   @PostMapping("/login")
//   public String login(HttpServletRequest req, HttpSession session) {
//       // login logic (as before)
//   }

   // logout
//   @GetMapping("/logout")
//   public String logout(HttpSession session) {
//       session.invalidate();
//       return "redirect:/login";
//   }
//   
}
