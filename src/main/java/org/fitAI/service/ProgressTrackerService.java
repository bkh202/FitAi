package org.fitAI.service;

import java.util.List;

import org.fitAI.model.Entity.ProgressTracker;
import org.fitAI.repository.ProgressTrackerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProgressTrackerService {

	@Autowired
	private ProgressTrackerRepository repo;

	public void saveProgress(ProgressTracker progress) {
		repo.save(progress);
	}

	public List<ProgressTracker> getUserProgress(int userId) {
		return repo.findByUserIdOrderByDateAsc(userId);
	}
}
