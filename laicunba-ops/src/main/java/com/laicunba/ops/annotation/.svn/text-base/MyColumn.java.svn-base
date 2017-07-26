package com.laicunba.ops.annotation;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.RUNTIME)
public @interface MyColumn {

	/**
	 * 字段类型
	 * 
	 * @return
	 */
	String type() default "";

	/**
	 * 字段名
	 * 
	 * @return
	 */
	String name() default "";

	/**
	 * 主键
	 * 
	 * @return
	 */
	boolean key() default false;

}
