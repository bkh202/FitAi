package org.fitAI;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = "org.fitAI")
@EntityScan(basePackages = "org.fitAI.model.Entity")
@EnableJpaRepositories(basePackages = "org.fitAI.repository")
public class FitAIApplication {

	public static void main(String[] args) {
		SpringApplication.run(FitAIApplication.class, args);
	}
}

