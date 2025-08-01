package org.fitAI.Config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.reactive.config.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class CorsConfig implements WebMvcConfigurer {
	public void addCorsMappings(CorsRegistry registry) {
		registry.addMapping("/api/**").allowedOrigins("http://localhost:8080").allowedMethods("GET", "POST");
	}
}
