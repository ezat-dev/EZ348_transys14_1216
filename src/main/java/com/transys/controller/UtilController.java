package com.transys.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.transys.domain.Util;
import com.transys.service.UtilService;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;

@Controller
public class UtilController {
   @Autowired
    private UtilService utilService;
   
   private static final Logger logger = LoggerFactory.getLogger(UtilController.class);

   
    @RequestMapping(value= "/util/lngMonth", method = RequestMethod.GET)
    public String lngMonth(Model model) {
        return "/util/lngMonth.jsp"; // 
    }   
   
    @RequestMapping(value= "/util/managePopup", method = RequestMethod.GET)
    public String managePopup(Model model) {
        return "/util/managePopup.jsp"; // 
    }   
    
    
    @RequestMapping(value= "/util/lngYear", method = RequestMethod.GET)
    public String lngYear(Model model) {
        return "/util/lngYear.jsp"; // 
    }
    @RequestMapping(value= "/util/electricYear", method = RequestMethod.GET)
    public String electricYear(Model model) {
        return "/util/ElectricYear.jsp"; // 
    }
    @RequestMapping(value= "/util/electricMonth", method = RequestMethod.GET)
    public String electricMonth(Model model) {
        return "/util/ElectricMonth.jsp"; // 
    }   
    
    
    
    @RequestMapping(value = "/util/lngYear/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> utilYearList(
            @RequestParam("electricYear") int electricYear  
    ) {
      //System.out.println("Received request:");
      //System.out.println("electricYear: " + electricYear); 

        Map<String, Object> rtnMap = new HashMap<>();

        try {
            Util util = new Util();
            util.setElectricYear(electricYear);  

            List<Util> utilYearList = utilService.utilYearList(util); 

         // System.out.println("Received request:");
         // System.out.println("electricYear: " + electricYear);


            rtnMap.put("status", "ok");
            rtnMap.put("data", utilYearList);
        } catch (Exception e) {
            System.out.println("Error occurred: " + e.getMessage());
            rtnMap.put("status", "error");
            rtnMap.put("message", e.getMessage());
        }

        return rtnMap;
    }
    
    @RequestMapping(value = "/util/lngMonth/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> utilMonthList(
            @RequestParam("lngYear") int lngYear,
            @RequestParam("lngMonth") int lngMonth,
            @RequestParam String deviceCode
    ) {
      //System.out.println("Received request:");
      //System.out.println("lngYear: " + lngYear); 
      //System.out.println("lngMonth: " + lngMonth); 
      //System.out.println("deviceCode: " + deviceCode); 
      //System.out.println("-------------------");

        Map<String, Object> rtnMap = new HashMap<>();

        try {
            Util util = new Util();
            util.setLngYear(lngYear);
            util.setLngMonth(lngMonth);  
            util.setDeviceCode(deviceCode);  

            List<Util> utilMonthList = utilService.utilMonthList(util); 

            rtnMap.put("status", "ok");
            rtnMap.put("rows", utilMonthList); // 'data' 대신 'rows' 사용
        } catch (Exception e) {
          //System.out.println("Error occurred: " + e.getMessage());
            rtnMap.put("status", "error");
            rtnMap.put("message", e.getMessage());
        }

        return rtnMap;
    }
    
    
    
    @RequestMapping(value = "/util/electricYear/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> utilElectricYearList(
            @RequestParam("electricYear") int electricYear  
    ) {
      //System.out.println("Received request:");
      //System.out.println("electricYear: " + electricYear); 

        Map<String, Object> rtnMap = new HashMap<>();

        try {
            Util util = new Util();
            util.setElectricYear(electricYear);  

            List<Util> utilYearList = utilService.utilElectricYearList(util); 

          //System.out.println("Received request:");
          //System.out.println("electricYear: " + electricYear);


            rtnMap.put("status", "ok");
            rtnMap.put("data", utilYearList);
        } catch (Exception e) {
          //System.out.println("Error occurred: " + e.getMessage());
            rtnMap.put("status", "error");
            rtnMap.put("message", e.getMessage());
        }

        return rtnMap;
    }
    
