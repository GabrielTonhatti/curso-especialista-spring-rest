package com.algaworks.algafood.core.springdoc;

import com.algaworks.algafood.api.exceptionhandler.Problem;
import io.swagger.v3.core.converter.ModelConverters;
import io.swagger.v3.oas.annotations.enums.SecuritySchemeType;
import io.swagger.v3.oas.annotations.security.OAuthFlow;
import io.swagger.v3.oas.annotations.security.OAuthFlows;
import io.swagger.v3.oas.annotations.security.OAuthScope;
import io.swagger.v3.oas.annotations.security.SecurityScheme;
import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.ExternalDocumentation;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
import io.swagger.v3.oas.models.media.Schema;
import io.swagger.v3.oas.models.responses.ApiResponse;
import io.swagger.v3.oas.models.responses.ApiResponses;
import io.swagger.v3.oas.models.tags.Tag;
import org.springdoc.core.customizers.OpenApiCustomiser;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
                ))
                .components(new Components().schemas(
                        gerarSchemas()
                ));
    }

    @Bean
    public OpenApiCustomiser openApiCustomiser() {
        return openApi -> openApi
                .getPaths()
                .values()
                .forEach(pathItem -> pathItem
                        .readOperationsMap()
                        .forEach((httpMethod, operation) -> {
                            ApiResponses responses = operation.getResponses();

                            switch (httpMethod) {
                                case GET:
                                    responses.addApiResponse("404", new ApiResponse().description("Recurso não encontrado"));
                                    responses.addApiResponse("406", new ApiResponse()
                                            .description("Recurso não aceita representação que poderia ser aceita pelo consumidor"));
                                    responses.addApiResponse("500", new ApiResponse().description("Erro interno no servidor"));
                                    break;
                                case POST:
                                    responses.addApiResponse("400", new ApiResponse().description("Requisição inválida"));
                                    responses.addApiResponse("500", new ApiResponse().description("Erro interno no servidor"));
                                    break;
                                case PUT:
                                    responses.addApiResponse("404", new ApiResponse().description("Recurso não encontrado"));
                                    responses.addApiResponse("400", new ApiResponse().description("Requisição inválida"));
                                    responses.addApiResponse("500", new ApiResponse().description("Erro interno no servidor"));
                                    break;
                                case DELETE:
                                    responses.addApiResponse("404", new ApiResponse().description("Recurso não encontrado"));
                                    responses.addApiResponse("500", new ApiResponse().description("Erro interno no servidor"));
                                    break;
                                default:
                                    break;
                            }
                        })
                );
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

    private Map<String, Schema> gerarSchemas() {
        final Map<String, Schema> schemaMap = new HashMap<>();

        Map<String, Schema> problemSchema = ModelConverters.getInstance().read(Problem.class);
        Map<String, Schema> problemObjectSchema = ModelConverters.getInstance().read(Problem.Objects.class);

        Arrays.asList(problemSchema, problemObjectSchema).forEach(schemaMap::putAll);

        return schemaMap;
    }

}
