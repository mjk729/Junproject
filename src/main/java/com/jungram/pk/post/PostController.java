package com.jungram.pk.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jungram.pk.post.domain.Post;
import com.jungram.pk.post.dto.PostDetail;
import com.jungram.pk.post.service.PostService;



@RequestMapping("/post")
@Controller
public class PostController {

	@Autowired
	private PostService postService;
	
	@GetMapping("/timeline-view")
	public String timeline(Model model) {
		List<PostDetail> postList = postService.getPostList();
		
		model.addAttribute("postList", postList);
		
		return "post/timeline";
	}
	
	@GetMapping("/create-view")
	public String input() {
		return "post/input";
	}
	
}
