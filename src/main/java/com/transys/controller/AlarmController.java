package com.transys.controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.transys.domain.Alarm;
import com.transys.service.AlarmService;

@Controller
public class AlarmController {
	
	@Autowired
	private AlarmService alarmService;
	
	private static final Logger logger = LoggerFactory.getLogger(AlarmController.class);
	
	 // 알람 리스트
    @RequestMapping(value = "/alarm/alarmList", method = RequestMethod.GET)
    public String alarmList(Model model) {
        return "/alarm/alarmList.jsp"; 
    }
	 // 알람 썸
    @RequestMapping(value = "/alarm/alarmSum", method = RequestMethod.GET)
    public String alarmSum(Model model) {
        return "/alarm/alarmSum.jsp"; 
    }
	 // 알람 인포
    @RequestMapping(value = "/alarm/alarmInfo", method = RequestMethod.GET)
    public String alarmInfo(Model model) {
        return "/alarm/alarmInfo.jsp"; 
    }
    
    
    
    
    
    
    //알람썸 조회
    @RequestMapping(value = "/alarm/alarmSum/list", method = RequestMethod.POST)
    @ResponseBody
    public List<Alarm> getAlarmSummary(@RequestParam String alarmgroup,
    									@RequestParam String time) {

/*
        System.out.println("Received request:");
        System.out.println("alarmgroup: " + alarmgroup);
        System.out.println("DBTIME(년도): " + time);
*/

        Alarm alarm = new Alarm();
        alarm.setAlarmGroup(alarmgroup);
       
        alarm.setTime(time);
 

        return alarmService.getAlarmSummary(alarm);
    }
    
    
    
  
    
    
    
    
    
    //알람 리스트 조회
    @RequestMapping(value = "/alarm/alarmList/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> alarmList(
            @RequestParam String alarmgroup,
            @RequestParam String sDate,
            @RequestParam String eDate
    ) {
      //  System.out.println("Received request:");
     //   System.out.println("alarmgroup: " + alarmgroup);
     //   System.out.println("sDate: " + sDate);
     //   System.out.println("eDate: " + eDate);

        Map<String, Object> rtnMap = new HashMap<>();

        try {
            // 사용자가 시분초를 입력하지 않았다면 고정값으로 설정
            if (!sDate.contains(":")) {
                sDate += " 00:00:00";  // 기본 시작 시각: 00:00:00
            }
            if (!eDate.contains(":")) {
                eDate += " 23:59:59";  // 기본 종료 시각: 23:59:59
            }

            // 수정된 sDate와 eDate 값 프린트
      //      System.out.println("Processed sDate: " + sDate);
      //      System.out.println("Processed eDate: " + eDate);

            Alarm alarm = new Alarm();
            alarm.setAlarmGroup(alarmgroup);
            alarm.setSdate(sDate);
            alarm.setEdate(eDate);

            List<Alarm> alarmList = alarmService.getAlarmList(alarm);

      //      System.out.println("Alarm List Size: " + alarmList.size());

            for (Alarm alarmData : alarmList) {
                System.out.println("Tag Name: " + alarmData.getTagName());
                System.out.println("Total: " + alarmData.getTotal());
            }

            rtnMap.put("status", "success");
            rtnMap.put("last_page", 1);
            rtnMap.put("data", alarmList);
        } catch (Exception e) {
    //        System.out.println("Error occurred: " + e.getMessage());
            rtnMap.put("status", "error");
            rtnMap.put("message", e.getMessage());
        }

        return rtnMap;
    }
    
