package com.algaworks.algafood.core.springdoc;

import io.swagger.v3.oas.models.ExternalDocumentation;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
import org.springdoc.core.GroupedOpenApi;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SpringDocConfig {

//    @Bean
//    public OpenAPI openAPI() {
//        return new OpenAPI()
//                .info(info())
//                .externalDocs(externalDocs());
//    }

    @Bean
    public GroupedOpenApi groupedOpenApi() {
        return GroupedOpenApi
                .builder()
                .group("AlgaFood API Admin")
                .pathsToMatch("/v1/**")
                .addOpenApiCustomiser(openApi -> openApi
                        .info(info("Admin"))
                        .externalDocs(externalDocs())
                )
                .build();
    }

    @Bean
    public GroupedOpenApi groupedOpenApiCliente() {
        return GroupedOpenApi
                .builder()
                .group("AlgaFood API Cliente")
                .pathsToMatch("/cliente/v1/**")
                .addOpenApiCustomiser(openApi -> openApi
                        .info(info("Cliente"))
                        .externalDocs(externalDocs())
                )
                .build();
    }

    private static ExternalDocumentation externalDocs() {
        return new ExternalDocumentation()
                .description("AlgaWorks")
                .url("https://algaworks.com");
    }

    private static Info info(String info) {
        return new Info()
                .title("AlgaFood API " + info)
                .description("REST API do AlgaFood")
                .license(new License()
                        .name("Apache 2.0")
                        .url("https://springdoc.org")
                )
                .version("1.0");
    }

}
