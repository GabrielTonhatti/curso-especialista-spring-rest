package com.algaworks.algafood.api.v1.openapi.controller;

import com.algaworks.algafood.api.exceptionhandler.Problem;
import com.algaworks.algafood.api.v1.model.CidadeModel;
import com.algaworks.algafood.api.v1.model.input.CidadeInput;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import org.springframework.hateoas.CollectionModel;

@Api(tags = "Cidades")
public interface CidadeControllerOpenApi {

    @ApiOperation("Lista as cidades")
    CollectionModel<CidadeModel> listar();

    @ApiOperation("Busca uma cidade por ID")
    @ApiResponses({
            @ApiResponse(responseCode = "400", description = "ID da cidade inválido",
                    content = @Content(schema = @Schema(implementation = Problem.class))),
            @ApiResponse(responseCode = "404", description = "Cidade não encontrada",
                    content = @Content(schema = @Schema(implementation = Problem.class))),
    })
    CidadeModel buscar(@ApiParam(value = "ID de uma cidade", example = "1", required = true) Long cidadeId);

    @ApiOperation("Cadastra uma cidade")
    @ApiResponses({
            @ApiResponse(responseCode = "201", description = "Cidade cadastrada")
    })
    CidadeModel adicionar(@ApiParam(name = "Corpo", value = "Representação de uma nova cidade", required = true)
                          CidadeInput cidadeInput);

    @ApiOperation("Atualiza uma cidade por ID")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Cidade atualizada"),
            @ApiResponse(responseCode = "404", description = "Cidade não encontrada",
                    content = @Content(schema = @Schema(implementation = Problem.class)))
    })
    CidadeModel atualizar(@ApiParam(value = "ID de uma cidade", example = "1", required = true) Long cidadeId,
                          @ApiParam(name = "Corpo", value = "Representação de uma cidade com os novos dados",
                                  required = true) CidadeInput cidadeInput);

    @ApiOperation("Exclui uma cidade por ID")
    @ApiResponses({
            @ApiResponse(responseCode = "204", description = "Cidade excluída"),
            @ApiResponse(responseCode = "404", description = "Cidade não encontrada",
                    content = @Content(schema = @Schema(implementation = Problem.class)))
    })
    void remover(@ApiParam(value = "ID de uma cidade", example = "1", required = true) Long cidadeId);

}
