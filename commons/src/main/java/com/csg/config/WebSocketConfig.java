package com.csg.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.csg.handler.HandShake;
import com.csg.handler.MyWebSocketHandler;

@Configuration
@EnableWebMvc
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		// TODO Auto-generated method stub
		registry.addHandler(myHandler(), "/a").addInterceptors(new HandShake());
		registry.addHandler(myHandler(), "/a/sockjs").addInterceptors(new HandShake()).withSockJS();
	}

	@Bean
	public WebSocketHandler myHandler() {
		return new MyWebSocketHandler();
	}
}
