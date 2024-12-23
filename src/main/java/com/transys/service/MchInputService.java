package com.transys.service;

import java.util.concurrent.ExecutionException;

public interface MchInputService {
	public void mchInput(String plcPumbun, String plcDevice) throws InterruptedException, ExecutionException;

	public void mchInputTimer() throws InterruptedException, ExecutionException;	
}
