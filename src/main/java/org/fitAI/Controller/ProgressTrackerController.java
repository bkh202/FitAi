package org.fitAI.Controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.Optional;

import org.fitAI.model.Entity.ProgressTracker;
import org.fitAI.repository.ProgressTrackerRepository;
import org.fitAI.service.ProgressTrackerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProgressTrackerController {

    @Autowired
    private ProgressTrackerService service;

    @Autowired
    private ProgressTrackerRepository progressRepo;

    // 🟡 Show progress form & list
    @GetMapping("/dashboard/progress")
    public String showProgressPage(Model model, HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }
        List<ProgressTracker> progressList = service.getUserProgress(userId);
        model.addAttribute("progressList", progressList);
        return "progress";
    }

    // 🟢 Save Progress
    @PostMapping("/dashboard/saveProgress")
    public String saveProgress(
        @RequestParam("date") String date,
        @RequestParam("weight") float weight,
        @RequestParam("notes") String notes,
        @RequestParam("image") MultipartFile image,
        HttpSession session
    ) throws IOException {
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";

        String uploadDir = "D:/FitAI/user-progress-images/";
        String fileName = image.getOriginalFilename();

        if (!image.isEmpty()) {
            File dir = new File(uploadDir);
            if (!dir.exists()) dir.mkdirs();

            File file = new File(uploadDir + fileName);
            image.transferTo(file);
        }

        ProgressTracker p = new ProgressTracker();
        p.setUserId(userId);
        p.setDate(Date.valueOf(date));
        p.setWeight(weight);
        p.setNotes(notes);
        p.setImagePath(fileName);

        service.saveProgress(p);
        return "redirect:/dashboard/progressOverview";
    }

    // 🟣 Show Overview with Before/After
    @GetMapping("/dashboard/progressOverview")
    public String showProgressOverview(HttpSession session, Model model) {
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";

        List<ProgressTracker> progressList = service.getUserProgress(userId);
        model.addAttribute("progressList", progressList);

        if (!progressList.isEmpty()) {
            String beforeImage = progressList.get(0).getImagePath();
            String afterImage = progressList.get(progressList.size() - 1).getImagePath();
            model.addAttribute("beforeImage", beforeImage);
            model.addAttribute("afterImage", afterImage);
        }
        return "progressOverview";
    }

    // 🗑️ DELETE Progress
    @PostMapping("/dashboard/deleteProgress")
    public String deleteProgress(@RequestParam("id") int id, HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";

        Optional<ProgressTracker> progress = progressRepo.findById(id);
        if (progress.isPresent() && progress.get().getUserId()==userId) {
            progressRepo.deleteById(id);
        }
        return "redirect:/dashboard/progress";
    }

    // ✏️ LOAD Update Form
    @GetMapping("/dashboard/editProgress")
    public String editProgress(@RequestParam("id") int id, Model model, HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";

        Optional<ProgressTracker> p = progressRepo.findById(id);
        if (p.isPresent() && p.get().getUserId()==userId) {
            model.addAttribute("progress", p.get());
            return "editProgress"; // ➡️ JSP page to be created
        }

        return "redirect:/dashboard/progress";
    }

    // 📝 POST Update
    @PostMapping("/dashboard/updateProgress")
    public String updateProgress(
        @RequestParam("id") int id,
        @RequestParam("date") String date,
        @RequestParam("weight") float weight,
        @RequestParam("notes") String notes,
        @RequestParam("image") MultipartFile image,
        HttpSession session
    ) throws IOException {
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";

        Optional<ProgressTracker> pOpt = progressRepo.findById(id);
        if (pOpt.isPresent() && pOpt.get().getUserId()==userId) {
            ProgressTracker p = pOpt.get();
            p.setDate(Date.valueOf(date));
            p.setWeight(weight);
            p.setNotes(notes);

            if (!image.isEmpty()) {
                String uploadDir = "D:/FitAI/user-progress-images/";
                String fileName = image.getOriginalFilename();
                File file = new File(uploadDir + fileName);
                image.transferTo(file);
                p.setImagePath(fileName);
            }

            progressRepo.save(p);
        }

        return "redirect:/dashboard/progress";
    }

    // 🔃 SORT by Date Descending
    @GetMapping("/dashboard/bmi-history")
    public String showSortedProgressHistory(HttpSession session, Model model) {
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";

        List<ProgressTracker> progressList = progressRepo.findByUserIdOrderByDateDesc(userId);
        model.addAttribute("progressList", progressList);
        return "progress";
    }
}
