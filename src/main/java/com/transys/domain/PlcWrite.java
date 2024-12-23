package com.transys.domain;

public class PlcWrite {
	
	//2024-11-30 추가(1~4호기 : 1, 5~7호기 : 2)
	private int serverSelect;
	
	//t_waitlist
	private String list_year;
	private String devicecode;	
	private String lotno;
	private String pumcode;
	private String pumname;
	private String gijong;
	private short cycleno;
	private short agitate_rpm;
	private String common_device;
	private int loadcnt;
	private String pumbun;
	private int workday;
	private int seq;
	private String status;
	private String plc;
	private String datastatus;
	private String remark;
	private String meslot;
	private String put_area;
	
	
	
	
	//t_product 테이블
	private int cnt;
	private String writer;
	private String insertday;
	private String updateday;
	private String base_tmp1;
	private String base_tmp2;
	private String base_tmp3;
	private String base_tmp4;
	private String base_cp1;
	private String base_cp2;
	private String base_cp3;
	private String base_cyc1;
	private String base_cyc2;
	private String base_cyc3;
	private String base_cyc4;

	private String material;
	private String danjung;
	private String deepL;
	private String deepH;
	private String surfhard;
	private String deephard;
	private String inshard;
	private String cycletime;
	
	
	//workinline
	
	private String starttime;
	private String endtime;
	private String startcarb;
	private String endcarb;
	private String endsalt;
	private String startwash;
	private String endwash;
	private String endplan;
	private String BEGINSHOT;
	private String BEGINSHAK;
	private int realcnt;
	private float set_tmp1;
	private float action_tmp1;
	private float set_tmp2;
	private float action_tmp2;
	private float set_tmp3;
	private float action_tmp3;
	private float set_tmp4;
	private float action_tmp4;
	private float set_tmp6;
	private float action_tmp6;
	private float set_tmp7;
	private float action_tmp7;
	private float set_cp1;
	private float action_cp1;
	private float set_cp2;
	private float action_cp2;
	private float set_cp3;
	private float action_cp3;
	private String cyc1_time;
	private String cyc1_s;
	private String cyc1_e;
	private String cyc2_time;
	private String cyc2_s;
	private String cyc2_e;
	private String cyc3_time;
	private String cyc3_s;
	private String cyc3_e;
	private String cyc4_time;
	private String cyc4_s;
	private String cyc4_e;
	private int cur_location;
	private String datagubun;

	private String regtime;
	
	public int getServerSelect() {
		return serverSelect;
	}
	public void setServerSelect(int serverSelect) {
		this.serverSelect = serverSelect;
	}
	
