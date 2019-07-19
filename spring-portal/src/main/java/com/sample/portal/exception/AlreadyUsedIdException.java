package com.sample.portal.exception;

public class AlreadyUsedIdException extends RuntimeException {

	public AlreadyUsedIdException(String message) {
		super(message);
	}
}
