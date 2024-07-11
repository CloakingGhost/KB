package com.spring.study.controller;

import java.io.IOException;
import java.util.Map;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.JsonProcessingException;
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

@Controller
@RequestMapping("/api") // 1
public class UserApiController {
	//2
	private static final Logger log = LoggerFactory.getLogger(UserApiController.class);

	//3
	@RequestMapping(value = "/conn", method = RequestMethod.GET, produces = "text/html; charset=utf-8")
	@ResponseBody
	public String connectionTest() {
		
		return "�񵿱� ���!!";
	}

	//4
	@RequestMapping(value = "/testJsonShape", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String testJsonShape() {
		String str = "{\"name\":\"�̸��Դϴ�\"}";
		return str;
	}
	
	//5
	@RequestMapping(value = "/testJson", method = RequestMethod.GET)
	@ResponseBody
	public CustomUser testJson() throws JsonParseException, JsonMappingException, IOException {
		String str = "{\"name\":\"�̸��Դϴ�\"}";
		ObjectMapper mapper = new ObjectMapper();
		CustomUser user = mapper.readValue(str, CustomUser.class);
		return user;
	}
//6 ����Ʈ ��
	//7
	//8 �����
	@RequestMapping(value = "/join", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String validateInfoFetch(@RequestBody Map<String, Object> paramMap) {
		ObjectMapper mapper = new ObjectMapper();
		log.info("paramMap: {}", paramMap);

		String jsonStr = null;
		try {
			jsonStr = mapper.writeValueAsString(paramMap);
			log.info("jsonStr: {}", jsonStr);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return jsonStr;
	}
// 9. servlet-context.xml �ڵ�ȭ ����
	@RequestMapping(value = "/joinWithConverter", method = RequestMethod.POST)
	@ResponseBody
	public CustomUser validateInfoJQuery(@RequestBody CustomUser user) {
		user.getAddress().setCity("����");
		return user;
	}
}
