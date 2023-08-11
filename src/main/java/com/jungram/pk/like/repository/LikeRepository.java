package com.jungram.pk.like.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeRepository {

	public int insertLike(
			@Param("postId") int postId
			,@Param("userId") int userId);
	
}
