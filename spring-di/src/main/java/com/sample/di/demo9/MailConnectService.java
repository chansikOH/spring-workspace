package com.sample.di.demo9;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class MailConnectService {
	
	@Value("${mail.host}")
	private String host;
	@Value("${mail.port}")
	private int port;
	@Value("${mail.userid}")
	private String userid;
	@Value("${mail.userpwd}")
	private String userpwd;
	
	public void connect() {
		System.out.println("메일 서버 연결");
		System.out.println("호스트: " + host);
		System.out.println("포트번호: " + port);
		System.out.println("아이디: " + userid);
		System.out.println("비밀번호: " + userpwd);
	}
}
