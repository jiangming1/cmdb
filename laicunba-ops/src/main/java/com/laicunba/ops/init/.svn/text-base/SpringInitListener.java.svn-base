package com.laicunba.ops.init;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import com.laicunba.ops.constant.GloabConstant;
import com.laicunba.ops.service.TableAutoCreateService;
 
@Component
public class SpringInitListener implements ApplicationListener {
	public static boolean NEED_CREATE_TAB = true;

	@Autowired
	private TableAutoCreateService tableAutoCreateService;

	@Override
	public void onApplicationEvent(ApplicationEvent event) {
		if (NEED_CREATE_TAB) {
			NEED_CREATE_TAB = false;
			String webPath = GloabConstant.WEB_PATH;
			tableAutoCreateService.create();
		}
	}

}
