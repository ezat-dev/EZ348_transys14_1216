package com.transys.async;

import java.util.concurrent.ExecutionException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.transys.service.MchInputService;


public class MchInputProcessor {
	
	@Autowired
	private MchInputService mchInputService;	
	
	@Scheduled(fixedRate = 2000)
	public void handle() throws InterruptedException, ExecutionException{
		mchInputService.mchInputTimer();
	}
}
