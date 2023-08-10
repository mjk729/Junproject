package com.jungram.pk.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jungram.pk.common.FileManager;
import com.jungram.pk.post.domain.Post;
import com.jungram.pk.post.repository.PostRepository;

@Service
public class PostService {

	@Autowired
	private PostRepository postRepository;
	
	public int addPost(int userId, String title, String content,String tag, MultipartFile file) {
		
		String imagePath = FileManager.saveFile(userId, file);
		
		return postRepository.insertPost(userId, title, content, tag, imagePath);
	}
	
	public List<Post> getPostList(){
		return postRepository.selectPostList();
	}
	
}
