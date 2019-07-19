package com.sample.portal.dao;

import com.sample.portal.vo.User;

public interface UserDao {

	void addUser(User user);
	User getUserById(String userId);
}
