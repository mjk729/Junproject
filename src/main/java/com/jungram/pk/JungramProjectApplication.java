package com.jungram.pk;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;


@SpringBootApplication
public class JungramProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(JungramProjectApplication.class, args);
	}

}
