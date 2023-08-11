package com.jungram.pk.post.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jungram.pk.post.domain.Post;

@Repository
public interface PostRepository {

	public int insertPost(
			@Param("userId") int userId
			,@Param("title") String title
			,@Param("content") String content
			,@Param("tag") String tag
			,@Param("imagePath") String imagePath					
			);
	
	public List<Post> selectPostList();
	
	public int insertComment(
			@Param("userId") int userId
			,@Param("comment") String comment);
	
}
