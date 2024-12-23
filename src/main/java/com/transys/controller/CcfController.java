package com.transys.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutionException;

import org.eclipse.milo.opcua.stack.core.UaException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.transys.util.OpcDataMap;

@Controller
public class CcfController {
	
	
	
    @RequestMapping(value= "/ccf/ccf01_02", method = RequestMethod.GET)
    public String ccf01_02(Model model) {
        return "/ccf/ccf01_02.jsp"; // 
    }	
    @RequestMapping(value= "/ccf/ccf03_04", method = RequestMethod.GET)
    public String ccf03_04(Model model) {
        return "/ccf/ccf03_04.jsp"; // 
    }	
    @RequestMapping(value= "/ccf/ccf05_06", method = RequestMethod.GET)
    public String ccf05_06(Model model) {
        return "/ccf/ccf05_06.jsp"; // 
    }	
    @RequestMapping(value= "/ccf/ccf07", method = RequestMethod.GET)
    public String ccf07(Model model) {
        return "/ccf/ccf07.jsp"; // 
    }	
	@RequestMapping(value = "/popup_data", method = RequestMethod.GET)
	 public String popup_data(Model model) {
		return "/include/popup_data.jsp";
	}
	
	
    
    @RequestMapping(value= "/ccf/ccf01_02/view", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> ccf01_02View() throws UaException, InterruptedException, ExecutionException {
    	Map<String, Object> returnMap = new HashMap<String, Object>();

    	OpcDataMap opcDataMap = new OpcDataMap();
    	
    	returnMap = opcDataMap.getOpcDataListMap("Transys.CCF0102");
    	
    	return returnMap;    	
    }	
    
    @RequestMapping(value= "/ccf/ccf03_04/view", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> ccf03_04View() throws UaException, InterruptedException, ExecutionException {
    	Map<String, Object> returnMap = new HashMap<String, Object>();

    	OpcDataMap opcDataMap = new OpcDataMap();
    	
    	returnMap = opcDataMap.getOpcDataListMap("Transys.CCF0304");
    	
    	return returnMap;    	
    }	
    
    @RequestMapping(value= "/ccf/ccf05_06/view", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> ccf05_06View() throws UaException, InterruptedException, ExecutionException {
    	Map<String, Object> returnMap = new HashMap<String, Object>();
    	
    	OpcDataMap opcDataMap = new OpcDataMap();
    	
    	returnMap = opcDataMap.getOpcDataListMap("Transys.CCF0506");
    	
    	return returnMap;    	
    }
    
    @RequestMapping(value= "/ccf/ccf07/view", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> ccf07View() throws UaException, InterruptedException, ExecutionException {
    	Map<String, Object> returnMap = new HashMap<String, Object>();
    	
    	OpcDataMap opcDataMap = new OpcDataMap();
    	
    	returnMap = opcDataMap.getOpcDataListMap("Transys.CCF07");
    	
    	return returnMap;    	
    }	    
	
    
}
