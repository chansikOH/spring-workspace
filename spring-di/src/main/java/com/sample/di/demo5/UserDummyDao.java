package com.sample.di.demo5;

public class UserDummyDao implements UserDao{
	
	public void insertUser(String name, String id, String password) {
		System.out.println("사용자 등록");
		System.out.println("등록 이름 : " + name);
		System.out.println("등록 아이디 : " + id);
		System.out.println("등록 비밀번호 : " + password);
		System.out.println();
	}
}
