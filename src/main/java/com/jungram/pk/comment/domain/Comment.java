package com.jungram.pk.comment.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Comment {
	private int id;
	private String comment;
	private Date createdAt;
	private Date updatedAt;
}
