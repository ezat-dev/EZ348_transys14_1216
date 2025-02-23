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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.transys.domain.Work;
import com.transys.service.WorkService;
@Controller
public class PrintController {
	
	 @Autowired
	   private WorkService workService;
	 
	 //열처리 일별 생산 일지
	    @RequestMapping(value= "/work/dayPrint", method = RequestMethod.GET)
	    public String workDayPrint(Model model) {       

	        return "/work/dayPrint.jsp"; // 
	    }
	    
	    
	 // 작업일보 상세 조회
	    @RequestMapping(value = "/work/dayPrint/list", method = RequestMethod.POST)
	    @ResponseBody
	    public Map<String, Object> workDayPrintList(@RequestParam String p_DATE) {

	        Map<String, Object> rtnMap = new HashMap<>();
	        Work work = new Work();
	        work.setP_DATE(p_DATE);

	        // t_siljuk, t_product 조인
	        List<Work> workList = workService.workDayPrint(work);

	        rtnMap.put("last_page", 1);
	        rtnMap.put("data", workList);

	        return rtnMap;
	    }
	    
	    //작업일보인쇄 검사값 수정
	    @RequestMapping(value = "/work/dayPrint/checkCntSet", method = RequestMethod.POST)
	    @ResponseBody
	    public Map<String, Object> workDayPrintListCheckCntSet(
	    		@RequestParam String deviceCode,
	    		@RequestParam String lotDate,
	    		@RequestParam String pumCode,
	    		@RequestParam int checkCnt) {
	    	
	    	Map<String, Object> rtnMap = new HashMap<>();
	    	Work work = new Work();
	    	work.setDevicecode(deviceCode);
	    	work.setP_DATE(lotDate);
	    	work.setPumcode(pumCode);
	    	work.setCheck_cnt(checkCnt);
	    	
	    	
	    	//2025-01-15추가 검사값 입력 수정
	    	workService.workDayPrintListCheckCntSet(work);
	    	
	    	return rtnMap;
	    }
	    
	    
	    @RequestMapping(value = "/work/dayPrint/excelDownload", method = RequestMethod.POST)
	    @ResponseBody
	    public Map<String, Object> workDayExcelDownload(@RequestParam String p_DATE,
	                                                    
	                                                    HttpServletRequest request) {

	        Map<String, Object> rtnMap = new HashMap<>();
	        Work work = new Work();
	        work.setP_DATE(p_DATE);

	        SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd_작업일보_HHmmss");
	        Date time = new Date();
	        String fileName = format.format(time) + ".xlsx"; // 최종 파일 이름


	        FileOutputStream fos = null;
	        FileInputStream fis = null;
	        String openPath = "D:/엑셀_양식/";
	        String savePath = "D:/생산일지/일간생산일지/";

	        List<Work> workList = workService.workDayPrint(work);
	        if (workList == null || workList.isEmpty()) {
	            rtnMap.put("error", "없음");
	            return rtnMap;
	        }

	        try {
	            fis = new FileInputStream(openPath + "EZ348)트랜시스양식_일간생산일지.xlsx");

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

	          

	            // 작업 데이터 행 추가 (B9부터 시작)
	            int startRow = 8;  // B9부터 시작하므로 startRow는 8
	            for (int i = 0; i < workList.size(); i++) {
	                row = sheet.getRow(startRow + i);
//	                if (row == null) row = sheet.createRow(startRow + i);

	                // 품명 (B9부터 시작)
	                cell = row.getCell(1); // B9부터 (품명)
	                cell.setCellValue(workList.get(i).getPumname() != null ? workList.get(i).getPumname() : "");
//	                cell.setCellStyle(styleLeft);

	                // 품명코드 (D9부터)
	                cell = row.getCell(3); // D9부터 (품명코드)
	                cell.setCellValue(workList.get(i).getPumcode() != null ? workList.get(i).getPumcode() : "");
//	                cell.setCellStyle(styleLeft);

	                // 기종 (F9부터)
	                cell = row.getCell(5); // F9부터 (기종)
	                cell.setCellValue(workList.get(i).getGijong() != null ? workList.get(i).getGijong() : "");
//	                cell.setCellStyle(styleLeft);

	                // Cycle (H9부터)
	                cell = row.getCell(7); // H9부터 (Cycle)
	                cell.setCellValue(workList.get(i).getCycleno() != null ? workList.get(i).getCycleno() : "");
//	                cell.setCellStyle(styleCenter);

/*
	             // 가동시간 (I9부터)
	                cell = row.getCell(8); // I9부터 (가동시간)
	                Integer trayTimeStr = workList.get(i).getTray_time();  // Integer로 변경
	                double trayTime = (trayTimeStr != null) ? trayTimeStr.doubleValue() : 0.0;  // null 체크 후 double로 변환
	                cell.setCellValue(trayTime);
//	                cell.setCellStyle(styleCenter);

	             // Tray (K9부터)
	                cell = row.getCell(10); // K9부터 (Tray)
	                int tray = workList.get(i).getCnt();  
	                cell.setCellValue((double) tray);  
//	                cell.setCellStyle(styleCenter);


	             // 생산수량 (L9부터)
	                cell = row.getCell(11); // L9부터 (생산수량)
	                int totalCnt = workList.get(i).getLoadcnt();  
	                cell.setCellValue((double) totalCnt);  
//	                cell.setCellStyle(styleCenter);

	                // 검사 (N9부터)
	                cell = row.getCell(13); // N9부터 (검사)
	                int checkCnt = workList.get(i).getCheck_cnt();  
	                cell.setCellValue((double) checkCnt);  
//	                cell.setCellStyle(styleCenter);

	                // 합계 (O9부터)
	                cell = row.getCell(14); // O9부터 (합계)
	                int sum = workList.get(i).getTotal_cnt();  
	                cell.setCellValue((double) sum); 
//	                cell.setCellStyle(styleCenter);
*/
	                
		             // 가동시간 (I9부터)
	                cell = row.getCell(8); // I9부터 (가동시간)	                                
	                Integer trayTimeStr = workList.get(i).getTray_time();  // Integer로 변경

	                int trayTime = (trayTimeStr != null) ? trayTimeStr.intValue() : null;  // null 체크 후 double로 변환
	                String setTrayTime = "";
	                if(workList.get(i).getPumname().contains("호기")) {
	                	setTrayTime = "";
	                }else {
	                	setTrayTime = trayTime+"";
	                }
	                cell.setCellValue(setTrayTime);
//	                cell.setCellStyle(styleCenter);

	             // Tray (K9부터)
	                cell = row.getCell(10); // K9부터 (Tray)
	                int tray = workList.get(i).getCnt();
	                String setTray = "";
	                if(workList.get(i).getPumname().contains("호기")) {
	                	setTray = "";
	                }else {
	                	setTray = tray+"";
	                }	                
	                cell.setCellValue(setTray);  
//	                cell.setCellStyle(styleCenter);


	             // 생산수량 (L9부터)
	                cell = row.getCell(11); // L9부터 (생산수량)
	                int totalCnt = workList.get(i).getTotal_cnt();
	                String setTotalCnt = "";
	                if(workList.get(i).getPumname().contains("호기")) {
	                	setTotalCnt = "";
	                }else {
	                	setTotalCnt = totalCnt+"";
	                }		                
	                cell.setCellValue(setTotalCnt);  
//	                cell.setCellStyle(styleCenter);

	                // 검사 (N9부터)
	                cell = row.getCell(13); // N9부터 (검사)
	                int checkCnt = workList.get(i).getCheck_cnt();
	                String setCheckCnt = "";
	                if(workList.get(i).getPumname().contains("호기")) {
	                	setCheckCnt = "";
	                }else {
	                	setCheckCnt = checkCnt+"";
	                }		                
	                cell.setCellValue(setCheckCnt);  
//	                cell.setCellStyle(styleCenter);

	                // 합계 (O9부터)
	                cell = row.getCell(14); // O9부터 (합계)
	                int sum = workList.get(i).getTotal_cnt();
	                String setSum = "";
	                if(workList.get(i).getPumname().contains("호기")) {
	                	setSum = "";
	                }else {
	                	setSum = sum+"";
	                }		                
	                cell.setCellValue(setSum); 
//	                cell.setCellStyle(styleCenter);

	                
	                
	            }

	            // 출력일자 설정 (N5)
	            row = sheet.getRow(4);  // N5는 row 4, cell 13
	            if (row == null) row = sheet.createRow(4);
	            cell = row.getCell(13); // N5
//	            if (cell == null) cell = row.createCell(13);
	            cell.setCellValue(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
//	            cell.setCellStyle(styleLeft);
	            
	            //생산일자 설정 p_DATE
	            row = sheet.getRow(5);  // N5는 row 4, cell 13
	            if (row == null) row = sheet.createRow(5);
	            cell = row.getCell(13); // N5
//	            if (cell == null) cell = row.createCell(13);
	            cell.setCellValue(p_DATE);
//	            cell.setCellStyle(styleLeft);

	            workbook.setForceFormulaRecalculation(true);
	            fos = new FileOutputStream(savePath + fileName); // 파일 저장
	            workbook.write(fos);
	            workbook.close();
	            fos.flush();

	            rtnMap.put("data", savePath + fileName); // 저장된 파일 경로 반환
	        } catch (Exception e) {
	            e.printStackTrace();
	            rtnMap.put("error", "엑셀 파일 생성 중 오류가 발생했습니다.");
	            return rtnMap;
	        } finally {
	            try {
	                if (fis != null) fis.close();
	                if (fos != null) fos.close();
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }

	        return rtnMap;
	    }

	    
	    //열처리 월별 생산 일지
	    @RequestMapping(value= "/work/monthPrint", method = RequestMethod.GET)
	    public String workMonthPrint(Model model) {       

	        return "/work/monthPrint.jsp"; // 
	    }
	    
	    
	    @RequestMapping(value = "/work/monthPrint/list", method = RequestMethod.POST)
	    @ResponseBody
	    public Map<String, Object> workMonthPrint(@RequestParam String p_DATE) {

	        // 입력된 p_DATE 값 출력
	        //System.out.println("p_DATE: " + p_DATE);

	        Map<String, Object> rtnMap = new HashMap<>();
	        Work work = new Work();
	        work.setP_DATE(p_DATE);

	        // t_siljuk, t_product 조인
	        List<Work> workList = workService.workMonthPrint(work);

	        // workList 내용 출력
	      //  System.out.println("workList: " + workList);

	        rtnMap.put("last_page", 1);
	        rtnMap.put("data", workList);

	        return rtnMap;
	    }

	    
	    @RequestMapping(value = "/work/monthPrint/excelDownload", method = RequestMethod.POST)
	    @ResponseBody
	    public Map<String, Object> workMonthExcelDownload(@RequestParam String p_DATE,
	                                                    
	                                                    HttpServletRequest request) {

	        Map<String, Object> rtnMap = new HashMap<>();
	        Work work = new Work();
	        work.setP_DATE(p_DATE);

	        SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd_작업월보_HHmmss");
	        Date time = new Date();
	        String fileName = format.format(time) + ".xlsx"; // 최종 파일 이름


	        FileOutputStream fos = null;
	        FileInputStream fis = null;
	        String openPath = "D:/엑셀_양식/";
	        String savePath = "D:/생산일지/월간생산일지/";

	        List<Work> workList = workService.workMonthPrint(work);
	        if (workList == null || workList.isEmpty()) {
	            rtnMap.put("error", "없음");
	            return rtnMap;
	        }

	        try {
	            fis = new FileInputStream(openPath + "EZ348)트랜시스양식_월간생산일지.xlsx");

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

	          

	         // 작업 데이터 행 추가 (B9부터 시작)
	            int startRow = 8;  // B9부터 시작하므로 startRow는 8
	            for (int i = 0; i < workList.size(); i++) {
	                row = sheet.getRow(startRow + i);
	                if (row == null) row = sheet.createRow(startRow + i); // row가 null일 경우 생성

	                // 품명 (B9부터 시작)
	                cell = row.getCell(1); // B9
	                if (cell == null) cell = row.createCell(1); // cell이 null일 경우 생성
	                cell.setCellValue(workList.get(i).getDate_feat() != null ? workList.get(i).getDate_feat() : "");

	                // 품명 (B9부터 시작)
	                cell = row.getCell(2); // C9
	                if (cell == null) cell = row.createCell(2); // cell이 null일 경우 생성
	                cell.setCellValue(workList.get(i).getPumname() != null ? workList.get(i).getPumname() : "");

	                // 품명코드 (D9부터)
	                cell = row.getCell(3); // D9
	                if (cell == null) cell = row.createCell(3); // cell이 null일 경우 생성
	                cell.setCellValue(workList.get(i).getPumcode() != null ? workList.get(i).getPumcode() : "");

	                // 기종 (F9부터)
	                cell = row.getCell(5); // F9
	                if (cell == null) cell = row.createCell(5); // cell이 null일 경우 생성
	                cell.setCellValue(workList.get(i).getGijong() != null ? workList.get(i).getGijong() : "");

	                // Cycle (H9부터)
	                cell = row.getCell(7); // H9
	                if (cell == null) cell = row.createCell(7); // cell이 null일 경우 생성
	                cell.setCellValue(workList.get(i).getCycleno() != null ? workList.get(i).getCycleno() : "");

	                // 가동시간 (I9부터)
	                cell = row.getCell(8); // I9
	                if (cell == null) cell = row.createCell(8); // cell이 null일 경우 생성
	                Integer trayTimeStr = workList.get(i).getTray_time();
	                double trayTime = (trayTimeStr != null) ? trayTimeStr.doubleValue() : 0.0; // null 체크 후 double로 변환
	                cell.setCellValue(trayTime);

	                // Tray (K9부터)
	                cell = row.getCell(10); // K9
	                if (cell == null) cell = row.createCell(10); // cell이 null일 경우 생성
	                int tray = workList.get(i).getCnt();
	                cell.setCellValue((double) tray);

	                // 생산수량 (L9부터)
	                cell = row.getCell(11); // L9
	                if (cell == null) cell = row.createCell(11); // cell이 null일 경우 생성
	                int totalCnt = workList.get(i).getTotal_cnt();
	                cell.setCellValue((double) totalCnt);

	                // 검사 (N9부터)
	                cell = row.getCell(13); // N9
	                if (cell == null) cell = row.createCell(13); // cell이 null일 경우 생성
	                int checkCnt = workList.get(i).getCheck_cnt();
	                cell.setCellValue((double) checkCnt);

	                // 합계 (O9부터)
	                cell = row.getCell(14); // O9
	                if (cell == null) cell = row.createCell(14); // cell이 null일 경우 생성
	                int sum = workList.get(i).getTotal_cnt();
	                cell.setCellValue((double) sum);
	            }


	            // 출력일자 설정 (N5)
	            row = sheet.getRow(4);  // N5는 row 4, cell 13
	            if (row == null) row = sheet.createRow(4);
	            cell = row.getCell(13); // N5
	            if (cell == null) cell = row.createCell(13);
	            cell.setCellValue(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
	            cell.setCellStyle(styleLeft);

	            workbook.setForceFormulaRecalculation(true);
	            fos = new FileOutputStream(savePath + fileName); // 파일 저장
	            workbook.write(fos);
	            workbook.close();
	            fos.flush();

	            rtnMap.put("data", savePath + fileName); // 저장된 파일 경로 반환
	        } catch (Exception e) {
	            e.printStackTrace();
	            rtnMap.put("error", "엑셀 파일 생성 중 오류가 발생했습니다.");
	            return rtnMap;
	        } finally {
	            try {
	                if (fis != null) fis.close();
	                if (fos != null) fos.close();
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }

	        return rtnMap;
	    }
	    //열처리 년별 생산 일지
	    @RequestMapping(value= "/work/yearPrint", method = RequestMethod.GET)
	    public String workYearPrint(Model model) {       

	        return "/work/yearPrint.jsp"; // 
	    }

	    
	    @RequestMapping(value = "/work/yearPrint/list", method = RequestMethod.POST)
	    @ResponseBody
	    public Map<String, Object> workYearPrint(@RequestParam String p_DATE) {

	        // 입력된 p_DATE 값 출력
	        //System.out.println("p_DATE: " + p_DATE);

	        Map<String, Object> rtnMap = new HashMap<>();
	        Work work = new Work();
	        work.setP_DATE(p_DATE);

	        // t_siljuk, t_product 조인
	        List<Work> workList = workService.workYearPrint(work);

	        // workList 내용 출력
	        //System.out.println("workList: " + workList);

	        rtnMap.put("last_page", 1);
	        rtnMap.put("data", workList);

	        return rtnMap;
	    }

	    
	    @RequestMapping(value = "/work/yearPrint/excelDownload", method = RequestMethod.POST)
	    @ResponseBody
	    public Map<String, Object> workYearExcelDownload(@RequestParam String p_DATE,
	                                                    
	                                                    HttpServletRequest request) {

	        Map<String, Object> rtnMap = new HashMap<>();
	        Work work = new Work();
	        work.setP_DATE(p_DATE);

	        SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd_작업연보_HHmmss");
	        Date time = new Date();
	        String fileName = format.format(time) + ".xlsx";

	        FileOutputStream fos = null;
	        FileInputStream fis = null;
	        String openPath = "D:/엑셀_양식/";
	        String savePath = "D:/생산일지/연간생산일지/";

	        List<Work> workList = workService.workYearPrint(work);
	        if (workList == null || workList.isEmpty()) {
	            rtnMap.put("error", "없음");
	            return rtnMap;
	        }

	        try {
	            fis = new FileInputStream(openPath + "EZ348)트랜시스양식_연간생산일지.xlsx");

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

	          



	                
	             // 작업 데이터 행 추가 (B9부터 시작)
	                int startRow = 8;  // B9부터 시작하므로 startRow는 8
	                for (int i = 0; i < workList.size(); i++) {
	                    row = sheet.getRow(startRow + i);
	                    if (row == null) row = sheet.createRow(startRow + i); // row가 null일 경우 생성

	                    // 품명 (B9부터 시작)
	                    cell = row.getCell(1); // B9
	                    if (cell == null) cell = row.createCell(1); // cell이 null일 경우 생성
	                    cell.setCellValue(workList.get(i).getDate_feat() != null ? workList.get(i).getDate_feat() : "");

	                    // 품명 (B9부터 시작)
	                    cell = row.getCell(2); // C9
	                    if (cell == null) cell = row.createCell(2);
	                    cell.setCellValue(workList.get(i).getPumname() != null ? workList.get(i).getPumname() : "");

	                    // 품명코드 (D9부터)
	                    cell = row.getCell(3); // D9
	                    if (cell == null) cell = row.createCell(3);
	                    cell.setCellValue(workList.get(i).getPumcode() != null ? workList.get(i).getPumcode() : "");

	                    // 기종 (F9부터)
	                    cell = row.getCell(5); // F9
	                    if (cell == null) cell = row.createCell(5);
	                    cell.setCellValue(workList.get(i).getGijong() != null ? workList.get(i).getGijong() : "");

	                    // Cycle (H9부터)
	                    cell = row.getCell(7); // H9
	                    if (cell == null) cell = row.createCell(7);
	                    cell.setCellValue(workList.get(i).getCycleno() != null ? workList.get(i).getCycleno() : "");

	                    // 가동시간 (I9부터)
	                    cell = row.getCell(8); // I9
	                    if (cell == null) cell = row.createCell(8);
	                    Integer trayTimeStr = workList.get(i).getTray_time();
	                    double trayTime = (trayTimeStr != null) ? trayTimeStr.doubleValue() : 0.0;
	                    cell.setCellValue(trayTime);

	                    // Tray (K9부터)
	                    cell = row.getCell(10); // K9
	                    if (cell == null) cell = row.createCell(10);
	                    int tray = workList.get(i).getCnt();
	                    cell.setCellValue((double) tray);

	                    // 생산수량 (L9부터)
	                    cell = row.getCell(11); // L9
	                    if (cell == null) cell = row.createCell(11);
	                    int totalCnt = workList.get(i).getTotal_cnt();
	                    cell.setCellValue((double) totalCnt);

	                    // 검사 (N9부터)
	                    cell = row.getCell(13); // N9
	                    if (cell == null) cell = row.createCell(13);
	                    int checkCnt = workList.get(i).getCheck_cnt();
	                    cell.setCellValue((double) checkCnt);

	                    // 합계 (O9부터)
	                    cell = row.getCell(14); // O9
	                    if (cell == null) cell = row.createCell(14);
	                    int sum = workList.get(i).getTotal_cnt();
	                    cell.setCellValue((double) sum);
	                }


	            // 출력일자 설정 (N5)
	            row = sheet.getRow(4);  // N5는 row 4, cell 13
	            if (row == null) row = sheet.createRow(4);
	            cell = row.getCell(13); // N5
	            if (cell == null) cell = row.createCell(13);
	            cell.setCellValue(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
	            cell.setCellStyle(styleLeft);

	            workbook.setForceFormulaRecalculation(true);
	            fos = new FileOutputStream(savePath + fileName); // 파일 저장
	            workbook.write(fos);
	            workbook.close();
	            fos.flush();

	            rtnMap.put("data", savePath + fileName); // 저장된 파일 경로 반환
	        } catch (Exception e) {
	            e.printStackTrace();
	            rtnMap.put("error", "엑셀 파일 생성 중 오류가 발생했습니다.");
	            return rtnMap;
	        } finally {
	            try {
	                if (fis != null) fis.close();
	                if (fos != null) fos.close();
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }

	        return rtnMap;
	    }

}