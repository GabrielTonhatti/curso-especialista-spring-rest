package com.algaworks.algafood.api.openapi.model;

import com.algaworks.algafood.api.model.GrupoModel;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import org.springframework.hateoas.Links;

import java.util.List;

@Data
@ApiModel("GruposModel")
public class GruposModelOpenApi {

    private GruposEmbeddedModelOpenApi _embedded;
    private Links _links;

    @Data
    @ApiModel("GruposEmbeddedModel")
    public class GruposEmbeddedModelOpenApi {

        private List<GrupoModel> grupos;

    }
}
