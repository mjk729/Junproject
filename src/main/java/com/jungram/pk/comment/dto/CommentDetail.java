package com.jungram.pk.comment.dto;

import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class CommentDetail {
	private int id;
	private String comment;
	private int userId;
	private String loginId;
}
