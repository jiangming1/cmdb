package com.laicunba.ops.exception;

public class MyException extends RuntimeException {
	private String code;

	public MyException(String code) {
		super(code);
		this.code = code;

	}

	public String getCode() {
		return code;
	}
}
