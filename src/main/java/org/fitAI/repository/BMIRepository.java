package org.fitAI.repository;

import java.util.List;

import org.fitAI.model.Entity.BMIRecord;
import org.fitAI.model.Entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BMIRepository extends JpaRepository<BMIRecord, Integer> {
	List<BMIRecord> findByUser(User user);
}
