package com.transys.async;

import java.util.concurrent.ExecutionException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.transys.service.ArrivedTabService;


public class ArrivedTabProcessor {
	
	@Autowired
	private ArrivedTabService arrivedTabService;	
	
	@Scheduled(fixedRate = 2000)
	public void handle() throws InterruptedException, ExecutionException{
		arrivedTabService.arrivedTabTimer();
	}
}
