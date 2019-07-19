package com.sample.di.demo5;

public class UserService {

	private UserDao userDao;
	private PointDao pointDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	public void setPointDao(PointDao pointDao) {
		this.pointDao = pointDao;
	}
	
	public void addNewUser(String name, String id, String password) {
		userDao.insertUser(name, id, password);
		pointDao.updatePoint(id, 10);
	}
}
