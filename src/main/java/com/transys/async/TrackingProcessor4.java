package com.transys.async;

import java.util.concurrent.ExecutionException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.transys.service.TrackingService4;


public class TrackingProcessor4 {
	
	@Autowired
	private TrackingService4 trackingService;	
	
	@Scheduled(fixedRate = 2000)
	public void handle() throws InterruptedException, ExecutionException{
		trackingService.ccf4Tracking01();
		trackingService.ccf4Tracking02();
		trackingService.ccf4Tracking03();
		trackingService.ccf4Tracking04();
		trackingService.ccf4Tracking05();
		trackingService.ccf4Tracking06();
		trackingService.ccf4Tracking07();
		trackingService.ccf4Tracking08();
		trackingService.ccf4Tracking09();
	}
}
