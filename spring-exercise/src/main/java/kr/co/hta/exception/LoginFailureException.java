package kr.co.hta.exception;

public class LoginFailureException extends RuntimeException {

	public LoginFailureException(String message) {
		super(message);
	}
}
