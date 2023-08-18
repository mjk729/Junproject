package com.jungram.pk.friend.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jungram.pk.friend.domain.Friend;

@Repository
public interface FriendRepository {

	public int insertFriend(@Param("loginId") String loginId
			,@Param("name") String name);
	
	public String selectFriendByLoginId(@Param("loginId") String loginId); 
}
