package com.transys.async;

import java.util.concurrent.ExecutionException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.transys.service.PlcWriteService;


public class PlcWriteProcessor {
	
	@Autowired
	private PlcWriteService plcWriteService;	
	
	@Scheduled(fixedRate = 10000)
	public void handle() throws InterruptedException, ExecutionException{
		plcWriteService.plcWriteTimer();
	}
}
