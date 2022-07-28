package com.algaworks.algafood.api.v1.openapi.controller;

import com.algaworks.algafood.api.v1.model.GrupoModel;
import com.algaworks.algafood.api.v1.model.input.GrupoInput;
import org.springframework.hateoas.CollectionModel;

public interface GrupoControllerOpenApi {

    CollectionModel<GrupoModel> listar();

    GrupoModel buscar(Long grupoId);

    GrupoModel adicionar(GrupoInput grupoInput);

    GrupoModel atualizar(Long grupoId, GrupoInput grupoInput);

    void remover(Long grupoId);

}
