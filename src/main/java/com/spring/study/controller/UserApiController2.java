package com.spring.study.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.study.dto.CustomUser;
import com.spring.study.dto.UserListWrapper;

@Controller
@RequestMapping("/api")
public class UserApiController2 {

	private static final Logger log = LoggerFactory.getLogger(UserApiController2.class);

	@RequestMapping(value = "/conn", method = RequestMethod.GET, produces = "text/html; charset=utf-8")
	@ResponseBody
	public String connection() {
		return "<h1>통신 test</h1>";
	}

	@RequestMapping(value = "/testJson", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String testJsonShape() {
		String str = "{\"name\" : \"이름입니다\"}";
		return str;
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String joinVer1(@RequestBody Map<String, Object> paramMap) {
		ObjectMapper mapper = new ObjectMapper();
		String toString = null;
		try {
			toString = mapper.writeValueAsString(paramMap);
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return toString;
	}

	@RequestMapping(value = "/joinWithConverter", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> joinVer2(@RequestBody Map<String, Object> paramMap) {
		paramMap.remove("name");
		return paramMap;
	}

	@RequestMapping(value = "/joinWithClass", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public CustomUser joinVer3(@RequestBody CustomUser user) {
		user.setName("다른 이름");
		return user;
	}

	@RequestMapping(value = "/joinList", method = RequestMethod.POST)
	@ResponseBody
	public List<CustomUser> joinList(@RequestBody UserListWrapper users) {

		return users.getUsers();
	}
}