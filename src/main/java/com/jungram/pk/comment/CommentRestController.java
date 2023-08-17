package com.jungram.pk.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jungram.pk.comment.service.CommentService;


@RequestMapping("/post/comment")
@RestController
public class CommentRestController {

	@Autowired
	private CommentService commentService;
	
	@PostMapping("/create")
	public Map<String, String> commentCreate(
			@RequestParam("postId") int postId
			,@RequestParam("comment") String comment
			,HttpSession session){
		
		int userId = (Integer)session.getAttribute("userId");
		int count = commentService.addComment(postId, userId,comment);
		
Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		}else {
			resultMap.put("result", "fail");			
		}
		
		return resultMap;
	}
	
	
}
