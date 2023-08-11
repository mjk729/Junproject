package com.jungram.pk.post.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jungram.pk.common.FileManager;
import com.jungram.pk.post.domain.Post;
import com.jungram.pk.post.dto.PostDetail;
import com.jungram.pk.post.repository.PostRepository;
import com.jungram.pk.user.domain.User;
import com.jungram.pk.user.service.UserService;

@Service
public class PostService {

	@Autowired
	private PostRepository postRepository;
	
	@Autowired
	private UserService userService;
	
	public int addPost(int userId, String title, String content,String tag, MultipartFile file) {
		
		String imagePath = FileManager.saveFile(userId, file);
		
		return postRepository.insertPost(userId, title, content, tag, imagePath);
	}
	
	public List<PostDetail> getPostList(){
		
		List<Post> postList = postRepository.selectPostList();
		
		List<PostDetail> postDetailList = new ArrayList<>();
		for(Post post:postList) {
			
			User user = userService.getUser(post.getUserId());
			
			PostDetail postDetail = PostDetail.builder()
									.id(post.getId())
									.content(post.getContent())
									.title(post.getTitle())
									.tag(post.getTag())
									.imagePath(post.getImagePath())
									.userId(post.getUserId())
									.loginId(user.getLoginId())
									.build();
			postDetailList.add(postDetail);
		}
		return postDetailList;
	}
	
	public int addComment(int userId, String comment) {
		
		return postRepository.insertComment(userId, comment);
	}
	
}
