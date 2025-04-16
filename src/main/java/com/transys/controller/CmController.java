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
public class CmController {
	  @RequestMapping(value= "/cm/cm01", method = RequestMethod.GET)
	    public String cm01(Model model) {
	        return "/cm/cm01.jsp"; // 
	    }	
	  
	  @RequestMapping(value= "/cm/cm02", method = RequestMethod.GET)
	    public String cm02(Model model) {
	        return "/cm/cm02.jsp"; // 
	    }	
	  
	  
	  @RequestMapping(value= "/cm/cm01/view", method = RequestMethod.POST)
	    @ResponseBody
	    public Map<String, Object> cm01View() throws UaException, InterruptedException, ExecutionException {
	    	Map<String, Object> returnMap = new HashMap<String, Object>();

	    	OpcDataMap opcDataMap = new OpcDataMap();
	    	
	    	returnMap = opcDataMap.getOpcDataListMap("Transys.CM01");
	    	
	    	return returnMap;    	
	    }	
	  
	  @RequestMapping(value= "/cm/cm02/view", method = RequestMethod.POST)
	    @ResponseBody
	    public Map<String, Object> cm02View() throws UaException, InterruptedException, ExecutionException {
	    	Map<String, Object> returnMap = new HashMap<String, Object>();

	    	OpcDataMap opcDataMap = new OpcDataMap();
	    	
	    	returnMap = opcDataMap.getOpcDataListMap("Transys.CM02");
	    	
	    	return returnMap;    	
	    }	
}
