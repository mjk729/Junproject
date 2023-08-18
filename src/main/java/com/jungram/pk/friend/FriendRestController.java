package com.jungram.pk.friend;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jungram.pk.friend.service.FriendService;
import com.jungram.pk.user.service.UserService;

@RequestMapping("/friend")
@RestController
public class FriendRestController {

	@Autowired
	private FriendService friendService;
	
	@Autowired
	private UserService userService;
	
	@PostMapping("/add")
	public Map<String, String> addFriend(
			@RequestParam("loginId") String loginId
			,@RequestParam("name") String name
			){
		int count = friendService.addFriend(loginId, name);
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		}else {
			resultMap.put("result", "fail");			
		}
		
		return resultMap;
	}
	
	@PostMapping("/search")
	public Map<String, String> searchFriend(@RequestParam("loginId") String loginId){
		
		String loginId1 = userService.getloginId(loginId);
		String loginId2 = friendService.selectFriendByLoginId(loginId);
		Map<String, String> resultMap = new HashMap<>();
		if(loginId1 == loginId2) {
			resultMap.put("result", "success");
		}else {
			resultMap.put("result", "fail");			
		}
		
		return resultMap;
	}
	
}