    @RequestMapping(value = "/util/electricMonth/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> utilElectricMonthList(
            @RequestParam("lngYear") int lngYear,
            @RequestParam("lngMonth") int lngMonth,
            @RequestParam String deviceCode
    ) {
      //System.out.println("Received request:");
      //System.out.println("lngYear: " + lngYear); 
      //System.out.println("lngMonth: " + lngMonth); 
      //System.out.println("deviceCode: " + deviceCode); 
      //System.out.println("-------------------");

        Map<String, Object> rtnMap = new HashMap<>();

        try {
            Util util = new Util();
            util.setLngYear(lngYear);
            util.setLngMonth(lngMonth);  
            util.setDeviceCode(deviceCode);  

            List<Util> utilMonthList = utilService.utilElectricMonthList(util); 

            rtnMap.put("status", "ok");
            rtnMap.put("rows", utilMonthList); // 'data' 대신 'rows' 사용
        } catch (Exception e) {
            System.out.println("Error occurred: " + e.getMessage());
            rtnMap.put("status", "error");
            rtnMap.put("message", e.getMessage());
        }

        return rtnMap;
    }
  
    
    

    @RequestMapping(value = "/util/electricYear/excel", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject electricYearExcel(
            HttpServletRequest request,
            @RequestParam(required = false, defaultValue = "0") int electricYear
    ) throws IOException {
        JSONObject rtnObj = new JSONObject();

        Util util = new Util();
        util.setElectricYear(electricYear);

   
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date time = new Date();
        String nowDate = format.format(time); 
        FileOutputStream fos = null;
        FileInputStream fis = null;

        String openPath = "D:/엑셀_양식/";
        String savePath = request.getServletContext().getRealPath("/WEB-INF/resources/uploads/");

        List<Util> util1 = utilService.utilElectricYearList(util);

        System.out.println("사이즈 : " + util1.size());

        try {
            fis = new FileInputStream(openPath + "EZ348)트랜시스양식_전력사용량.xlsx");

            XSSFWorkbook workbook = new XSSFWorkbook(fis);
            FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();
            CellStyle leftAlignStyle = workbook.createCellStyle();
            leftAlignStyle.setAlignment(HorizontalAlignment.LEFT); // 왼쪽 정렬

            CellStyle centerAlignStyle = workbook.createCellStyle();
            centerAlignStyle.setAlignment(HorizontalAlignment.CENTER); // 가운데 정렬

            XSSFSheet sheet = workbook.getSheetAt(0);
            Row row = null;
            Cell cell = null;

            Row row5 = sheet.getRow(4);
            if (row5 == null) row5 = sheet.createRow(4);
            Cell cell5 = row5.getCell(2);
            if (cell5 == null) cell5 = row5.createCell(2);
            cell5.setCellValue(electricYear); 
            cell5.setCellStyle(leftAlignStyle); 

            Row row4 = sheet.getRow(4);
            if (row4 == null) row4 = sheet.createRow(3);
            Cell cell4 = row4.getCell(13);
            if (cell4 == null) cell4 = row4.createCell(12);
            cell4.setCellValue(nowDate); 
            cell4.setCellStyle(leftAlignStyle);

        
            for (int i = 0; i < util1.size(); i++) {
                row = sheet.createRow(i + 9);

                cell = row.createCell(2); 
                cell.setCellValue(util1.get(i).getM01()); // 1월
                cell.setCellStyle(centerAlignStyle); 

                cell = row.createCell(3); 
                cell.setCellValue(util1.get(i).getM02()); // 2월
                cell.setCellStyle(centerAlignStyle); 

                cell = row.createCell(4); 
                cell.setCellValue(util1.get(i).getM03()); // 3월
                cell.setCellStyle(centerAlignStyle); 

                cell = row.createCell(5); 
                cell.setCellValue(util1.get(i).getM04()); // 4월
                cell.setCellStyle(centerAlignStyle); 

                cell = row.createCell(6); 
                cell.setCellValue(util1.get(i).getM05()); // 5월
                cell.setCellStyle(centerAlignStyle); 

                cell = row.createCell(7); 
                cell.setCellValue(util1.get(i).getM06()); // 6월
                cell.setCellStyle(centerAlignStyle); 

                cell = row.createCell(8); 
                cell.setCellValue(util1.get(i).getM07()); // 7월
                cell.setCellStyle(centerAlignStyle); 

                cell = row.createCell(9); 
                cell.setCellValue(util1.get(i).getM08()); // 8월
                cell.setCellStyle(centerAlignStyle); // 가운데 정렬

                cell = row.createCell(10); 
                cell.setCellValue(util1.get(i).getM09()); // 9월
                cell.setCellStyle(centerAlignStyle); 

                cell = row.createCell(11); 
                cell.setCellValue(util1.get(i).getM10()); // 10월
                cell.setCellStyle(centerAlignStyle); 

                cell = row.createCell(12); 
                cell.setCellValue(util1.get(i).getM11()); // 11월
                cell.setCellStyle(centerAlignStyle); 

                cell = row.createCell(13); 
                cell.setCellValue(util1.get(i).getM12()); // 12월
                cell.setCellStyle(centerAlignStyle);

                cell = row.createCell(14); 
                cell.setCellValue(util1.get(i).getTotal()); // 총합계
                cell.setCellStyle(centerAlignStyle); 

                cell = row.createCell(15); 
                cell.setCellValue(util1.get(i).getWriteDayTime()); // 기록 날짜와 시간
                cell.setCellStyle(centerAlignStyle); 
            }

            // 호기 설정
            // 호기 설정
            Row row8 = sheet.getRow(9);
            if (row8 == null) row8 = sheet.createRow(9);
            Cell cell8 = row8.getCell(1);
            if (cell8 == null) cell8 = row8.createCell(1);
            cell8.setCellValue("침탄1호기");
            cell8.setCellStyle(centerAlignStyle); 

            Row row9 = sheet.getRow(10);
            if (row9 == null) row9 = sheet.createRow(10);
            Cell cell9 = row9.getCell(1);
            if (cell9 == null) cell9 = row9.createCell(1);
            cell9.setCellValue("침탄2호기");
            cell9.setCellStyle(centerAlignStyle); 

            Row row10 = sheet.getRow(11);
            if (row10 == null) row10 = sheet.createRow(11);
            Cell cell10 = row10.getCell(1);
            if (cell10 == null) cell10 = row10.createCell(1);
            cell10.setCellValue("침탄3호기");
            cell10.setCellStyle(centerAlignStyle); 

            Row row11 = sheet.getRow(12);
            if (row11 == null) row11 = sheet.createRow(12);
            Cell cell11 = row11.getCell(1);
            if (cell11 == null) cell11 = row11.createCell(1);
            cell11.setCellValue("침탄4호기");
            cell11.setCellStyle(centerAlignStyle); 

            workbook.setForceFormulaRecalculation(true);

            fos = new FileOutputStream(savePath + nowDate + "_전력사용량.xlsx");
            workbook.write(fos);
            workbook.close();
            fos.flush();

        } catch (Exception e) {
        //  System.out.println(e);
        } finally {
            if (fis != null) { fis.close(); }
            if (fos != null) { fos.close(); }
        }

        rtnObj.put("r_str", "ok");
        rtnObj.put("filename", savePath + nowDate + "_전력사용량.xlsx");

        return rtnObj;
    }




    @RequestMapping(value = "/util/lngYear/excel", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject lngYearExcel(
            HttpServletRequest request,
            @RequestParam(required = false, defaultValue = "0") int electricYear
    ) throws IOException {
        JSONObject rtnObj = new JSONObject();

        Util util = new Util();
        util.setElectricYear(electricYear);

   
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date time = new Date();
        String nowDate = format.format(time); 
        FileOutputStream fos = null;
        FileInputStream fis = null;

        String openPath = "D:/엑셀_양식/";
        String savePath = request.getServletContext().getRealPath("/WEB-INF/resources/uploads/");

        List<Util> util1 = utilService.utilYearList(util);

      //System.out.println("사이즈 : " + util1.size());

        try {
            fis = new FileInputStream(openPath + "EZ348)트랜시스양식_LNG사용량.xlsx");

            XSSFWorkbook workbook = new XSSFWorkbook(fis);
            FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();
            CellStyle leftAlignStyle = workbook.createCellStyle();
            leftAlignStyle.setAlignment(HorizontalAlignment.LEFT); // 왼쪽 정렬

            CellStyle centerAlignStyle = workbook.createCellStyle();
            centerAlignStyle.setAlignment(HorizontalAlignment.CENTER); // 가운데 정렬

            XSSFSheet sheet = workbook.getSheetAt(0);
            Row row = null;
            Cell cell = null;

            Row row5 = sheet.getRow(4);
            if (row5 == null) row5 = sheet.createRow(4);
            Cell cell5 = row5.getCell(2);
            if (cell5 == null) cell5 = row5.createCell(2);
            cell5.setCellValue(electricYear); 
            cell5.setCellStyle(leftAlignStyle); 

            Row row4 = sheet.getRow(4);
            if (row4 == null) row4 = sheet.createRow(3);
            Cell cell4 = row4.getCell(13);
            if (cell4 == null) cell4 = row4.createCell(12);
            cell4.setCellValue(nowDate); 
            cell4.setCellStyle(leftAlignStyle);

        
            for (int i = 0; i < util1.size(); i++) {
                row = sheet.createRow(i + 9);

                cell = row.createCell(2); 
                cell.setCellValue(util1.get(i).getM01()); // 1월
                cell.setCellStyle(centerAlignStyle); 

                cell = row.createCell(3); 
                cell.setCellValue(util1.get(i).getM02()); // 2월
                cell.setCellStyle(centerAlignStyle); 

                cell = row.createCell(4); 
                cell.setCellValue(util1.get(i).getM03()); // 3월
                cell.setCellStyle(centerAlignStyle); 

                cell = row.createCell(5); 
                cell.setCellValue(util1.get(i).getM04()); // 4월
                cell.setCellStyle(centerAlignStyle); 

                cell = row.createCell(6); 
                cell.setCellValue(util1.get(i).getM05()); // 5월
                cell.setCellStyle(centerAlignStyle); 

                cell = row.createCell(7); 
                cell.setCellValue(util1.get(i).getM06()); // 6월
                cell.setCellStyle(centerAlignStyle); 

                cell = row.createCell(8); 
                cell.setCellValue(util1.get(i).getM07()); // 7월
                cell.setCellStyle(centerAlignStyle); 

                cell = row.createCell(9); 
                cell.setCellValue(util1.get(i).getM08()); // 8월
                cell.setCellStyle(centerAlignStyle); // 가운데 정렬

                cell = row.createCell(10); 
                cell.setCellValue(util1.get(i).getM09()); // 9월
                cell.setCellStyle(centerAlignStyle); 

                cell = row.createCell(11); 
                cell.setCellValue(util1.get(i).getM10()); // 10월
                cell.setCellStyle(centerAlignStyle); 

                cell = row.createCell(12); 
                cell.setCellValue(util1.get(i).getM11()); // 11월
                cell.setCellStyle(centerAlignStyle); 

                cell = row.createCell(13); 
                cell.setCellValue(util1.get(i).getM12()); // 12월
                cell.setCellStyle(centerAlignStyle);

                cell = row.createCell(14); 
                cell.setCellValue(util1.get(i).getTotal()); // 총합계
                cell.setCellStyle(centerAlignStyle); 

                cell = row.createCell(15); 
                cell.setCellValue(util1.get(i).getWriteDayTime()); // 기록 날짜와 시간
                cell.setCellStyle(centerAlignStyle); 
            }

            // 호기 설정
            Row row8 = sheet.getRow(9);
            if (row8 == null) row8 = sheet.createRow(9);
            Cell cell8 = row8.getCell(1);
            if (cell8 == null) cell8 = row8.createCell(1);
            cell8.setCellValue("침탄1호기");
            cell8.setCellStyle(centerAlignStyle); 

            Row row9 = sheet.getRow(10);
            if (row9 == null) row9 = sheet.createRow(10);
            Cell cell9 = row9.getCell(1);
            if (cell9 == null) cell9 = row9.createCell(1);
            cell9.setCellValue("침탄2호기");
            cell9.setCellStyle(centerAlignStyle); 

            Row row10 = sheet.getRow(11);
            if (row10 == null) row10 = sheet.createRow(11);
            Cell cell10 = row10.getCell(1);
            if (cell10 == null) cell10 = row10.createCell(1);
            cell10.setCellValue("침탄3호기");
            cell10.setCellStyle(centerAlignStyle); 

            Row row11 = sheet.getRow(12);
            if (row11 == null) row11 = sheet.createRow(12);
            Cell cell11 = row11.getCell(1);
            if (cell11 == null) cell11 = row11.createCell(1);
            cell11.setCellValue("침탄4호기");
            cell11.setCellStyle(centerAlignStyle); 

            workbook.setForceFormulaRecalculation(true);

            fos = new FileOutputStream(savePath + nowDate + "_LNG사용량.xlsx");
            workbook.write(fos);
            workbook.close();
            fos.flush();

        } catch (Exception e) {
          //System.out.println(e);
        } finally {
            if (fis != null) { fis.close(); }
            if (fos != null) { fos.close(); }
        }

        rtnObj.put("r_str", "ok");
        rtnObj.put("filename", savePath + nowDate + "_LNG사용량.xlsx");

        return rtnObj;
    }

}