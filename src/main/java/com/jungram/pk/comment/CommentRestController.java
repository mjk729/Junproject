package com.jungram.pk.comment;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CommentRestController {

	public Map<String, String> commentCreate(
			@RequestParam("postId") int postId
			,@RequestParam("comment") String comment
			,HttpSession session){
		int userId = (Integer)session.getAttribute("userId");
	}
	
	
	
}
