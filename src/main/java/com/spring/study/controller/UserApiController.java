package com.spring.study.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.study.dto.CustomUser;

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

	@RequestMapping(value = "/login/fetch", method = RequestMethod.POST)
	@ResponseBody
	public String validateInfo(@RequestBody CustomUser user) {
		ObjectMapper mapper = new ObjectMapper();
		
		String jsonStr = null;
		try {
			jsonStr = mapper.writeValueAsString(user);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return jsonStr;
	}

}
