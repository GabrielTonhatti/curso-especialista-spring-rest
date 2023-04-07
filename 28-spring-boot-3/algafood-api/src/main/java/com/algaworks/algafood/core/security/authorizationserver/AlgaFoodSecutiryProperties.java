package com.algaworks.algafood.core.security.authorizationserver;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;
import org.springframework.validation.annotation.Validated;

import jakarta.validation.constraints.NotBlank;

@Getter
@Setter
@Validated
@Component
@ConfigurationProperties("algafood.auth")
public class AlgaFoodSecutiryProperties {

    @NotBlank
    private String providerUrl;

}
