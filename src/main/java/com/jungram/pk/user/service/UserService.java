package com.jungram.pk.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jungram.pk.common.EncryptUtils;
import com.jungram.pk.user.domain.User;
import com.jungram.pk.user.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

	public User addUser(String loginId, String password, String name, String email) {

		// password 암호화
		String ecryptPassword = EncryptUtils.md5(password);

		User user = userRepository
				.save(User.builder().loginId(loginId).password(ecryptPassword).name(name).email(email).build());

		return user;
	}

	public boolean comepareUser(String loginId) {
		int count = userRepository.countByLoginId(loginId);

		if (count == 0) {
			// 중복 안됨
			return false;
		} else {
			// 중복됨
			return true;
		}
	}

	public User getUser(String loginId, String password) {
		String encryptPassword = EncryptUtils.md5(password);
		List<User> userList = userRepository.findByLoginIdAndPassword(loginId, encryptPassword);

		// 비워진 경우
		if (userList.isEmpty()) {
			return null;
		} else {
			return userList.get(0);
		}

	}

	public User getUser(int id) {
		User user = userRepository.findById(id).orElse(null);
		return user;
	}
	

	public String getloginId(String loginId) {
		return userRepository.findByLoginId(loginId);
	}
	
}
