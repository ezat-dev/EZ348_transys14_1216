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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.transys.domain.InOut;
import com.transys.domain.Product;
import com.transys.domain.Work;
import com.transys.service.WorkService;

@Controller
public class WorkController {

   @Autowired
   private WorkService workService;

   private static final Logger logger = LoggerFactory.getLogger(WorkController.class);
   

   //작업일보 상세
   @RequestMapping(value= "/work/workDetail", method = RequestMethod.GET)
   public String workDetail(Model model) {       

       return "/work/workDetail.jsp"; // 
   }
    
    //작업일보 상세 조회
    @RequestMapping(value= "/work/workDetail/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> workDetailList(
          @RequestParam String p_devicecode,
          @RequestParam String p_date
          ) {

       Map<String, Object> rtnMap = new HashMap<String, Object>();
       Work work = new Work();
       work.setDevicecode(p_devicecode);
       work.setSearchStartDate(p_date+" 07:00");
       work.setSearchEndDate(p_date+" 06:59");       
       
       StringBuffer desc = new StringBuffer();
       
       desc.append("DEVICE : "+p_devicecode+"// SDATE : "+p_date+" 07:00"+"// EDATE : "+p_date+" 06:59");
       
       logger.info("작업일보 조회 {}", desc);
       //t_siljuk, t_product 조인
       List<Work> workList = workService.workDetailList(work);
       
       rtnMap.put("last_page",1);
       rtnMap.put("data", workList);
       
        return rtnMap; // 
    }

    //작업일보 상세이력
    @RequestMapping(value= "/work/workDetailDesc", method = RequestMethod.GET)
    public String workDetailDesc(Model model) {       

        return "/work/workDetailDesc.jsp"; // 
    }
    
