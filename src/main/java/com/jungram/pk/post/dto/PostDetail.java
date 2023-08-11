package com.jungram.pk.post.dto;

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
}
