package com.jungram.pk.user.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jungram.pk.user.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer>{

	List<User> findByLoginIdAndPassword(String loginId, String password);
	
	// SELECT count(1) ...  WHERE `loginId` = #{loginId};
		public int countByLoginId(String loginId);
}
