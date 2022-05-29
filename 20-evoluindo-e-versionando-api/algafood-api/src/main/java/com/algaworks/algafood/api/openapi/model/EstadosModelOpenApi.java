package com.algaworks.algafood.api.openapi.model;

import com.algaworks.algafood.api.model.EstadoModel;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import org.springframework.hateoas.Links;

import java.util.List;

@Data
@ApiModel("EstadosModel")
public class EstadosModelOpenApi {

    private EstadosEmbeddedModelOpenApi _embedded;
    private Links _links;

    @Data
    @ApiModel("EstadosEmbeddedModel")
    public class EstadosEmbeddedModelOpenApi {

        private List<EstadoModel> estados;

    }
}
