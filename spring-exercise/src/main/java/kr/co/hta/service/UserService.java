package kr.co.hta.service;

import kr.co.hta.vo.User;

public interface UserService {

	void registerUser(User user);
	User loginUser(String id, String password);
	
	User getUserById(String userId);
}
