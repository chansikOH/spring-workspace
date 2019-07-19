package kr.co.hta.dao;

import kr.co.hta.vo.User;

public interface UserDao {

	void addUser(User user);
	User getUserById(String userId);
}
