package com.jungram.pk.friend.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Friend {

	private int id;
	private String loginId;
	private String name;
	private Date createdAt;
	private Date updatedAt;
	
}
