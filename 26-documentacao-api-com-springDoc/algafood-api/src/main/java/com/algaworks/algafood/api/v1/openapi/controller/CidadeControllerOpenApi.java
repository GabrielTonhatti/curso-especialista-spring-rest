package com.algaworks.algafood.api.v1.openapi.controller;

import com.algaworks.algafood.api.exceptionhandler.Problem;
import com.algaworks.algafood.api.v1.model.CidadeModel;
import com.algaworks.algafood.api.v1.model.input.CidadeInput;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import org.springframework.hateoas.CollectionModel;
import org.springframework.http.ResponseEntity;

public interface CidadeControllerOpenApi {

    CollectionModel<CidadeModel> listar();

    CidadeModel buscar(Long cidadeId);


    CidadeModel adicionar(CidadeInput cidadeInput);

    CidadeModel atualizar(Long cidadeId, CidadeInput cidadeInput);

    ResponseEntity<Void> remover(Long cidadeId);

}
