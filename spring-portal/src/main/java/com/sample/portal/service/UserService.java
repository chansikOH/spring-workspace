package com.sample.portal.service;

import com.sample.portal.vo.User;

public interface UserService {

	void registerUser(User user);
	User login(String id, String password);
	User getUserById(String id);
}