package com.jungram.pk.user;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/user")
@Controller
public class UserController {

	@GetMapping("/login-view")
	public String login() {
		return "user/login";
	}
	
	@GetMapping("/join-view")
	public String loginInput() {
		return "user/join";
	}
	
	@GetMapping("/logout")
		public String logout(HttpSession session) {
			session.removeAttribute("userId");
			session.removeAttribute("userName");
			return "redirect:/user/login-view";
		}
	}

