package org.fitAI.service;

import org.fitAI.model.Entity.User;

public interface UserService {
	User registerUser(User user);

	User loginUser(String email, String password);
}
