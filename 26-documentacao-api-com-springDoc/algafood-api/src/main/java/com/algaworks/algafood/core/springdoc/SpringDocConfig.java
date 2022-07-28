package com.algaworks.algafood.core.springdoc;

import io.swagger.v3.oas.annotations.enums.SecuritySchemeType;
import io.swagger.v3.oas.annotations.security.OAuthFlow;
import io.swagger.v3.oas.annotations.security.OAuthFlows;
import io.swagger.v3.oas.annotations.security.OAuthScope;
import io.swagger.v3.oas.annotations.security.SecurityScheme;
import io.swagger.v3.oas.models.ExternalDocumentation;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
import io.swagger.v3.oas.models.responses.ApiResponse;
import io.swagger.v3.oas.models.responses.ApiResponses;
import io.swagger.v3.oas.models.tags.Tag;
import org.springdoc.core.customizers.OpenApiCustomiser;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.List;

@Configuration
@SecurityScheme(
        name = "security_auth",
        type = SecuritySchemeType.OAUTH2,
        flows = @OAuthFlows(authorizationCode = @OAuthFlow(
                authorizationUrl = "${springdoc.oAuthFlow.authorizationUrl}",
                tokenUrl = "${springdoc.oAuthFlow.tokenUrl}",
                scopes = {
                        @OAuthScope(name = "READ", description = "read scope"),
                        @OAuthScope(name = "WRITE", description = "write scope")
                }
        ))
)
public class SpringDocConfig {

    @Bean
    public OpenAPI openAPI() {
        return new OpenAPI()
                .info(info())
                .externalDocs(externalDocs())
                .tags(List.of(
                        new Tag().name("Cidades").description("Gerencia as cidades")
                ));
    }

    @Bean
    public OpenApiCustomiser openApiCustomiser() {
        return openApi ->
                openApi
                        .getPaths()
                        .values()
                        .stream()
                        .flatMap(pathItem -> pathItem.readOperations().stream())
                        .forEach(operation -> {
                            ApiResponses responses = operation.getResponses();

                            ApiResponse apiResponseNaoEncontrado = new ApiResponse().description("Recurso não encontrado");
                            ApiResponse apiResponseErroInterno = new ApiResponse().description("Erro interno do servidor");
                            ApiResponse apiResponseSemRepresentacao = new ApiResponse()
                                    .description("Recurso não possui uma representação que poderia ser aceita pelo consumidor");

                            responses.addApiResponse("500", apiResponseErroInterno);
                            responses.addApiResponse("404", apiResponseNaoEncontrado);
                            responses.addApiResponse("406", apiResponseSemRepresentacao);
                        });
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
