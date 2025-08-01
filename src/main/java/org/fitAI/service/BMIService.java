package org.fitAI.service;

import java.util.List;

import org.fitAI.model.Entity.BMIRecord;
import org.fitAI.model.Entity.User;

public interface BMIService {

	void saveBMI(BMIRecord bmi);

	List<BMIRecord> getBMIHistory(User user);
}
