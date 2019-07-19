package com.sample.di.demo4;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Demo4App {

	public static void main(String[] args) {
		String resource = "classpath:/com/sample/di/demo4/demo4.xml";
		ApplicationContext ctx = new ClassPathXmlApplicationContext(resource);
		
		EventNoticeService eventNoticeService = ctx.getBean("eventNoticeService", EventNoticeService.class);
		OrderService orderService = ctx.getBean("orderService", OrderService.class);
		
		eventNoticeService.notice("여름맞이 여름용품 50% 파격세일");
		orderService.sendOrderStatus();
	}
}
