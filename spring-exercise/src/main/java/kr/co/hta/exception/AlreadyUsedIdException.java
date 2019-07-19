package kr.co.hta.exception;

public class AlreadyUsedIdException extends RuntimeException {

	public AlreadyUsedIdException(String message) {
		super(message);
	}
}
