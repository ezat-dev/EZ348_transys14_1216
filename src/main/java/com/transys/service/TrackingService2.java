package com.transys.service;

import java.util.concurrent.ExecutionException;

public interface TrackingService2 {
	
	public void trackingDataSet(String devicecode, int curLocation, String setDataDir) throws InterruptedException, ExecutionException;
	public void ccf2Tracking01() throws InterruptedException, ExecutionException;
	public void ccf2Tracking02() throws InterruptedException, ExecutionException;
	public void ccf2Tracking03() throws InterruptedException, ExecutionException;
	public void ccf2Tracking04() throws InterruptedException, ExecutionException;
	public void ccf2Tracking05() throws InterruptedException, ExecutionException;
	public void ccf2Tracking06() throws InterruptedException, ExecutionException;
	public void ccf2Tracking07() throws InterruptedException, ExecutionException;
	public void ccf2Tracking08() throws InterruptedException, ExecutionException;
	public void ccf2Tracking09() throws InterruptedException, ExecutionException;
}
