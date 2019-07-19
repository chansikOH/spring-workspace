package kr.co.hta.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hta.dao.UserDao;
import kr.co.hta.exception.AlreadyUsedIdException;
import kr.co.hta.exception.LoginFailureException;
import kr.co.hta.vo.User;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	
	@Override
	public void registerUser(User user) {
		if(userDao.getUserById(user.getId()) != null) {
			throw new AlreadyUsedIdException("["+user.getId()+"] 는 이미 사용중인 아이디 입니다.");
		}
		
		userDao.addUser(user);
	}
	
	@Override
	public User loginUser(String id, String password) {
		User user = userDao.getUserById(id);
		if(user == null) {
			throw new LoginFailureException("아이디 혹은 비밀번호가 틀렸습니다.");
		}
		
		if(!user.getPassword().equals(password)) {
			throw new LoginFailureException("아이디 혹은 비밀번호가 틀렸습니다.");
		}
		
		return user;
	}
	
	@Override
	public User getUserById(String userId) {
		return userDao.getUserById(userId);
	}
}
