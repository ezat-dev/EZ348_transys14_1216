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
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.transys.dao.OutPutDao;
import com.transys.domain.OutPut;
import com.transys.domain.PlcWrite;
import com.transys.domain.Product;
import com.transys.domain.Work;
import com.transys.service.ProductService;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private OutPutDao outPutDao;
    
    private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
    
    // 처리폼관리 페이지
    @RequestMapping(value = "/product/productList", method = RequestMethod.GET)
    public String productDetail(Model model) {
        return "/product/productList.jsp"; 
    }
    
    // 처리폼관리 진행리스트 페이지
    @RequestMapping(value = "/product/productPlayList", method = RequestMethod.GET)
    public String productPlayList(Model model) {
        return "/product/productPlayList.jsp"; 
    }
    
    // 처리폼관리 수정페이지 팝업
    @RequestMapping(value = "/product/productModify", method = RequestMethod.GET)
    public String productModify(@RequestParam(value = "dobun", required = false) String dobun, Model model) {
        if (dobun != null && !dobun.isEmpty()) {
            model.addAttribute("dobun", dobun); 
        }
        return "/product/productAdd.jsp";
    }
    
    // 처리폼관리 추가페이지 팝업
    @RequestMapping(value = "/product/productAdd", method = RequestMethod.GET)
    public String productAdd(Model model) {
        return "/product/productAdd.jsp"; 
    }
    
    
    
    
    
    // 일자별투입 List 페이지
    @RequestMapping(value = "/product/dayList", method = RequestMethod.GET)
    public String productdayList(Model model) {
        return "/product/dayList.jsp"; 
    }
    // 일자별투입 창고출고
    @RequestMapping(value = "/product/dayList/popup", method = RequestMethod.GET)
    public String productdaypopup(Model model) {
        return "/product/hogiOut.jsp"; 
    }
    
    @RequestMapping(value = "/product/dayList/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> workDetailList(
            @RequestParam String p_devicecode,
            @RequestParam String p_date
    ) {
        // 요청 파라미터 로그 출력
/*        System.out.println("Received request:");
        System.out.println("Device Code: " + p_devicecode);
        System.out.println("Date: " + p_date);*/

      
        Map<String, Object> rtnMap = new HashMap<>();

        try {
           
            PlcWrite plcWrite = new PlcWrite();
            plcWrite.setDevicecode(p_devicecode);
            plcWrite.setWorkday(Integer.parseInt(p_date));  // 여기서 p_date는 workday와 매핑됨

            List<PlcWrite> productList = productService.getWaitList(plcWrite);

            // 제품 리스트 크기 로그 출력
//            System.out.println("Product List Size: " + productList.size());

            // 성공 시 데이터 반환
            rtnMap.put("status", "success");
            rtnMap.put("last_page", 1);
            rtnMap.put("data", productList);
        } catch (Exception e) {
            // 에러 발생 시 에러 메시지 반환
//            System.out.println("Error occurred: " + e.getMessage());
            rtnMap.put("status", "error");
            rtnMap.put("message", e.getMessage());
        }

        return rtnMap;
    }
    
    
    @RequestMapping(value = "/product/productPlayList/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> workDetailPlayList(
            @RequestParam String p_devicecode,
            @RequestParam String p_date
    ) {
        // 요청 파라미터 로그 출력
       // System.out.println("Received request:");
      //  System.out.println("Device Code: " + p_devicecode);
       // System.out.println("Date: " + p_date);

        // 반환할 Map 생성
        Map<String, Object> rtnMap = new HashMap<>();

        // 서비스 계층을 통해 데이터를 가져옴
        try {
            // t_waitlist 테이블 도메인
            PlcWrite plcWrite = new PlcWrite();
            plcWrite.setDevicecode(p_devicecode);
            plcWrite.setWorkday(Integer.parseInt(p_date));  // 여기서 p_date는 workday와 매핑됨

            // 서비스 계층을 통해 데이터 조회
            List<PlcWrite> productList = productService.getWaitPlayList(plcWrite);

            // 제품 리스트 크기 로그 출력
            //System.out.println("Product List Size: " + productList.size());

            // 성공 시 데이터 반환
            rtnMap.put("status", "success");
            rtnMap.put("last_page", 1);
            rtnMap.put("data", productList);
        } catch (Exception e) {
            // 에러 발생 시 에러 메시지 반환
            //System.out.println("Error occurred: " + e.getMessage());
            rtnMap.put("status", "error");
            rtnMap.put("message", e.getMessage());
        }

        return rtnMap;
    }

    
    
    
    
    // 처리폼관리 데이터 전체 조회
    @RequestMapping(value = "/product/productList/data", method = RequestMethod.POST) 
    @ResponseBody 
    public List<Product> getProductList() {
        return productService.getProductList(); 
    }
    
    @RequestMapping(value = "/product/productList/excelDownload", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getProductListExcelDownload(HttpServletRequest request) {
        Map<String, Object> rtnMap = new HashMap<>();
        Product product = new Product();

        SimpleDateFormat format = new SimpleDateFormat("yyMMdd_HHmmss");
        Date time = new Date();
        String now = format.format(time);

        FileOutputStream fos = null;
        FileInputStream fis = null;
        String openPath = "D:/엑셀_양식/";
        String savePath = request.getServletContext().getRealPath("/WEB-INF/resources/uploads/");

        List<Product> productList = productService.getProductList(); 

        try {
            fis = new FileInputStream(openPath + "EZ348)트랜시스양식_처리품 코드.xlsx");

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

            // 5번째 행 (O열에 날짜 넣기)
            row = sheet.getRow(4);
            if (row == null) row = sheet.createRow(4);
            cell = row.getCell(14); // O열
            cell.setCellValue(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            cell.setCellStyle(styleCenter);  // 중앙 정렬 스타일 적용

         // D5 위치에 값 설정 (5번째 행, D열)
            row = sheet.getRow(4);  // 5번째 행
            if (row == null) row = sheet.createRow(4);  // 행이 없으면 새로 생성
            cell = row.getCell(3);  // D열 (열 인덱스 3)
            if (cell == null) cell = row.createCell(3);  // 셀이 없으면 새로 생성
            cell.setCellValue(productList.size());  // productList의 크기 설정
            cell.setCellStyle(styleLeft);  // 왼쪽 정렬 스타일 적용


            int startRow = 8;  
            for (int i = 0; i < productList.size(); i++) {
                row = sheet.getRow(startRow + i);

                if (row == null) row = sheet.createRow(startRow + i);

                // 품명 코드 (B열부터)
                cell = row.createCell(1);  
                cell.setCellValue(i + 1);
                cell.setCellStyle(styleCenter);  

                // 품명 코드 (C열)
                cell = row.createCell(2);  
                cell.setCellValue(productList.get(i).getPumcode());
                cell.setCellStyle(styleLeft);  

                // 품명 (D열)
                cell = row.createCell(3);  
                cell.setCellValue(productList.get(i).getPumname());
                cell.setCellStyle(styleCenter);  

                // 기종 (F열)
                cell = row.createCell(5); 
                cell.setCellValue(productList.get(i).getGijong());
                cell.setCellStyle(styleCenter);  

                // 품번 (G열)
                cell = row.createCell(6); 
                cell.setCellValue(productList.get(i).getDobun());
                cell.setCellStyle(styleLeft);  

                // 수량 (J열)
                cell = row.createCell(9); 
                cell.setCellValue(productList.get(i).getCnt());
                cell.setCellStyle(styleCenter); 
                
             // L열 10번째와 11번째 셀을 병합하는 경우
//                CellRangeAddress mergeRegion = new CellRangeAddress(startRow + i, startRow + i, 10, 11); // 병합 범위: (시작 행, 끝 행, 시작 열, 끝 열)
//                sheet.addMergedRegion(mergeRegion);

                // 병합된 첫 번째 셀에 값 설정
                cell = row.getCell(10); // L열의 셀 가져오기
                if (cell == null) cell = row.createCell(10); // 셀이 없으면 생성
                cell.setCellValue(productList.get(i).getCycleno()); // 값 설정
                cell.setCellStyle(styleCenter); // 스타일 설정

                
                // 아지테이터 RPM (M열)
                cell = row.createCell(12); 
                cell.setCellValue(productList.get(i).getAgitate_rpm());
                cell.setCellStyle(styleCenter); 

                // 등록일 (O열)
                cell = row.createCell(14); 
                cell.setCellValue(productList.get(i).getInsertday());
                cell.setCellStyle(styleCenter); 

                // 수정일 (P열)
                cell = row.createCell(15); 
                cell.setCellValue(productList.get(i).getUpdateday());
                cell.setCellStyle(styleCenter); 
            }

            workbook.setForceFormulaRecalculation(true);
            fos = new FileOutputStream(savePath + now + "_처리품 코드.xlsx");
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

        rtnMap.put("data", new String[]{savePath + now + "_처리품 코드.xlsx"});

        return rtnMap;
    }


    
    // 처리폼관리 데이터 삭제
    @RequestMapping(value = "/product/productList/delete", method = RequestMethod.POST)
    @ResponseBody
    public String deleteProduct(@RequestBody Product product) {
        productService.deleteProductByDobun(product.getDobun());
        return "OK"; 
    }

    // 처리폼관리 특정 제품 조회
    @RequestMapping(value = "/product/productModify/data", method = RequestMethod.POST)
    @ResponseBody
    public Product getProductByDobun(@RequestBody Product product) {
        return productService.getProductByDobun(product.getDobun());
    }
    
    
    
 // 처리폼관리 제품 수정
    @RequestMapping(value = "/product/productModify/data/save", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<Map<String, String>> updateProduct(@RequestBody Product product) {
      //  System.out.println("업데이트 요청 수신: " + product);
        Map<String, String> response = new HashMap<>();

        try {
            productService.updateProduct(product);
           // System.out.println("제품 업데이트 성공: " + product.getDobun());
            response.put("status", "OK");
        } catch (Exception e) {
          //  System.out.println("업데이트 실패: " + e.getMessage());
            response.put("status", "FAIL");
            
        }
        return ResponseEntity.ok(response);
    }
    //일자별투입 리스트 추가
    @RequestMapping(value = "/product/dayList/popup/insert", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> insertOutputTab(@RequestParam("device_code") String deviceCode) {
        try {        	
        	OutPut outPut = new OutPut();
        	outPut.setFireno(deviceCode);
        	
        	outPutDao.setOutPutSend(outPut);
            return ResponseEntity.ok("Insert successful");
        } catch (Exception e) {
            e.printStackTrace(); 
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Insert failed: " + e.getMessage());
        }
    }
    	
    	//공통설비 이동
	    @RequestMapping(value = "/product/productPlayList/Move", method = RequestMethod.POST)
	    public String updateCurLocation(@RequestParam String lotNo) {
	        productService.updateCurLocation(lotNo);
	        return "공통설비 이동 완료"; 
	    }
	 // 5일 자료 완료
	    @RequestMapping(value = "/product/productPlayList/5forcingStart", method = RequestMethod.POST)
	    public String forceCompleteOldData() {
	        productService.forceCompleteOldData();
	        return "5일 자료 완료"; 
	    }
}

