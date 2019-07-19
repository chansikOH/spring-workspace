package com.sample.di.demo5;

public class PointDummyDao implements PointDao{

	public void updatePoint(String id, int point) {
		System.out.println("포인트 적립");
		System.out.println("포인트가 추가될 아이디 : " + id);
		System.out.println("추가될 포인트 : " + point);
		System.out.println();
	}
}
