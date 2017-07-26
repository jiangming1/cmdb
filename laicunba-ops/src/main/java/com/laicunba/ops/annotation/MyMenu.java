package com.laicunba.ops.annotation;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.RUNTIME)
public @interface MyMenu {
	/**
	 * 菜单名称 <br/>
	 * 取名规则: 菜单名<XXX><br/>
	 * <font color=red>尖括号里面的内容不会被显示,菜单名不能重复,会利用菜单名生成唯一ID</font>
	 * 
	 * @return
	 */
	String name();

	/**
	 * 注册到指定的位置
	 * 
	 * @return
	 */
	String regist();

	String target();

	/**
	 * 默认的URl地址
	 * 
	 * @return
	 */
	String url() default "";

}
