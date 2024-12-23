package com.transys.async;

import java.util.concurrent.ExecutionException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.transys.service.TrackingService3;


public class TrackingProcessor3 {
	
	@Autowired
	private TrackingService3 trackingService;	
	
	@Scheduled(fixedRate = 2000)
	public void handle() throws InterruptedException, ExecutionException{
		trackingService.ccf3Tracking01();
		trackingService.ccf3Tracking02();
		trackingService.ccf3Tracking03();
		trackingService.ccf3Tracking04();
		trackingService.ccf3Tracking05();
		trackingService.ccf3Tracking06();
		trackingService.ccf3Tracking07();
		trackingService.ccf3Tracking08();
		trackingService.ccf3Tracking09();
	}
}
