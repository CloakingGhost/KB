package com.spring.study.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/api")
public class UserApiController {
	private static final Logger log = LoggerFactory.getLogger(UserApiController.class);

	@RequestMapping(value = "/conn", method = RequestMethod.GET)
	@ResponseBody
	public String connectionTest() {
		return "Connection!!";
	}

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	@ResponseBody
	public String testJson() {
		String str = "{\"name\":\"Tom\"}";
		return str;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public String validateInfo(Map<String,Object> map) {
		ObjectMapper mapper = new ObjectMapper();
		
		String jsonStr = null;
		try {
			jsonStr = mapper.writeValueAsString(map);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return jsonStr;
	}

}
