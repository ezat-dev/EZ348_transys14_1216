package com.transys.async;

import java.util.concurrent.ExecutionException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.transys.service.TrackingService1;


public class TrackingProcessor1 {
	
	@Autowired
	private TrackingService1 trackingService;	
	
	@Scheduled(fixedRate = 2000)
	public void handle() throws InterruptedException, ExecutionException{
		trackingService.ccf1Tracking01();
		trackingService.ccf1Tracking02();
		trackingService.ccf1Tracking03();
		trackingService.ccf1Tracking04();
		trackingService.ccf1Tracking05();
		trackingService.ccf1Tracking06();
		trackingService.ccf1Tracking07();
		trackingService.ccf1Tracking08();
		trackingService.ccf1Tracking09();
	}
}
