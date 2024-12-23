package com.transys.async;

import java.util.concurrent.Executor;
import java.util.concurrent.ThreadPoolExecutor;

import org.springframework.aop.interceptor.AsyncUncaughtExceptionHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.AsyncConfigurer;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;

@Configuration
@EnableScheduling
@EnableAsync(proxyTargetClass = true)
public class CommConfig implements SchedulingConfigurer, AsyncConfigurer {

	@Override
	public void configureTasks(ScheduledTaskRegistrar taskRegistrar) {
		
		taskRegistrar.addCronTask(new Runnable() {
			@Override
			public void run() {
//				logCollector().collect();
			}
		}, "*/60 * * * * *");
		
	}

/*	
	@Bean
	public LogCollector logCollector() {
		return new LogCollector();
	}
*/
	@Bean
	public ThreadPoolTaskScheduler taskScheduler() {
		ThreadPoolTaskScheduler scheduler = new ThreadPoolTaskScheduler();
		scheduler.setPoolSize(4);
		scheduler.setRejectedExecutionHandler(new ThreadPoolExecutor.AbortPolicy());
		return scheduler;
	}

	@Bean
	public CommProcessor logProcessor() {
		return new CommProcessor();
	}

	@Bean
	public PlcWriteProcessor plcWriteProcessor() {
		return new PlcWriteProcessor();
	}
	
	@Bean
	public MchInputProcessor mchInputProcessor() {
		return new MchInputProcessor();
	}
	
	@Bean
	public OutPutProcessor outputProcessor() {
		return new OutPutProcessor();
	}
	
	@Bean
	public ArrivedTabProcessor arrivedTabProcessor() {
		return new ArrivedTabProcessor();
	}


	@Bean
	public TrackingProcessor1 trackingProcessor1() {
		return new TrackingProcessor1();
	}
	
	@Bean
	public TrackingProcessor2 trackingProcessor2() {
		return new TrackingProcessor2();
	}
	
	@Bean
	public TrackingProcessor3 trackingProcessor3() {
		return new TrackingProcessor3();
	}
	
	@Bean
	public TrackingProcessor4 trackingProcessor4() {
		return new TrackingProcessor4();
	}
	
	@Bean
	public TrackingProcessor5 trackingProcessor5() {
		return new TrackingProcessor5();
	}
	
	@Override
	public Executor getAsyncExecutor() {
		return taskScheduler();
	}

	@Override
	public AsyncUncaughtExceptionHandler getAsyncUncaughtExceptionHandler() {
		return new AsyncExceptionHandler();
	}

}