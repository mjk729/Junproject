package com.jungram.pk.like;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LikeRestController {
	
	@PostMapping("/post.like")
	public Map<String, String > like(@RequestParam("postId") int postId, HttpSession session){
		
		int userId = (Integer)session.getAttribute("userId");
		
	}
}