	public String getRegtime() {
		return regtime;
	}
	public void setRegtime(String regtime) {
		this.regtime = regtime;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getStartcarb() {
		return startcarb;
	}
	public void setStartcarb(String startcarb) {
		this.startcarb = startcarb;
	}
	public String getEndcarb() {
		return endcarb;
	}
	public void setEndcarb(String endcarb) {
		this.endcarb = endcarb;
	}
	public String getEndsalt() {
		return endsalt;
	}
	public void setEndsalt(String endsalt) {
		this.endsalt = endsalt;
	}
	public String getStartwash() {
		return startwash;
	}
	public void setStartwash(String startwash) {
		this.startwash = startwash;
	}
	public String getEndwash() {
		return endwash;
	}
	public void setEndwash(String endwash) {
		this.endwash = endwash;
	}
	public String getEndplan() {
		return endplan;
	}
	public void setEndplan(String endplan) {
		this.endplan = endplan;
	}
	public String getBEGINSHOT() {
		return BEGINSHOT;
	}
	public void setBEGINSHOT(String bEGINSHOT) {
		BEGINSHOT = bEGINSHOT;
	}
	public String getBEGINSHAK() {
		return BEGINSHAK;
	}
	public void setBEGINSHAK(String bEGINSHAK) {
		BEGINSHAK = bEGINSHAK;
	}
	public int getRealcnt() {
		return realcnt;
	}
	public void setRealcnt(int realcnt) {
		this.realcnt = realcnt;
	}
	public float getSet_tmp1() {
		return set_tmp1;
	}
	public void setSet_tmp1(float set_tmp1) {
		this.set_tmp1 = set_tmp1;
	}
	public float getAction_tmp1() {
		return action_tmp1;
	}
	public void setAction_tmp1(float action_tmp1) {
		this.action_tmp1 = action_tmp1;
	}
	public float getSet_tmp2() {
		return set_tmp2;
	}
	public void setSet_tmp2(float set_tmp2) {
		this.set_tmp2 = set_tmp2;
	}
	public float getAction_tmp2() {
		return action_tmp2;
	}
	public void setAction_tmp2(float action_tmp2) {
		this.action_tmp2 = action_tmp2;
	}
	public float getSet_tmp3() {
		return set_tmp3;
	}
	public void setSet_tmp3(float set_tmp3) {
		this.set_tmp3 = set_tmp3;
	}
	public float getAction_tmp3() {
		return action_tmp3;
	}
	public void setAction_tmp3(float action_tmp3) {
		this.action_tmp3 = action_tmp3;
	}
	public float getSet_tmp4() {
		return set_tmp4;
	}
	public void setSet_tmp4(float set_tmp4) {
		this.set_tmp4 = set_tmp4;
	}
	public float getAction_tmp4() {
		return action_tmp4;
	}
	public void setAction_tmp4(float action_tmp4) {
		this.action_tmp4 = action_tmp4;
	}
	public float getSet_tmp6() {
		return set_tmp6;
	}
	public void setSet_tmp6(float set_tmp6) {
		this.set_tmp6 = set_tmp6;
	}
	public float getAction_tmp6() {
		return action_tmp6;
	}
	public void setAction_tmp6(float action_tmp6) {
		this.action_tmp6 = action_tmp6;
	}
	public float getSet_tmp7() {
		return set_tmp7;
	}
	public void setSet_tmp7(float set_tmp7) {
		this.set_tmp7 = set_tmp7;
	}
	public float getAction_tmp7() {
		return action_tmp7;
	}
	public void setAction_tmp7(float action_tmp7) {
		this.action_tmp7 = action_tmp7;
	}
	public float getSet_cp1() {
		return set_cp1;
	}
	public void setSet_cp1(float set_cp1) {
		this.set_cp1 = set_cp1;
	}
	public float getAction_cp1() {
		return action_cp1;
	}
	public void setAction_cp1(float action_cp1) {
		this.action_cp1 = action_cp1;
	}
	public float getSet_cp2() {
		return set_cp2;
	}
	public void setSet_cp2(float set_cp2) {
		this.set_cp2 = set_cp2;
	}
	public float getAction_cp2() {
		return action_cp2;
	}
	public void setAction_cp2(float action_cp2) {
		this.action_cp2 = action_cp2;
	}
	public float getSet_cp3() {
		return set_cp3;
	}
	public void setSet_cp3(float set_cp3) {
		this.set_cp3 = set_cp3;
	}
	public float getAction_cp3() {
		return action_cp3;
	}
	public void setAction_cp3(float action_cp3) {
		this.action_cp3 = action_cp3;
	}
	public String getCyc1_time() {
		return cyc1_time;
	}
	public void setCyc1_time(String cyc1_time) {
		this.cyc1_time = cyc1_time;
	}
	public String getCyc1_s() {
		return cyc1_s;
	}
	public void setCyc1_s(String cyc1_s) {
		this.cyc1_s = cyc1_s;
	}
	public String getCyc1_e() {
		return cyc1_e;
	}
	public void setCyc1_e(String cyc1_e) {
		this.cyc1_e = cyc1_e;
	}
	public String getCyc2_time() {
		return cyc2_time;
	}
	public void setCyc2_time(String cyc2_time) {
		this.cyc2_time = cyc2_time;
	}
	public String getCyc2_s() {
		return cyc2_s;
	}
	public void setCyc2_s(String cyc2_s) {
		this.cyc2_s = cyc2_s;
	}
	public String getCyc2_e() {
		return cyc2_e;
	}
	public void setCyc2_e(String cyc2_e) {
		this.cyc2_e = cyc2_e;
	}
	public String getCyc3_time() {
		return cyc3_time;
	}
	public void setCyc3_time(String cyc3_time) {
		this.cyc3_time = cyc3_time;
	}
	public String getCyc3_s() {
		return cyc3_s;
	}
	public void setCyc3_s(String cyc3_s) {
		this.cyc3_s = cyc3_s;
	}
	public String getCyc3_e() {
		return cyc3_e;
	}
	public void setCyc3_e(String cyc3_e) {
		this.cyc3_e = cyc3_e;
	}
	public String getCyc4_time() {
		return cyc4_time;
	}
	public void setCyc4_time(String cyc4_time) {
		this.cyc4_time = cyc4_time;
	}
	public String getCyc4_s() {
		return cyc4_s;
	}
	public void setCyc4_s(String cyc4_s) {
		this.cyc4_s = cyc4_s;
	}
	public String getCyc4_e() {
		return cyc4_e;
	}
	public void setCyc4_e(String cyc4_e) {
		this.cyc4_e = cyc4_e;
	}
	public int getCur_location() {
		return cur_location;
	}
	public void setCur_location(int cur_location) {
		this.cur_location = cur_location;
	}
	public String getDatagubun() {
		return datagubun;
	}
	public void setDatagubun(String datagubun) {
		this.datagubun = datagubun;
	}


	
	

		private String dobun;
		public String getDobun() {
			return dobun;
		}
		public void setDobun(String dobun) {
			this.dobun = dobun;
		}
		public int getCnt() {
			return cnt;
		}
		public void setCnt(int cnt) {
			this.cnt = cnt;
		}
		public String getWriter() {
			return writer;
		}
		public void setWriter(String writer) {
			this.writer = writer;
		}
		public String getInsertday() {
			return insertday;
		}
		public void setInsertday(String insertday) {
			this.insertday = insertday;
		}
		public String getUpdateday() {
			return updateday;
		}
		public void setUpdateday(String updateday) {
			this.updateday = updateday;
		}
		public String getBase_tmp1() {
			return base_tmp1;
		}
		public void setBase_tmp1(String base_tmp1) {
			this.base_tmp1 = base_tmp1;
		}
		public String getBase_tmp2() {
			return base_tmp2;
		}
		public void setBase_tmp2(String base_tmp2) {
			this.base_tmp2 = base_tmp2;
		}
		public String getBase_tmp3() {
			return base_tmp3;
		}
		public void setBase_tmp3(String base_tmp3) {
			this.base_tmp3 = base_tmp3;
		}
		public String getBase_tmp4() {
			return base_tmp4;
		}
		public void setBase_tmp4(String base_tmp4) {
			this.base_tmp4 = base_tmp4;
		}
		public String getBase_cp1() {
			return base_cp1;
		}
		public void setBase_cp1(String base_cp1) {
			this.base_cp1 = base_cp1;
		}
		public String getBase_cp2() {
			return base_cp2;
		}
		public void setBase_cp2(String base_cp2) {
			this.base_cp2 = base_cp2;
		}
		public String getBase_cp3() {
			return base_cp3;
		}
		public void setBase_cp3(String base_cp3) {
			this.base_cp3 = base_cp3;
		}
		public String getBase_cyc1() {
			return base_cyc1;
		}
		public void setBase_cyc1(String base_cyc1) {
			this.base_cyc1 = base_cyc1;
		}
		public String getBase_cyc2() {
			return base_cyc2;
		}
		public void setBase_cyc2(String base_cyc2) {
			this.base_cyc2 = base_cyc2;
		}
		public String getBase_cyc3() {
			return base_cyc3;
		}
		public void setBase_cyc3(String base_cyc3) {
			this.base_cyc3 = base_cyc3;
		}
		public String getBase_cyc4() {
			return base_cyc4;
		}
		public void setBase_cyc4(String base_cyc4) {
			this.base_cyc4 = base_cyc4;
		}
		public String getMaterial() {
			return material;
		}
		public void setMaterial(String material) {
			this.material = material;
		}
		public String getDanjung() {
			return danjung;
		}
		public void setDanjung(String danjung) {
			this.danjung = danjung;
		}
		public String getDeepL() {
			return deepL;
		}
		public void setDeepL(String deepL) {
			this.deepL = deepL;
		}
		public String getDeepH() {
			return deepH;
		}
		public void setDeepH(String deepH) {
			this.deepH = deepH;
		}
		public String getSurfhard() {
			return surfhard;
		}
		public void setSurfhard(String surfhard) {
			this.surfhard = surfhard;
		}
		public String getDeephard() {
			return deephard;
		}
		public void setDeephard(String deephard) {
			this.deephard = deephard;
		}
		public String getInshard() {
			return inshard;
		}
		public void setInshard(String inshard) {
			this.inshard = inshard;
		}
		public String getCycletime() {
			return cycletime;
		}
		public void setCycletime(String cycletime) {
			this.cycletime = cycletime;
		}
		
	
	public String getList_year() {
		return list_year;
	}
	public void setList_year(String list_year) {
		this.list_year = list_year;
	}
	public String getDevicecode() {
		return devicecode;
	}
	public void setDevicecode(String devicecode) {
		this.devicecode = devicecode;
	}
	public String getLotno() {
		return lotno;
	}
	public void setLotno(String lotno) {
		this.lotno = lotno;
	}
	public String getPumcode() {
		return pumcode;
	}
	public void setPumcode(String pumcode) {
		this.pumcode = pumcode;
	}
	public String getPumname() {
		return pumname;
	}
	public void setPumname(String pumname) {
		this.pumname = pumname;
	}
	public String getGijong() {
		return gijong;
	}
	public void setGijong(String gijong) {
		this.gijong = gijong;
	}

	
	public short getCycleno() {
		return cycleno;
	}
	public void setCycleno(short cycleno) {
		this.cycleno = cycleno;
	}
	public short getAgitate_rpm() {
		return agitate_rpm;
	}
	public void setAgitate_rpm(short agitate_rpm) {
		this.agitate_rpm = agitate_rpm;
	}
	public String getCommon_device() {
		return common_device;
	}
	public void setCommon_device(String common_device) {
		this.common_device = common_device;
	}
	public int getLoadcnt() {
		return loadcnt;
	}
	public void setLoadcnt(int loadcnt) {
		this.loadcnt = loadcnt;
	}
	public String getPumbun() {
		return pumbun;
	}
	public void setPumbun(String pumbun) {
		this.pumbun = pumbun;
	}
	public int getWorkday() {
		return workday;
	}
	public void setWorkday(int workday) {
		this.workday = workday;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPlc() {
		return plc;
	}
	public void setPlc(String plc) {
		this.plc = plc;
	}
	public String getDatastatus() {
		return datastatus;
	}
	public void setDatastatus(String datastatus) {
		this.datastatus = datastatus;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getMeslot() {
		return meslot;
	}
	public void setMeslot(String meslot) {
		this.meslot = meslot;
	}
	public String getPut_area() {
		return put_area;
	}
	public void setPut_area(String put_area) {
		this.put_area = put_area;
	}
	
	
	
}
