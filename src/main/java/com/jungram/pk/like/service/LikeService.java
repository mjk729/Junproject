package com.jungram.pk.like.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jungram.pk.like.repository.LikeRepository;

@Service
public class LikeService {
	
	@Autowired
	private LikeRepository likeRepository;
	
	public int addLike(int postId, int userId){
		return likeRepository.insertLike(postId, userId);
	}

	// postId 와 일치하는 좋아요 개수 조회
	public int getCountByPostId(int postId) {
		int likeCount = likeRepository.selectCountByPostId(postId);
		return likeCount;
	}
	
	public boolean isLike(int postId, int userId) {
		int count = likeRepository.selectCountByPostIdUserId(postId, userId);
		
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	public int deleteLike(int postId, int userId) {
		return likeRepository.deleteLike(postId,userId);
	}
	
	public int deleteLikeByPostId(int postId) {
		return likeRepository.deleteLikeByPostId(postId);
	}
	
}
