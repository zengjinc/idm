package com.ssm.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.pojo.User;
import com.ssm.service.IUserService;
import com.ssm.utils.DESUtil;

@Controller
public class LoginController {

	@Autowired
	private IUserService userService;
	
	@RequestMapping("/login")
	@ResponseBody
	public Map<String,String> login(HttpSession session,@RequestBody String jsonStr){
		Map<String,String> result = new HashMap<>();
		
		try{
			
			JsonNode node = new ObjectMapper().readTree(jsonStr);
			
			String userName = node.get("userName").asText();
			String pwd = node.get("pwd").asText();
			
			User user = userService.doLogin(userName, pwd);
			
			if(user != null){
				session.setAttribute("user", user.getUserUuid());
				result.put("result", "success");
				String encPwd = new DESUtil().encrypt(user.getUserPwd());
				result.put("encPwd", encPwd);
				return result;
			}else{
				result.put("result", "登录失败，用户名或密码错误。");
				return result;
			}
			
		}catch(Exception e){
			e.printStackTrace();
			result.put("result", e.getMessage());
			return result;
		}
		
	}
	
	@RequestMapping("/cookielogin")
	@ResponseBody
	public String cookieLogin(HttpSession session,@RequestBody String jsonStr){
		try{
			JsonNode node = new ObjectMapper().readTree(jsonStr);
			
			String userName = node.get("userName").asText();
			String pwd = node.get("pwd").asText();
			
			String decPwd = new DESUtil().decrypt(pwd);
			
			User user = userService.doLogin(userName, decPwd);
			
			if(user != null){
				session.setAttribute("user", user.getUserUuid());
				return "success";
			}else{
				return "登录失败，用户名或密码错误。";
			}
			
		}catch(Exception e){
			e.printStackTrace();
			return e.getMessage();
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "login";
	}
}
