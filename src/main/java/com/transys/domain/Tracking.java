package com.transys.domain;

public class Tracking {

	
	//2024-11-30 추가(1~4호기 : 1, 5~7호기 : 2)
	private int serverSelect;	
	private String devicecode;
	private String pumbun;
	private int curLocation;
	
	
	public int getServerSelect() {
		return serverSelect;
	}
	public void setServerSelect(int serverSelect) {
		this.serverSelect = serverSelect;
	}
	public String getDevicecode() {
		return devicecode;
	}
	public void setDevicecode(String devicecode) {
		this.devicecode = devicecode;
	}
	public String getPumbun() {
		return pumbun;
	}
	public void setPumbun(String pumbun) {
		this.pumbun = pumbun;
	}
	public int getCurLocation() {
		return curLocation;
	}
	public void setCurLocation(int curLocation) {
		this.curLocation = curLocation;
	}
	
	
}
