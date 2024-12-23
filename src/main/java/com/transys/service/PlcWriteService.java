package com.transys.service;

import java.util.concurrent.ExecutionException;

public interface PlcWriteService {

	void plcWrite() throws InterruptedException, ExecutionException;
	
	public void plcWriteTimer() throws InterruptedException, ExecutionException;
}
