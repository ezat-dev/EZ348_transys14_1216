package com.transys.async;

import java.util.concurrent.ExecutionException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.transys.service.TrackingService5;


public class TrackingProcessor5 {
	
	@Autowired
	private TrackingService5 trackingService;	
	
	@Scheduled(fixedRate = 2000)
	public void handle() throws InterruptedException, ExecutionException{
		trackingService.cm1Tracking10_1();
		trackingService.cm1Tracking10_2();
		trackingService.cm1Tracking11_1();
		trackingService.cm1Tracking11_2();
		trackingService.cm1Tracking12();
	}
}
