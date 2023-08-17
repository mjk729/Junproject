package com.jungram.pk.post.dto;


import java.util.List;


import com.jungram.pk.comment.dto.CommentDetail;

import lombok.Builder;
import lombok.Getter;


@Builder
@Getter
public class PostDetail {

	// id, content, imagePath, userId, userName
	private int id;
	private String content;
	private String imagePath;
	private String title;
	private String tag;
	private int userId;
	private String loginId;
	
	// 좋아요 개수
	private int likeCount;
	
	// 좋아요 여부
	private boolean isLike;
	
	// 댓글 목록
	private List<CommentDetail> commentList;
	
	
	
}
