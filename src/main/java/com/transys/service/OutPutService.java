package com.transys.service;

import java.util.concurrent.ExecutionException;

public interface OutPutService {

	void outPut(int devicecode);

	void outPutTimer() throws InterruptedException, ExecutionException;

}
