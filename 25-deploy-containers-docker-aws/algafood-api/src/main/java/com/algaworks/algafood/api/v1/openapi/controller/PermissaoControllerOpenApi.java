package com.algaworks.algafood.api.v1.openapi.controller;

import com.algaworks.algafood.api.v1.model.PermissaoModel;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.hateoas.CollectionModel;

@Api(tags = "Permissões")
public interface PermissaoControllerOpenApi {

    @ApiOperation("Lista as cidades")
    CollectionModel<PermissaoModel> listar();

}
