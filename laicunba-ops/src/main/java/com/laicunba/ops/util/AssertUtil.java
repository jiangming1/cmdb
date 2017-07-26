package com.laicunba.ops.util;

import com.laicunba.ops.exception.MyException;

public class AssertUtil {

	public static void assertTrue(boolean bool) {
		if (!bool) {
			throw new RuntimeException("期待true 但是实际为false");
		}
	}

	public static void assertFail(String code) {
		throw new MyException(code);
	}

	public static void assertNotNull(Object obj) {
		if (obj == null) {
			assertFail("obj为空!");
		}

	}

	public static void assertNotNull(Object obj, String code) {
		if (obj == null) {
			assertFail(code);
		}

	}

	public static void assertTrue(boolean bool, String code) {
		if (!bool) {
			throw new MyException(code);
		}
	}

	public static void assertFalse(boolean bool, String code) {
		if (bool) {
			throw new MyException(code);
		}

	}

}
