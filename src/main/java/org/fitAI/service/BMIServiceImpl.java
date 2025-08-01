package org.fitAI.service;

import java.util.List;

import org.fitAI.FitAIApplication;
import org.fitAI.model.Entity.BMIRecord;
import org.fitAI.model.Entity.User;
import org.fitAI.repository.BMIRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;

@Service
  @Transactional 
public class BMIServiceImpl implements BMIService {

    private final FitAIApplication fitAIApplication;

	@Autowired
	private BMIRepository bmiRepo;

    BMIServiceImpl(FitAIApplication fitAIApplication) {
        this.fitAIApplication = fitAIApplication;
    }

	@Override
	
	public void saveBMI(BMIRecord bmi) {
	
		bmiRepo.save(bmi);

	}

	@Override
	public List<BMIRecord> getBMIHistory(User user) {

		return bmiRepo.findByUser(user);
	}

}
