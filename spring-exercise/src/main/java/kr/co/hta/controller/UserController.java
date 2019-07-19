package kr.co.hta.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.hta.exception.AlreadyUsedIdException;
import kr.co.hta.exception.LoginFailureException;
import kr.co.hta.service.UserService;
import kr.co.hta.vo.User;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@ExceptionHandler(AlreadyUsedIdException.class)
	public String alreadyUsedIdExceptionHandler(AlreadyUsedIdException ex) {
		return "error/user/registerfail";
	}
	
	@ExceptionHandler(LoginFailureException.class)
	public String loginFailureExceptionHandler(LoginFailureException ex) {
		return "error/user/loginfail";
	}
	
	@RequestMapping("/registerform.do")
	public String form() {
		return "user/form";
	}
	
	@RequestMapping("/register.do")
	public String register(User user) {
		userService.registerUser(user);
		return "redirect:loginform.do";
	}

	@RequestMapping("/loginform.do")
	public String loginform() {
		return "user/loginform";
	}
	
	@RequestMapping("/login.do")
	public String login(@RequestParam("id") String id, @RequestParam("password") String password, HttpSession session) {
		User user = userService.loginUser(id, password);
		session.setAttribute("LOGIN_USER", user);
		
		String returnUrl = (String) session.getAttribute("returnUrl");
		String queryString = (String) session.getAttribute("queryString");
		session.removeAttribute("returnUrl");
		session.removeAttribute("queryString");
		
		String path = "redirect:home.do";
		if(returnUrl != null) {
			path = "redirect:" + returnUrl;
		}
		if(queryString != null) {
			path += "?" + queryString;
		}
		
		return path;
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:home.do";
	}
}
