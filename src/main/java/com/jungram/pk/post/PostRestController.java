package com.jungram.pk.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.jungram.pk.post.service.PostService;

@RequestMapping("/post")
@RestController
public class PostRestController {

	@Autowired
	private PostService postService;
	
	@PostMapping("/create")
	public Map<String, String> JungramCreate(
			@RequestParam("title") String title
			, @RequestParam("content") String content
			, @RequestParam(value="tag", required=false) String tag
			, @RequestParam(value="file", required=false) MultipartFile file
			, HttpSession session
			){
		
		int userId = (Integer) session.getAttribute("userId");
		int count = postService.addPost(userId, title, content,tag, file);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		}else {
			resultMap.put("result", "fail");			
		}
		
		return resultMap;
	}
	
	@DeleteMapping("/delete")
	public Map<String, String> deletePost(@RequestParam("postId") int postId
			,HttpSession session){
		
		int userId = (Integer)session.getAttribute("userId");
		int count = postService.deletePost(postId, userId);
		
		Map<String, String> resultMap = new HashMap<>();
		if(count == 1) {
			resultMap.put("result", "success");
		}else {
			resultMap.put("result", "fail");			
		}
		
		return resultMap;
	}
	
}
