package com.transys.domain;

public class Util {
	
	//2024-11-30 추가(1~4호기 : 1, 5~7호기 : 2)
	private int serverSelect;
	
       private int electricYear; // 전기 연도
       private String deviceCode;   // 장치 코드
       private int m01;        // 1월
       private int m02;        // 2월
       private int m03;        // 3월
       private int m04;        // 4월
       private int m05;        // 5월
       private int m06;        // 6월
       private int m07;        // 7월
       private int m08;        // 8월
       private int m09;        // 9월
       private int m10;        // 10월
       private int m11;        // 11월
       private int m12;        // 12월
       private int Total;
       
       
      
      //t_lng_day테이블
       private int lngYear;
       private int lngMonth;
       private int lngDay;
   
       
       public int getServerSelect() {
		return serverSelect;
	}
	public void setServerSelect(int serverSelect) {
		this.serverSelect = serverSelect;
	}
	public int getTotal() {
         return Total;
      }
      public void setTotal(int total) {
         Total = total;
      }
       public int getElectricYear() {
         return electricYear;
      }
      public void setElectricYear(int electricYear) {
         this.electricYear = electricYear;
      }
      public String getDeviceCode() {
         return deviceCode;
      }
      public void setDeviceCode(String deviceCode) {
         this.deviceCode = deviceCode;
      }
      public int getM01() {
         return m01;
      }
      public void setM01(int m01) {
         this.m01 = m01;
      }
      public int getM02() {
         return m02;
      }
      public void setM02(int m02) {
         this.m02 = m02;
      }
      public int getM03() {
         return m03;
      }
      public void setM03(int m03) {
         this.m03 = m03;
      }
      public int getM04() {
         return m04;
      }
      public void setM04(int m04) {
         this.m04 = m04;
      }
      public int getM05() {
         return m05;
      }
      public void setM05(int m05) {
         this.m05 = m05;
      }
      public int getM06() {
         return m06;
      }
      public void setM06(int m06) {
         this.m06 = m06;
      }
      public int getM07() {
         return m07;
      }
      public void setM07(int m07) {
         this.m07 = m07;
      }
      public int getM08() {
         return m08;
      }
      public void setM08(int m08) {
         this.m08 = m08;
      }
      public int getM09() {
         return m09;
      }
      public void setM09(int m09) {
         this.m09 = m09;
      }
      public int getM10() {
         return m10;
      }
      public void setM10(int m10) {
         this.m10 = m10;
      }
      public int getM11() {
         return m11;
      }
      public void setM11(int m11) {
         this.m11 = m11;
      }
      public int getM12() {
         return m12;
      }
      public void setM12(int m12) {
         this.m12 = m12;
      }
      public int getLngYear() {
         return lngYear;
      }
      public void setLngYear(int lngYear) {
         this.lngYear = lngYear;
      }
      public int getLngMonth() {
         return lngMonth;
      }
      public void setLngMonth(int lngMonth) {
         this.lngMonth = lngMonth;
      }
      public int getLngDay() {
         return lngDay;
      }
      public void setLngDay(int lngDay) {
         this.lngDay = lngDay;
      }
      public int getLng1() {
         return lng1;
      }
      public void setLng1(int lng1) {
         this.lng1 = lng1;
      }
      public int getLng2() {
         return lng2;
      }
      public void setLng2(int lng2) {
         this.lng2 = lng2;
      }
      public int getLng3() {
         return lng3;
      }
      public void setLng3(int lng3) {
         this.lng3 = lng3;
      }
      public int getLng4() {
         return lng4;
      }
      public void setLng4(int lng4) {
         this.lng4 = lng4;
      }
      public int getLng5() {
         return lng5;
      }
      public void setLng5(int lng5) {
         this.lng5 = lng5;
      }
      public int getLng6() {
         return lng6;
      }
      public void setLng6(int lng6) {
         this.lng6 = lng6;
      }
      public int getLngSum() {
         return lngSum;
      }
      public void setLngSum(int lngSum) {
         this.lngSum = lngSum;
      }
      public String getWriteDayTime() {
         return writeDayTime;
      }
      public void setWriteDayTime(String writeDayTime) {
         this.writeDayTime = writeDayTime;
      }
      private int lng1;
       private int lng2;
       private int lng3;
       private int lng4;
       private int lng5;
       private int lng6;
       private int lngSum;
       private String writeDayTime;
       

    
   }