package com.liveamonth.liveamonth;

import com.liveamonth.liveamonth.controller.signController.SignController;
import com.liveamonth.liveamonth.model.service.signService.SignService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class LiveAmonthApplicationTests {
	@Autowired private SignService signService1;
	@Autowired private SignService signService2;

	@Test
	void contextLoads() {

	}

}
