package com.jungram.pk.comment.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Comment {

	private int id;
	private int postId;
	private int userId;
	private String comment;
	private Date createdAt;
	private Date updatedAt;
	
}
