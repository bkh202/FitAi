package org.fitAI.Controller;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import org.fitAI.model.Entity.BMIRecord;
import org.fitAI.model.Entity.User;
import org.fitAI.repository.BMIRecordRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class BMIHistoryController {
    @Autowired
    private BMIRecordRepository bmiRecordRepo;
    
    @GetMapping("/bmi-history")
    public String showHistory(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        System.out.println("Fetching BMI history for user ID: " + user.getId());
        
        try {
            List<BMIRecord> history = bmiRecordRepo.findByUserIdOrderByDateDesc(user.getId());
            System.out.println("Found " + history.size() + " records");
            
            if (history.isEmpty()) {
                model.addAttribute("emptyHistory", true);
            } else {
                // Add formatted dates to model
                List<String> formattedDates = history.stream()
                    .map(record -> record.getDate().format(DateTimeFormatter.ofPattern("MMM dd")))
                    .collect(Collectors.toList());
                
                model.addAttribute("history", history);
                model.addAttribute("formattedDates", formattedDates);
                
                // Debug print first record
                if (!history.isEmpty()) {
                    BMIRecord first = history.get(0);
                    System.out.println("First record: " + first.getDate() + 
                                       " | Height: " + first.getHeight() +
                                       " | Weight: " + first.getWeight() +
                                       " | BMI: " + first.getBmi());
                }
            }
            return "bmi-history";
        } catch (Exception e) {
            System.err.println("Error fetching BMI history: " + e.getMessage());
            e.printStackTrace();
            model.addAttribute("error", "Error loading history: " + e.getMessage());
            return "bmi-history";
        }
    }
    
    //@Autowired

    @PostMapping("/deleteBMI")
    public String deleteBMI(@RequestParam("id") Integer id) {
    	 System.out.println("ID received for deletion: " + id);
        if (id != null) {
            bmiRecordRepo.deleteById(id);
        }
        return "redirect:/bmi-history";
    }
}