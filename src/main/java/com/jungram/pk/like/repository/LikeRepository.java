package com.jungram.pk.like.repository;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeRepository {

	public int insertLike(
			@Param("postId") int postId
			,@Param("userId") int userId);
	
	public int selectCountByPostId(@Param("postId") int postId);
	
	// 특정 postId 에 특정 userId로 기록된 행 조회
		public int selectCountByPostIdUserId(
				@Param("postId") int postId
				,@Param("UserId") int UserId
				);
}
