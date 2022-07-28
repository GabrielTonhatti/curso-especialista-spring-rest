package com.algaworks.algafood.core.springdoc;

import io.swagger.v3.oas.models.ExternalDocumentation;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SpringDocConfig {

    @Bean
    public OpenAPI openAPI() {
        return new OpenAPI()
                .info(info())
                .externalDocs(externalDocs())

                ;
    }

    private static ExternalDocumentation externalDocs() {
        return new ExternalDocumentation()
                .description("AlgaWorks")
                .url("https://algaworks.com");
    }

    private static Info info() {
        return new Info()
                .title("AlgaFood API")
                .description("REST API do AlgaFood")
                .license(new License()
                        .name("Apache 2.0")
                        .url("https://springdoc.org")
                )
                .version("1.0");
    }

}
