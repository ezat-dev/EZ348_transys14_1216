package com.transys.domain;

public class ArrivedTab {

	
	//2024-11-30 추가(1~4호기 : 1, 5~7호기 : 2)
	private int serverSelect;	
	private String code;
	private String fireno;
	private String workdate;
	private String status;
	private String gearno;
	private String lotno;
	private String remark;
	
	
	
	public int getServerSelect() {
		return serverSelect;
	}
	public void setServerSelect(int serverSelect) {
		this.serverSelect = serverSelect;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getFireno() {
		return fireno;
	}
	public void setFireno(String fireno) {
		this.fireno = fireno;
	}
	public String getWorkdate() {
		return workdate;
	}
	public void setWorkdate(String workdate) {
		this.workdate = workdate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getGearno() {
		return gearno;
	}
	public void setGearno(String gearno) {
		this.gearno = gearno;
	}
	public String getLotno() {
		return lotno;
	}
	public void setLotno(String lotno) {
		this.lotno = lotno;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}
