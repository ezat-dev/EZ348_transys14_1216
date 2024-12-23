package com.transys.async;

import java.util.concurrent.ExecutionException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.transys.service.TrackingService2;


public class TrackingProcessor2 {
	
	@Autowired
	private TrackingService2 trackingService;	
	
	@Scheduled(fixedRate = 2000)
	public void handle() throws InterruptedException, ExecutionException{
		trackingService.ccf2Tracking01();
		trackingService.ccf2Tracking02();
		trackingService.ccf2Tracking03();
		trackingService.ccf2Tracking04();
		trackingService.ccf2Tracking05();
		trackingService.ccf2Tracking06();
		trackingService.ccf2Tracking07();
		trackingService.ccf2Tracking08();
		trackingService.ccf2Tracking09();
	}
}
