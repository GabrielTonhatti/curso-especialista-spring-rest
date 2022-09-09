package com.algaworks.algafood.core.security.authorizationserver;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class AuthorizationServerConfig {

    @Bean
    public SecurityFilterChain authFilterChain(HttpSecurity http) throws Exception {
        return null;
    }

}
