package com.jungram.pk.comment.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jungram.pk.comment.domain.Comment;
import com.jungram.pk.comment.dto.CommentDetail;
import com.jungram.pk.comment.repository.CommentRepository;
import com.jungram.pk.user.domain.User;
import com.jungram.pk.user.service.UserService;

@Service
public class CommentService {

	@Autowired
	private CommentRepository commentRepository;

	@Autowired
	private UserService userService;
	
	public int addComment(int postId, int userId, String content) {
		return commentRepository.insertComment(postId, userId, content);
	}
	
	public List<CommentDetail> getCommentByPostId(int postId) {
		
		List<Comment> commentList = commentRepository.selectCommentByPostId(postId);
		
		
		List<CommentDetail> commentDetailList = new ArrayList<>();
		for(Comment comment:commentList) {
			
			User user = userService.getUser(comment.getUserId());
			
			CommentDetail commentDetail = CommentDetail.builder()
											.id(comment.getId())
											.comment(comment.getComment())
											.userId(comment.getUserId())
											.loginId(user.getLoginId())
											.build();
			
			commentDetailList.add(commentDetail);
		}
		
		return commentDetailList;
	}
	
	public int deleteCommentByPostId(int postId) {
		return commentRepository.deleteCommentByPostId(postId);
	}
	
}
