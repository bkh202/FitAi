package org.fitAI.repository;

import java.util.List;

import org.fitAI.model.Entity.ProgressTracker;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProgressTrackerRepository extends JpaRepository<ProgressTracker, Integer> {
	List<ProgressTracker> findByUserIdOrderByDateAsc(int userId);
	List<ProgressTracker> findByUserIdOrderByDateDesc(int userId);
	List<ProgressTracker> findTop5ByUserIdOrderByDateDesc(int userId);
}
