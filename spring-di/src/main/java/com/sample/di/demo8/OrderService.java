package com.sample.di.demo8;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService {
	
	@Resource(name = "orderOracleDao")
	private OrderDao orderDao;

	@Resource
	private UserDao userDao;
	
	@Resource
	private ProductDao productDao;
	
}
