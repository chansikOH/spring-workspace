package com.sample.portal.service;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.portal.dao.UserDao;
import com.sample.portal.exception.AlreadyUsedIdException;
import com.sample.portal.exception.LoginFailureException;
import com.sample.portal.vo.User;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	
	@Override
	public void registerUser(User user) {
		if(userDao.getUserById(user.getId()) != null) {
			throw new AlreadyUsedIdException("["+user.getId()+"]는 이미 사용중인 아이디입니다.");
		}
		
		String md5Password = DigestUtils.md5Hex(user.getPassword());
		user.setPassword(md5Password);
		
		userDao.addUser(user);
		
	}
	
	@Override
	public User login(String id, String password) {
		User user = userDao.getUserById(id);
		if(user == null) {
			throw new LoginFailureException("아이디 혹은 비밀번호가 올바르지 않습니다.");
		}
		
		String md5Password = DigestUtils.md5Hex(password);
		if(!md5Password.equals(user.getPassword())) {
			throw new LoginFailureException("아이디 혹은 비밀번호가 올바르지 않습니다.");
		}
		
		return user;
	}
	
	@Override
	public User getUserById(String id) {
		return userDao.getUserById(id);
	}
}
