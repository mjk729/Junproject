package com.jungram.pk.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jungram.pk.user.domain.User;
import com.jungram.pk.user.service.UserService;

@RequestMapping("/user")
@RestController
public class UserRestController {

	@Autowired
	private UserService userService;
	
	@PostMapping("/join")
	public Map<String, String> join(
	@RequestParam("loginId") String loginId
	,@RequestParam("password") String password
	,@RequestParam("name") String name
	,@RequestParam("email") String email
	){
		
		User user = userService.addUser(loginId, password, name, email);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(user != null) {
			// 성공
			resultMap.put("result", "success");
		} else {
			// 실패
			resultMap.put("result", "fail");
		}
		return resultMap;
		
	}
	
	@GetMapping("/compareId")
	public Map<String, Boolean> compareId(@RequestParam("loginId") String loginId){
		
		boolean isDuplicate = userService.comepareUser(loginId);
		Map<String, Boolean> resultMap = new HashMap<>();
		
		if(isDuplicate) {
			resultMap.put("isDuplicate", false);			
		} else {
			resultMap.put("isDuplicate", true);
		}
		return resultMap;
	}
	
	@PostMapping("/login")
	public Map<String, String> login(
			@RequestParam("loginId") String loginId
			,@RequestParam("password") String password
			,HttpSession session
			){
	
		User user = userService.getUser(loginId, password);
		Map<String, String> resultMap = new HashMap<>();
		
		if(user != null) {
			resultMap.put("result", "success");
			// 필요한 사용자 정보를 세션에 저장
			// user 테이블 id, user의 이름
			session.setAttribute("userId", user.getId());
			session.setAttribute("userName", user.getName());
			
		} else {
			resultMap.put("result", "fail");			
		}
		return resultMap;
	}
	
}