    //작업일보 상세 조회
    @RequestMapping(value= "/work/workDetailDesc/data", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> workDetailDescData(@RequestParam String lotNo) {

       Map<String, Object> rtnMap = new HashMap<String, Object>();
       Work work = new Work();
       work.setLotno(lotNo);       
       
       Work workDetailDesc = workService.workDetailDescData(work);
       
       StringBuffer desc = new StringBuffer();
       
       desc.append("lotNo : "+lotNo);
       
       logger.info("작업일보 상세이력 조회 {}", desc);
       
       rtnMap.put("data", workDetailDesc);
       
        return rtnMap; // 
    }
    
    //작업일보 상세이력
    @RequestMapping(value= "/work/workDetailDescOverView", method = RequestMethod.GET)
    public String workDetailDescOverView(Model model) {       

        return "/work/workDetailDescOverView.jsp"; // 
    }
    
    //작업일보 상세 조회
    @RequestMapping(value= "/work/workDetailDescOverView/data", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> workDetailOverViewDescData(
    		@RequestParam String devicecode,
    		@RequestParam int pumbun) {

       Map<String, Object> rtnMap = new HashMap<String, Object>();
       Work work = new Work();
       work.setDevicecode(devicecode);
       work.setPumbun(String.format("%04d",pumbun));
       
       Work workDetailDesc = workService.workDetailDescDataOverView(work);
       
       StringBuffer desc = new StringBuffer();
       
       desc.append("devicecode : "+devicecode+"// pumbun : "+pumbun);
       
       logger.info("작업일보 상세이력 조회(오버뷰) {}", desc);
       
       rtnMap.put("data", workDetailDesc);
       
        return rtnMap; // 
    }


    //작업일보 편집
    @RequestMapping(value= "/work/workDetailEdit", method = RequestMethod.GET)
    public String workDetailEdit(Model model) {       

        return "/work/workDetailEdit.jsp"; // 
    }
    
    
    //작업일보 편집 제품이력 조회
    @RequestMapping(value= "/work/workDetail/productList", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> workDetailProductList(
    		@RequestParam String pumname,
    		@RequestParam String gijong,
    		@RequestParam String dobun) {

       Map<String, Object> rtnMap = new HashMap<String, Object>();
       
       Product product = new Product();
       product.setPumname(pumname);
       product.setGijong(gijong);
       product.setDobun(dobun);
       
       List<Product> productList = workService.workDetailProductList(product);
       
       rtnMap.put("last_page",1);
       rtnMap.put("data", productList);
       
       StringBuffer desc = new StringBuffer();
       
       desc.append("");
       
       logger.info("작업일보 제품이력 조회 {}", desc);       
       
        return rtnMap; // 
    }
    
    //작업일보 편집 - 데이터 수정조회
    @RequestMapping(value= "/work/workDetail/editData", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> workDetailEditData(@RequestParam String lotNo) {

       Map<String, Object> rtnMap = new HashMap<String, Object>();
       Work work = new Work();
       work.setLotno(lotNo);
       
       Work workEditData = workService.workDetailEditData(work);
       
       rtnMap.put("data", workEditData);
       
       StringBuffer desc = new StringBuffer();
       
       desc.append("LOTNO : "+lotNo);
       
       logger.info("작업일보 편집- 데이터 수정조회 {}", desc);          
       
        return rtnMap; // 
    }
    
    
    //작업일보 편집 - 데이터 수정조회
    @RequestMapping(value= "/work/workDetail/editDataSave", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> setWorkDetailEditDataSave(@ModelAttribute Work work) {

       Map<String, Object> rtnMap = new HashMap<String, Object>(); 
       workService.setWorkDetailEditDataSave(work);
       
       rtnMap.put("data", "OK");
       
       StringBuffer desc = new StringBuffer();
       
       desc.append("LOTNO : "+work.getLotno());
       
       logger.info("작업일보 편집- 데이터 수정완료 {}", desc);          
       
        return rtnMap; // 
    }
    
    //작업일보 데이터 추가
    @RequestMapping(value= "/work/workDetailAdd", method = RequestMethod.GET)
    public String workDetailAdd(Model model) {       

        return "/work/workDetailAdd.jsp";
    }
    
    //작업일보 데이터 저장
    @RequestMapping(value= "/work/workDetail/addDataSave", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> setWorkDetailAddDataSave(@ModelAttribute Work work) {

       Map<String, Object> rtnMap = new HashMap<String, Object>();
       
       if(work.getPumcode() == null || work.getPumcode().length() == 0) {
          rtnMap.put("data", "처리품코드를 입력하세요.");
          return rtnMap;
       }
       
       if(work.getCnt() == 0) {
          rtnMap.put("data", "적재수량을 입력하세요.");
          return rtnMap;
       }
       
       if(work.getCycleno() == null || work.getCycleno().length() == 0) {
          rtnMap.put("data", "사이클 NO를 입력하세요.");
          return rtnMap;
       }
       
       if(work.getAgitate_rpm() == 0) {
          rtnMap.put("data", "아지테이터 RPM을 입력하세요.");
          return rtnMap;
       }
       
       if(work.getDevicecode().length() == 0) {
          rtnMap.put("data", "침탄로를 입력하세요.");
          return rtnMap;
       }
       
       
       if(work.getCommon_device().length() == 0) {
          rtnMap.put("data", "공통로를 입력하세요.");
          return rtnMap;
       }
       
       workService.setWorkDetailAddDataSave(work);
       rtnMap.put("data", "OK");
       
       StringBuffer desc = new StringBuffer();
       
       desc.append("침탄호기 : "+work.getDevicecode()+"// ");
       desc.append("공통호기 : "+work.getCommon_device()+"// ");
       desc.append("CYCLENO : "+work.getCycleno()+"// ");
       desc.append("AGITATE_RPM : "+work.getAgitate_rpm());
       
       logger.info("작업일보 추가- 데이터 추가완료 {}", desc);         
       
        return rtnMap; // 
    }    
    
    //작업일보 데이터 삭제
    @RequestMapping(value= "/work/workDetail/delete", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> setWorkDetailDelete(@RequestParam String lotNo) {
       Map<String, Object> rtnMap = new HashMap<String, Object>();
       
       Work work = new Work();
       work.setLotno(lotNo);
       
       workService.setWorkDetailDelete(work);
       
       StringBuffer desc = new StringBuffer();
       
       desc.append("LOTNO : "+work.getLotno());
       
       logger.info("작업일보 삭제 - 데이터 삭제완료 {}", desc);             
       
       return rtnMap;
    }
    
    //작업일보 데이터 삭제
    @RequestMapping(value= "/work/workDetail/inlineDelete", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> setWorkDetailInlineDelete(@RequestParam String lotNo) {
    	Map<String, Object> rtnMap = new HashMap<String, Object>();
    	
    	Work work = new Work();
    	work.setLotno(lotNo);
    	
    	workService.setWorkDetailInlineDelete(work);
    	
    	StringBuffer desc = new StringBuffer();
    	
    	desc.append("LOTNO : "+work.getLotno());
    	
    	logger.info("작업일보 삭제 - 데이터 삭제완료 {}", desc);             
    	
    	return rtnMap;
    }
    
    //작업이력 SALT추출
    @RequestMapping(value= "/work/workDetail/endSalt", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> setWorkDetailEndSalt(@RequestParam String lotNo) {
       Map<String, Object> rtnMap = new HashMap<String, Object>();
       
       Work work = new Work();
       work.setLotno(lotNo);
       
       workService.setWorkDetailEndSalt(work);
       rtnMap.put("data","SALT추출시간이 처리되었습니다.");
       
       StringBuffer desc = new StringBuffer();
       
       desc.append("LOTNO : "+work.getLotno());
       
       logger.info("작업이력 수정 - SLAT 추출완료 {}", desc);         
       
       return rtnMap;
    }
    
    //작업이력 전체완료
    @RequestMapping(value= "/work/workDetail/endTime", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> setWorkDetailEndTime(@RequestParam String lotNo) {
       Map<String, Object> rtnMap = new HashMap<String, Object>();
       
       Work work = new Work();
       work.setLotno(lotNo);
       
       //로트번호로 조회했을 때
       //SALT추출이 처리되어있지 않고, 추출완료가 처리되어있을때만 실행
       Work tWork = workService.getWorkDetailEndTime(work);
       
       if(tWork.getEndsalt().length() == 0) {
          rtnMap.put("data","SALT추출시간 처리 후 진행해주십시오!");
          return rtnMap;
       }
       
       if(tWork.getEndtime().length() != 0) {
          rtnMap.put("data","완료시간 처리 후 진행해주십시오!");
          return rtnMap;
       }
       
       rtnMap.put("data","완료시간이 처리되었습니다.");
       workService.setWorkDetailEndTime(work);
       
       
       StringBuffer desc = new StringBuffer();
       
       desc.append("LOTNO : "+work.getLotno());
       
       logger.info("작업이력 수정 - 전체작업 완료 {}", desc);        
       
       return rtnMap;
    }
    
    //작업이력 SALT추출
    @RequestMapping(value= "/work/workDetail/forcingStart", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> setWorkDetailForcingStart(@RequestParam String lotNo, @RequestParam String pumbun) {
       Map<String, Object> rtnMap = new HashMap<String, Object>();
//       System.out.println(lotNo);
//       System.out.println(lotNo.substring(8,9));
       Work work = new Work();
       work.setDevicecode(lotNo.substring(8,9));
       work.setPumbun(pumbun);
       
       workService.setWorkDetailForcingStart(work);
       rtnMap.put("data","강제투입이 처리되었습니다.");
       
       StringBuffer desc = new StringBuffer();
       
       desc.append("LOTNO : "+lotNo);
       
       logger.info("작업이력 수정 - 강제투입처리 완료 {}", desc);           
       
       return rtnMap;
    }
    
    //작업이력 SALT추출
    @RequestMapping(value= "/work/workDetail/forcingEnd", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> setWorkDetailForcingEnd(@RequestParam String lotNo) {
       Map<String, Object> rtnMap = new HashMap<String, Object>();
       
       Work work = new Work();
       work.setLotno(lotNo);
       
       workService.setWorkDetailForcingEnd(work);
       rtnMap.put("data","강제완료가 처리되었습니다.");
       
       StringBuffer desc = new StringBuffer();
       
       desc.append("LOTNO : "+lotNo);
       
       logger.info("작업이력 수정 - 강제작업완료 {}", desc);        
       
       return rtnMap;
    }
        
    @RequestMapping(value = "/work/workDay", method = RequestMethod.GET)
    public String worknormalPopup(Model model) {        
        return "/work/workDay.jsp"; 
    }
    @RequestMapping(value = "/work/workMonth", method = RequestMethod.GET)
    public String worknormalMonthPopup(Model model) {        
        return "/work/workMonth.jsp"; 
    }
    @RequestMapping(value = "/work/workYear", method = RequestMethod.GET)
    public String worknormalYearPopup(Model model) {        
        return "/work/workYear.jsp"; 
    }
    
    
    //작업일보 조회
    @RequestMapping(value = "/work/workDay/list", method = RequestMethod.POST)
    @ResponseBody
    public List<Work> workDayList(@RequestParam String date,
                                     @RequestParam String placename) {
        // 수신된 값 출력
//        System.out.println("수신된 날짜: " + date);
//        System.out.println("수신된 설비명: " + placename);

        Work work = new Work();
        work.setDevicecode(placename);
        // 날짜 값을 Work 객체에 설정
        work.setSearchStartDate(date + " 07:00");
        work.setSearchEndDate(date + " 06:59");      

        return workService.workDayList(work);
    }
    
    //작업 월보 조회
    @RequestMapping(value = "/work/workMonth/list", method = RequestMethod.POST)
    @ResponseBody
    public List<Work> workMonthList(@RequestParam String date,
                                     @RequestParam String placename) {
        // 수신된 값 출력
//        System.out.println("수신된 날짜: " + date);
//        System.out.println("수신된 설비명: " + placename);

        Work work = new Work();
        work.setDevicecode(placename);
        // 날짜 값을 Work 객체에 설정
        work.setKeymonth(date.substring(0,6));      
//        System.out.println(date.substring(0,6));
        


        return workService.workMonthList(work);
    }
    
    
    //작업연보 조회
    @RequestMapping(value = "/work/workYear/list", method = RequestMethod.POST)
    @ResponseBody
    public List<Work> workYearList(@RequestParam String date,
                                     @RequestParam String placename) {
        // 수신된 값 출력
//        System.out.println("수신된 날짜: " + date);
//        System.out.println("수신된 설비명: " + placename);

        Work work = new Work();
        work.setDevicecode(placename);
        // 날짜 값을 Work 객체에 설정
        work.setKeyyear(date);      
 

        return workService.workYearList(work);
    }
    
    //작업일보 엑셀
    @RequestMapping(value = "/work/workDay/excelDownload", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> workDayExcelDownload(@RequestParam String date,
                                                    @RequestParam String placename,
                                                    HttpServletRequest request) {
        Map<String, Object> rtnMap = new HashMap<>();

        Work work = new Work();
        work.setDevicecode(placename);
        work.setSearchStartDate(date + " 07:00");
        work.setSearchEndDate(date + " 06:59");

        SimpleDateFormat format = new SimpleDateFormat("yyMMdd_HHmmss");
        Date time = new Date();
        String now = format.format(time);

        FileOutputStream fos = null;
        FileInputStream fis = null;
        String openPath = "D:/엑셀_양식/";
        String savePath = request.getServletContext().getRealPath("/WEB-INF/resources/uploads/");

        List<Work> workList = workService.workDayList(work);
        if (workList == null || workList.isEmpty()) {
            rtnMap.put("error", "없음");
            return rtnMap;
        }

        try {
            fis = new FileInputStream(openPath + "EZ348)트랜시스양식_작업일보.xlsx");

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

            

            // D5 셀에 값 설정 (placename이 null 또는 공백이면 "전체")
            row = sheet.getRow(4);  
            if (row == null) row = sheet.createRow(4);
            cell = row.getCell(3);  // D5 셀
            if (cell == null) cell = row.createCell(3);
            String placenameToSet = (placename == null || placename.trim().isEmpty()) ? "전체" : placename;
            cell.setCellValue(placenameToSet); 
            cell.setCellStyle(styleLeft);  // 중앙 정렬 스타일 적용

            
            
            // date 설정 (D6)
            row = sheet.getRow(5); // D6는 row 5, cell 3
            if (row == null) row = sheet.createRow(5);
            cell = row.getCell(3); // D6 (4번째 열)
            if (cell == null) cell = row.createCell(3);
            cell.setCellValue(date); // date 값 넣기
            cell.setCellStyle(styleLeft); // 스타일 적용

            
            // 작업 데이터 개수 설정 (D7)
            row = sheet.getRow(6);  // D7은 row 6, cell 3
            if (row == null) row = sheet.createRow(6);
            cell = row.getCell(3); // D7
            if (cell == null) cell = row.createCell(3);
            cell.setCellValue(workList.size());
            cell.setCellStyle(styleLeft);
            
            
            
            // 날짜 셀 설정 (K6)
            row = sheet.getRow(5);  // K6는 row 5, cell 10
            if (row == null) row = sheet.createRow(5);
            cell = row.getCell(10); // K6
            if (cell == null) cell = row.createCell(10);
            cell.setCellValue(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            cell.setCellStyle(styleLeft);

        


           

            // 작업 데이터 행 추가 (D10부터 시작)
            int startRow = 9;
            for (int i = 0; i < workList.size(); i++) {
                row = sheet.getRow(startRow + i);
                if (row == null) row = sheet.createRow(startRow + i);

                // 순번 (D10부터 시작)
                cell = row.createCell(1); // D10부터 (순번)
                cell.setCellValue(i + 1);
                cell.setCellStyle(styleCenter);

                // pumcode (C10부터)
                cell = row.createCell(2); // C10부터 (pumcode)
                cell.setCellValue(workList.get(i).getPumcode() != null ? workList.get(i).getPumcode() : "");
                cell.setCellStyle(styleLeft);

                // pumname (F10부터)
                cell = row.createCell(5); // F10부터 (pumname)
                cell.setCellValue(workList.get(i).getPumname() != null ? workList.get(i).getPumname() : "");
                cell.setCellStyle(styleLeft);

                // gijong (H10부터)
                cell = row.createCell(7); // H10부터 (gijong)
                cell.setCellValue(workList.get(i).getGijong() != null ? workList.get(i).getGijong() : "");
                cell.setCellStyle(styleCenter);

                // cntsum (I10부터)
                cell = row.createCell(8); // I10부터 (cntsum)
                String cntsumStr = workList.get(i).getCntsum();
                double cntsum = (cntsumStr != null && !cntsumStr.isEmpty()) ? Double.parseDouble(cntsumStr) : 0.0;
                cell.setCellValue(cntsum);
                cell.setCellStyle(styleCenter);

                // intray (J10부터)
                cell = row.createCell(9); // J10부터 (intray)
                String intrayStr = workList.get(i).getIntray();
                double intray = (intrayStr != null && !intrayStr.isEmpty()) ? Double.parseDouble(intrayStr) : 0.0;
                cell.setCellValue(intray);
                cell.setCellStyle(styleCenter);

                // outtray (K10부터)
                cell = row.createCell(10); // K10부터 (outtray)
                String outtrayStr = workList.get(i).getOuttray();
                double outtray = (outtrayStr != null && !outtrayStr.isEmpty()) ? Double.parseDouble(outtrayStr) : 0.0;
                cell.setCellValue(outtray);
                cell.setCellStyle(styleCenter);

                // 디바이스 코드 출력
               // System.out.println("DeviceCode: " + workList.get(i).getDevicecode());
            }

            workbook.setForceFormulaRecalculation(true);
            fos = new FileOutputStream(savePath + now + "_작업일보.xlsx");
            workbook.write(fos);
            workbook.close();
            fos.flush();

        } catch (Exception e) {
            e.printStackTrace();
            rtnMap.put("error", "An error occurred while generating the Excel file.");
            return rtnMap;
        } finally {
            try {
                if (fis != null) fis.close();
                if (fos != null) fos.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        rtnMap.put("data", savePath + now + "_작업일보.xlsx");
        return rtnMap;
    }

    @RequestMapping(value = "/work/workMonth/excelDownload", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> workMonthExcelDownload(@RequestParam String date,
                                                      @RequestParam String placename,
                                                      HttpServletRequest request) {
       // System.out.println("Received date parameter: " + date);
       //System.out.println("Received placename parameter: " + placename);

        Map<String, Object> rtnMap = new HashMap<>();
        Work work = new Work();
        work.setDevicecode(placename);
        work.setKeymonth(date.substring(0, 6));

       // System.out.println("Set keymonth in Work object: " + work.getKeymonth());

        SimpleDateFormat format = new SimpleDateFormat("yyMMdd_HHmmss");
        Date time = new Date();
        String now = format.format(time);

        FileOutputStream fos = null;
        FileInputStream fis = null;
        String openPath = "D:/엑셀_양식/";
        String savePath = request.getServletContext().getRealPath("/WEB-INF/resources/uploads/");

        List<Work> workList = workService.workMonthList(work);

        // workList가 null인지 확인
        if (workList == null || workList.isEmpty()) {
           // System.out.println("workList is null or empty");
        } else {
          //  System.out.println("workList size: " + workList.size());
        }

        //System.out.println("작업 월보 데이터 리스트:");
        for (int i = 0; i < workList.size(); i++) {
            Work w = workList.get(i);
            // 디버깅 출력 필요 시 추가
        }

        try {
            fis = new FileInputStream(openPath + "EZ348)트랜시스양식_작업월보.xlsx");

            XSSFWorkbook workbook = new XSSFWorkbook(fis);
            FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();
            XSSFSheet sheet = workbook.getSheetAt(0);
            Row row = null;
            Cell cell = null;

            // 스타일 정의
            XSSFCellStyle styleCenter = workbook.createCellStyle();
            styleCenter.setAlignment(HorizontalAlignment.CENTER);  // 중앙 정렬
            styleCenter.setVerticalAlignment(VerticalAlignment.CENTER);  // 세로 중앙 정렬

            XSSFCellStyle styleLeft = workbook.createCellStyle();
            styleLeft.setAlignment(HorizontalAlignment.LEFT);  // 왼쪽 정렬
            styleLeft.setVerticalAlignment(VerticalAlignment.CENTER);  // 세로 중앙 정렬

            // D5 셀에 값 설정 (placename이 null 또는 공백이면 "전체")
            row = sheet.getRow(4);  
            if (row == null) row = sheet.createRow(4);
            cell = row.getCell(3);  // D5 셀
            if (cell == null) cell = row.createCell(3);
            String placenameToSet = (placename == null || placename.trim().isEmpty()) ? "전체" : placename;
            cell.setCellValue(placenameToSet); 
            cell.setCellStyle(styleLeft);  // 중앙 정렬 스타일 적용

            // 나머지 코드 그대로 진행
            row = sheet.getRow(5);
            if(row == null) row = sheet.createRow(5);
            cell = row.getCell(3);
            if(cell == null) cell = row.createCell(3);
            cell.setCellValue(workList.get(0).getKeymonth()); 
            cell.setCellStyle(styleLeft);

            row = sheet.getRow(6);  
            if (row == null) row = sheet.createRow(6);
            cell = row.getCell(3);  
            if(cell == null) cell = row.createCell(3);            
            cell.setCellValue(workList.size());  
            cell.setCellStyle(styleLeft); 

            int startRow = 9;  
            for (int i = 0; i < workList.size(); i++) {
                row = sheet.getRow(startRow + i); 
                if (row == null) row = sheet.createRow(startRow + i);

                cell = row.createCell(1);  
                cell.setCellValue(i + 1);
                cell.setCellStyle(styleCenter);  

                cell = row.createCell(2);  
                cell.setCellValue(workList.get(i).getPumcode());
                cell.setCellStyle(styleLeft);  

                cell = row.createCell(4);  
                cell.setCellValue(workList.get(i).getPumname());
                cell.setCellStyle(styleLeft);  

                cell = row.createCell(9); 
                cell.setCellValue(workList.get(i).getGijong());
                cell.setCellStyle(styleCenter);  

                cell = row.createCell(15); 
                cell.setCellValue(workList.get(i).getTotalout());
                cell.setCellStyle(styleCenter);  
            }

            workbook.setForceFormulaRecalculation(true);
            fos = new FileOutputStream(savePath + now + "_작업월보.xlsx");
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

        rtnMap.put("data", savePath + now + "_작업월보.xlsx");
        return rtnMap;
    }

    
    
    //작업년보 엑셀
    @RequestMapping(value = "/work/workYear/excelDownload", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> workYearExcelDownload(@RequestParam String date,
                                                     @RequestParam String placename,
                                                     HttpServletRequest request) {
        Map<String, Object> rtnMap = new HashMap<>();
        Work work = new Work();
        work.setDevicecode(placename);
        work.setKeyyear(date); 

        SimpleDateFormat format = new SimpleDateFormat("yyMMdd_HHmmss");
        Date time = new Date();
        String now = format.format(time);

        FileOutputStream fos = null;
        FileInputStream fis = null;
        String openPath = "D:/엑셀_양식/"; 
        String savePath = request.getServletContext().getRealPath("/WEB-INF/resources/uploads/");

        List<Work> workList = workService.workYearList(work);  
       // System.out.println("작업 년보 데이터 리스트:");
        for (int i = 0; i < workList.size(); i++) {
            Work w = workList.get(i);
           
        }

        try {
            fis = new FileInputStream(openPath + "EZ348)트랜시스양식_작업연보.xlsx");

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
            
            // D5 셀에 값 설정 (placename이 null 또는 공백이면 "전체")
            row = sheet.getRow(4);  
            if (row == null) row = sheet.createRow(4);
            cell = row.getCell(3);  // D5 셀
            if (cell == null) cell = row.createCell(3);
            String placenameToSet = (placename == null || placename.trim().isEmpty()) ? "전체" : placename;
            cell.setCellValue(placenameToSet); 
            cell.setCellStyle(styleLeft);  // 중앙 정렬 스타일 적용
            
            
            row = sheet.getRow(4);  
            if (row == null) row = sheet.createRow(4);
            cell = row.createCell(15); 
            cell.setCellValue(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            cell.setCellStyle(styleCenter);  

            // 연도값을 표시
            row = sheet.getRow(5);  
            if (row == null) row = sheet.createRow(5);
            cell = row.createCell(3);  
            cell.setCellValue(work.getKeyyear());  // 연도 값을 설정

            row = sheet.getRow(6);  
            if (row == null) row = sheet.createRow(6);
            cell = row.getCell(3);  
            if(cell == null) cell = row.createCell(3);            
            cell.setCellValue(workList.size());  
            cell.setCellStyle(styleLeft); 
            
            int startRow = 9;  
            for (int i = 0; i < workList.size(); i++) {
                row = sheet.getRow(startRow + i); 
                if (row == null) row = sheet.createRow(startRow + i);

                cell = row.createCell(1);  
                cell.setCellValue(i + 1);
                cell.setCellStyle(styleCenter);  

                cell = row.createCell(2);  
                cell.setCellValue(workList.get(i).getPumcode());
                cell.setCellStyle(styleLeft);  

                cell = row.createCell(4);  
                cell.setCellValue(workList.get(i).getPumname());
                cell.setCellStyle(styleCenter);  

                cell = row.createCell(9); 
                cell.setCellValue(workList.get(i).getGijong());
                cell.setCellStyle(styleCenter);  

  
                double m01 = workList.get(i).getM01();
                double m02 = workList.get(i).getM02();
                double m03 = workList.get(i).getM03();
                double m04 = workList.get(i).getM04();
                double m05 = workList.get(i).getM05();
                double m06 = workList.get(i).getM06();
                double m07 = workList.get(i).getM07();
                double m08 = workList.get(i).getM08();
                double m09 = workList.get(i).getM09();
                double m10 = workList.get(i).getM10();
                double m11 = workList.get(i).getM11();
                double m12 = workList.get(i).getM12();

              
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
            fos = new FileOutputStream(savePath + now + "_작업연보.xlsx");
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

        rtnMap.put("data", savePath + now + "_작업년보.xlsx");
        return rtnMap;
    }

    //작업일보 상세이력
    @RequestMapping(value= "/work/workInOutPopup", method = RequestMethod.GET)
    public String workInOutPopup(Model model) {       

        return "/include/inOutPopup.jsp"; // 
    }
    
    //작업일보 상세 조회
    @RequestMapping(value= "/work/workInOutPopup/data", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> workInOutPopupData() {

       Map<String, Object> rtnMap = new HashMap<String, Object>();
       
       List<InOut> inOutList = workService.getInOutList();
       
       rtnMap.put("last_page",1);
       rtnMap.put("data", inOutList);
       
        return rtnMap; // 
    }

}
