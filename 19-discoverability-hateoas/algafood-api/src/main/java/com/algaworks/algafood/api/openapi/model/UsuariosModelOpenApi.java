package com.algaworks.algafood.api.openapi.model;

import com.algaworks.algafood.api.model.RestauranteModel;
import com.algaworks.algafood.api.model.UsuarioModel;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import org.springframework.hateoas.Links;

import java.util.List;

@Data
@ApiModel("UsuariosModel")
public class UsuariosModelOpenApi {

    private UsuariosEmbeddedModelOpenApi _embedded;
    private Links _links;

    @Data
    @ApiModel("UsuariosEmbeddedModel")
    public class UsuariosEmbeddedModelOpenApi {

        private List<UsuarioModel> usuarios;

    }
}
