package com.jungram.pk.friend.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jungram.pk.friend.domain.Friend;
import com.jungram.pk.friend.repository.FriendRepository;

@Service
public class FriendService {

	@Autowired
	private FriendRepository friendRepository;
	
	public int addFriend(String loginId, String name)
	{
		return friendRepository.insertFriend(loginId, name);
	}
	
	public String selectFriendByLoginId(String loginId) {
		return friendRepository.selectFriendByLoginId(loginId);
	}
	
}
