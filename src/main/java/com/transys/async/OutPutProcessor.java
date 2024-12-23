package com.transys.async;

import java.util.concurrent.ExecutionException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.transys.service.MchInputService;
import com.transys.service.OutPutService;


public class OutPutProcessor {
	
	@Autowired
	private OutPutService outPutService;	
	
	@Scheduled(fixedRate = 5000)
	public void handle() throws InterruptedException, ExecutionException{
		outPutService.outPutTimer();
	}
}
