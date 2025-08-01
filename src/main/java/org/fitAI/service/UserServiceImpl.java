package org.fitAI.service;

import org.fitAI.model.Entity.User;
import org.fitAI.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepo;


	public User registerUser(User user) {

		return userRepo.save(user);
	}


	public User loginUser(String email, String password) {

		return userRepo.findByEmailAndPassword(email, password);
	}

}
