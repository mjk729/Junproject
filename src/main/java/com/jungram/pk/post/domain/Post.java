package com.jungram.pk.post.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Post {

	private int id;
	private int userId;
	private String title;
	private String content;
	private String tag;
	private String imagePath;
	private String videoPath;
	private Date createdAt;
	private Date updatedAt;
	
}
