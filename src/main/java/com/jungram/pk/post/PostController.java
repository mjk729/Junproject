package com.jungram.pk.post;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jungram.pk.comment.domain.Comment;
import com.jungram.pk.post.domain.Post;
import com.jungram.pk.post.dto.PostDetail;
import com.jungram.pk.post.service.PostService;



@RequestMapping("/post")
@Controller
public class PostController {

	@Autowired
	private PostService postService;
	
	@GetMapping("/timeline-view")
	public String timeline(HttpSession session,Model model) {
		int userId = (Integer)session.getAttribute("userId");
		List<PostDetail> postList = postService.getPostList(userId);
		
		model.addAttribute("postList", postList);
		
		return "post/timeline";
	}
	
	@GetMapping("/create-view")
	public String input() {
		return "post/input";
	}
	
}