    //알람 리스트 엑셀
    @RequestMapping(value = "/alarm/alarmlist/excelDownload", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> alarmlistExcelDownload(
        @RequestParam String alarmgroup,
        @RequestParam String sDate,
        @RequestParam String eDate,
        HttpServletRequest request) {
        Map<String, Object> rtnMap = new HashMap<>();

        try {
            // 사용자가 시분초를 입력하지 않았다면 고정값으로 설정
            if (!sDate.contains(":")) {
                sDate += " 00:00:00";  // 기본 시작 시각: 00:00:00
            }
            if (!eDate.contains(":")) {
                eDate += " 23:59:59";  // 기본 종료 시각: 23:59:59
            }

            // 수정된 sDate와 eDate 값 프린트
           // System.out.println("Processed sDate: " + sDate);
          //  System.out.println("Processed eDate: " + eDate);

            Alarm alarm = new Alarm();
            alarm.setAlarmGroup(alarmgroup);
            alarm.setSdate(sDate);
            alarm.setEdate(eDate);

            SimpleDateFormat format = new SimpleDateFormat("yyMMdd_HHmmss");
            Date time = new Date();
            String now = format.format(time);

            FileOutputStream fos = null;
            FileInputStream fis = null;
            String openPath = "D:/엑셀_양식/"; 
            String savePath = request.getServletContext().getRealPath("/WEB-INF/resources/uploads/");

            List<Alarm> alarmList = alarmService.getAlarmList(alarm);

        //    System.out.println("알람 리스트:");
            for (int i = 0; i < alarmList.size(); i++) {
                Alarm w = alarmList.get(i);
                System.out.println("순번: " + (i + 1));
                System.out.println("설비명: " + w.getTagName());
                System.out.println("PLC ADDR: " + w.getAlarmState());
                System.out.println("경보내용: " + w.getAlarmState());
                System.out.println("발생시간" + w.getTime());
                System.out.println("해제시간" + w.getLead_alarmtime());
            }

            try {
                fis = new FileInputStream(openPath + "EZ348)트랜시스양식_경보정보.xlsx");

                XSSFWorkbook workbook = new XSSFWorkbook(fis);
                FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();
                XSSFSheet sheet = workbook.getSheetAt(0);
                Row row = null;
                Cell cell = null;

                XSSFCellStyle styleCenter = workbook.createCellStyle();
                styleCenter.setAlignment(HorizontalAlignment.CENTER);  // 중앙 정렬
                styleCenter.setVerticalAlignment(VerticalAlignment.CENTER);  // 세로 중앙 정렬

                XSSFCellStyle styleLeft = workbook.createCellStyle();
                styleLeft.setAlignment(HorizontalAlignment.LEFT);  // 왼쪽 정렬
                styleLeft.setVerticalAlignment(VerticalAlignment.CENTER);  // 세로 중앙 정렬

                XSSFCellStyle styleRight = workbook.createCellStyle();
                styleRight.setAlignment(HorizontalAlignment.RIGHT);  // 오른쪽 정렬
                styleRight.setVerticalAlignment(VerticalAlignment.CENTER);  // 세로 중앙 정렬


                row = sheet.getRow(4);  
                if (row == null) row = sheet.createRow(4);
                cell = row.createCell(8); 
                cell.setCellValue(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
                cell.setCellStyle(styleLeft);  

                // 연도값을 표시
                row = sheet.getRow(5);  
                if (row == null) row = sheet.createRow(5);
                cell = row.createCell(3);  
                cell.setCellValue(alarm.getTime());  // 연도 값을 설정

                row = sheet.getRow(4);  
                if (row == null) row = sheet.createRow(4);
                cell = row.getCell(3);  
                if(cell == null) cell = row.createCell(3);            
                cell.setCellValue(alarmList.size());  
                cell.setCellStyle(styleLeft); 

                int startRow = 8;  
                for (int i = 0; i < alarmList.size(); i++) {
                    row = sheet.getRow(startRow + i); 
                    if (row == null) row = sheet.createRow(startRow + i);

                    cell = row.createCell(1);  
                    cell.setCellValue(i + 1);
                    cell.setCellStyle(styleCenter);  
                    
                    cell = row.createCell(2);  
                    cell.setCellValue(alarmList.get(i).getAlarmGroupLabel());
                    cell.setCellStyle(styleCenter);  

                    cell = row.createCell(3);  
                    cell.setCellValue(alarmList.get(i).getTagName());
                    cell.setCellStyle(styleLeft);  

                    cell = row.createCell(4);  
                    cell.setCellValue(alarmList.get(i).getAlarmDesc());
                    cell.setCellStyle(styleLeft);  

                   
                }

                workbook.setForceFormulaRecalculation(true);
                fos = new FileOutputStream(savePath + now + "_경보정보.xlsx");
                workbook.write(fos);
                workbook.close();
                fos.flush();

            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (fis != null) fis.close();
                    if (fos != null) fos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            rtnMap.put("data", savePath + now + "_경보정보.xlsx");
            return rtnMap;
        } catch (Exception e) {
            e.printStackTrace();
            rtnMap.put("error", "파일 처리 중 오류가 발생했습니다.");
            return rtnMap;
        }
    }

    //알라썸 엑셀
    @RequestMapping(value = "/alarm/alarmSum/excelDownload", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> workYearExcelDownload(@RequestParam String time,
            										 @RequestParam String alarmgroup,
            										 HttpServletRequest request) {
 
    	Map<String, Object> rtnMap = new HashMap<>();
        Alarm alarm = new Alarm();
        alarm.setAlarmGroup(alarmgroup);
        alarm.setTime(time); 


       
       
        SimpleDateFormat format = new SimpleDateFormat("yyMMdd_HHmmss");
        Date time1 = new Date();
        String now = format.format(time1);

        FileOutputStream fos = null;
        FileInputStream fis = null;
        String openPath = "D:/엑셀_양식/"; 
        String savePath = request.getServletContext().getRealPath("/WEB-INF/resources/uploads/");

        List<Alarm> alarmList = alarmService.getAlarmSummary(alarm);  
      
        //System.out.println("작업 년보 데이터 리스트:");
        for (int i = 0; i < alarmList.size(); i++) {
            Alarm w = alarmList.get(i);
          //System.out.println("순번: " + (i + 1));
          //System.out.println("getAlarmGroup: " + w.getAlarmGroup());
          //System.out.println("getTagName: " + w.getTagName());
          //System.out.println("getAlarmDesc: " + w.getAlarmDesc());
          //System.out.println("m01: " + w.getM01());
          //System.out.println("m02: " + w.getM02());
          //System.out.println("m03: " + w.getM03());
          //System.out.println("m04: " + w.getM04());
          //System.out.println("m05: " + w.getM05());
          //System.out.println("m06: " + w.getM06());
          //System.out.println("m07: " + w.getM07());
          //System.out.println("m08: " + w.getM08());
          //System.out.println("m09: " + w.getM09());
          //System.out.println("m10: " + w.getM10());
          //System.out.println("m11: " + w.getM11());
          //System.out.println("m12: " + w.getM12());
        }

        try {
            fis = new FileInputStream(openPath + "EZ348)트랜시스양식_발생경보누계.xlsx");

            XSSFWorkbook workbook = new XSSFWorkbook(fis);
            FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();
            XSSFSheet sheet = workbook.getSheetAt(0);
            Row row = null;
            Cell cell = null;

            XSSFCellStyle styleCenter = workbook.createCellStyle();
            styleCenter.setAlignment(HorizontalAlignment.CENTER);  // 중앙 정렬
            styleCenter.setVerticalAlignment(VerticalAlignment.CENTER);  // 세로 중앙 정렬

   
            XSSFCellStyle styleLeft = workbook.createCellStyle();
            styleLeft.setAlignment(HorizontalAlignment.LEFT);  // 왼쪽 정렬
            styleLeft.setVerticalAlignment(VerticalAlignment.CENTER);  // 세로 중앙 정렬

            
            XSSFCellStyle styleRight = workbook.createCellStyle();
            styleRight.setAlignment(HorizontalAlignment.RIGHT);  // 오른쪽 정렬
            styleRight.setVerticalAlignment(VerticalAlignment.CENTER);  // 세로 중앙 정렬
            

            
            row = sheet.getRow(4);  
            if (row == null) row = sheet.createRow(4);
            cell = row.createCell(15); 
            cell.setCellValue(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            cell.setCellStyle(styleCenter);  

            // 연도값을 표시
            row = sheet.getRow(5);  
            if (row == null) row = sheet.createRow(5);
            cell = row.createCell(3);  
            cell.setCellValue(alarm.getTime());  // 연도 값을 설정

            row = sheet.getRow(6);  
            if (row == null) row = sheet.createRow(6);
            cell = row.getCell(3);  
            if(cell == null) cell = row.createCell(3);            
            cell.setCellValue(alarmList.size());  
            cell.setCellStyle(styleLeft); 
            
            int startRow = 9;  
            for (int i = 0; i < alarmList.size(); i++) {
                row = sheet.getRow(startRow + i); 
                if (row == null) row = sheet.createRow(startRow + i);

                cell = row.createCell(1);  
                cell.setCellValue(i + 1);
                cell.setCellStyle(styleCenter);  

                cell = row.createCell(2);  
                cell.setCellValue(alarmList.get(i).getAlarmGroupLabel());
                cell.setCellStyle(styleLeft);  

                cell = row.createCell(3);  
                cell.setCellValue(alarmList.get(i).getTagName());
                cell.setCellStyle(styleCenter);  

                cell = row.createCell(4); 
                cell.setCellValue(alarmList.get(i).getAlarmDesc());
                cell.setCellStyle(styleCenter);  

  
                double m01 = alarmList.get(i).getM01();
                double m02 = alarmList.get(i).getM02();
                double m03 = alarmList.get(i).getM03();
                double m04 = alarmList.get(i).getM04();
                double m05 = alarmList.get(i).getM05();
                double m06 = alarmList.get(i).getM06();
                double m07 = alarmList.get(i).getM07();
                double m08 = alarmList.get(i).getM08();
                double m09 = alarmList.get(i).getM09();
                double m10 = alarmList.get(i).getM10();
                double m11 = alarmList.get(i).getM11();
                double m12 = alarmList.get(i).getM12();

              
                cell = row.createCell(5);  // M01
                cell.setCellValue(m01);
                cell.setCellStyle(styleCenter);  

                cell = row.createCell(6);  // M02
                cell.setCellValue(m02);
                cell.setCellStyle(styleCenter);  

                cell = row.createCell(7);  // M03
                cell.setCellValue(m03);
                cell.setCellStyle(styleCenter);  

                cell = row.createCell(8);  // M04
                cell.setCellValue(m04);
                cell.setCellStyle(styleCenter);  

                cell = row.createCell(9);  // M05
                cell.setCellValue(m05);
                cell.setCellStyle(styleCenter);  

                cell = row.createCell(10);  // M06
                cell.setCellValue(m06);
                cell.setCellStyle(styleCenter);  

                cell = row.createCell(11);  // M07
                cell.setCellValue(m07);
                cell.setCellStyle(styleCenter);  

                cell = row.createCell(12);  // M08
                cell.setCellValue(m08);
                cell.setCellStyle(styleCenter);  

                cell = row.createCell(13);  // M09
                cell.setCellValue(m09);
                cell.setCellStyle(styleCenter);  

                cell = row.createCell(14);  // M10
                cell.setCellValue(m10);
                cell.setCellStyle(styleCenter);  

                cell = row.createCell(15);  // M11
                cell.setCellValue(m11);
                cell.setCellStyle(styleCenter);  

                cell = row.createCell(16);  // M12
                cell.setCellValue(m12);
                cell.setCellStyle(styleCenter);  

              
                double total = m01 + m02 + m03 + m04 + m05 + m06 + m07 + m08 + m09 + m10 + m11 + m12;

               
                cell = row.createCell(17); 
                cell.setCellValue(total);
                cell.setCellStyle(styleCenter);
            }

            workbook.setForceFormulaRecalculation(true);
            fos = new FileOutputStream(savePath + now + "_발생경보누계.xlsx");
            workbook.write(fos);
            workbook.close();
            fos.flush();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (fis != null) fis.close();
                if (fos != null) fos.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        rtnMap.put("data", savePath + now + "_발생경보누계.xlsx");
        return rtnMap;
    }

    
    @RequestMapping(value = "/alarm/alarmInfo/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> alarmInfo(
            @RequestParam(required = false) String alarmgroup
    ) {
     // System.out.println("=== Received request ===");
        System.out.println("alarmgroup: " + alarmgroup);

        Map<String, Object> rtnMap = new HashMap<>();

        try {
            // 공백을 제거한 alarmgroup 값을 사용
            alarmgroup = (alarmgroup != null) ? alarmgroup.trim() : null;

       //   System.out.println("Before service call: alarmgroup = " + alarmgroup);

            Alarm alarm = new Alarm();
            alarm.setAlarmGroup(alarmgroup);

            List<Alarm> alarmList = alarmService.getAlarmInfo(alarm);

         // System.out.println("Alarm List Size: " + alarmList.size());
            for (Alarm alarmData : alarmList) {
           //   System.out.println("getAlarmGroup: " + alarmData.getAlarmGroup());
           //   System.out.println("Alarm Desc: " + alarmData.getAlarmDesc());
            }

            rtnMap.put("status", "success");
            rtnMap.put("last_page", 1);
            rtnMap.put("data", alarmList);

        } catch (Exception e) {
        //  System.out.println("Error occurred: " + e.getMessage());
            rtnMap.put("status", "error");
            rtnMap.put("message", e.getMessage());
        }

        return rtnMap;
    }

}