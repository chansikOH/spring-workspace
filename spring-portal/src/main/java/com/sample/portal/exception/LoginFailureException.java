package com.sample.portal.exception;

public class LoginFailureException extends RuntimeException {

	public LoginFailureException(String message) {
		super(message);
	}
}
