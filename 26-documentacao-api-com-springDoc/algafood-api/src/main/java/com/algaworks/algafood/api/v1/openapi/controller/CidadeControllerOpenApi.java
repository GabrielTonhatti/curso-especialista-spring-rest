package com.algaworks.algafood.api.v1.openapi.controller;

import com.algaworks.algafood.api.v1.model.CidadeModel;
import com.algaworks.algafood.api.v1.model.input.CidadeInput;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.parameters.RequestBody;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.hateoas.CollectionModel;
import org.springframework.http.ResponseEntity;

@Tag(name = "Cidades")
@SecurityRequirement(name = "security_auth")
public interface CidadeControllerOpenApi {

    @Operation(summary = "Lista as cidades")
    CollectionModel<CidadeModel> listar();

    @Operation(summary = "Busca uma cidade por Id")
    CidadeModel buscar(@Parameter(description = "ID de uma cidade", example = "1", required = true) Long cidadeId);

    @Operation(summary = "Cadastra uma cidade",
            description = "Cadastro de uma cidade, necessita de um estado e um nome válido")
    CidadeModel adicionar(@RequestBody(description = "Representação de uma nova cidade", required = true) CidadeInput cidadeInput);

    @Operation(summary = "Atualiza uma cidade por ID")
    CidadeModel atualizar(@Parameter(description = "ID de uma cidade", example = "1", required = true) Long cidadeId,
                          @RequestBody(description = "Representação de uma cidade com dados atualizados", required = true)
                          CidadeInput cidadeInput);

    @Operation(summary = "Exclui uma cidade por ID")
    ResponseEntity<Void> remover(@Parameter(description = "ID de uma cidade", example = "1", required = true) Long cidadeId);

}
