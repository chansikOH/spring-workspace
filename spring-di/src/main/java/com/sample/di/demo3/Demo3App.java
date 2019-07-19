package com.sample.di.demo3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Demo3App {

	public static void main(String[] args) {
		String resource = "classpath:/com/sample/di/demo3/demo3.xml";
		ApplicationContext ctx = new ClassPathXmlApplicationContext(resource);
		
		SampleController sampleController = ctx.getBean("sampleController", SampleController.class);
		String id = "hong";
		String password = "zxcv1234";
		sampleController.add(id, password);
	}
}