package com.algaworks.algafood.api.openapi.controller;

import com.algaworks.algafood.api.exceptionhandler.Problem;
import com.algaworks.algafood.api.model.EstadoModel;
import com.algaworks.algafood.api.model.input.EstadoInput;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import org.springframework.hateoas.CollectionModel;

@Api(tags = "Estados")
public interface EstadoControllerOpenApi {

    @ApiOperation("Lista as estdaos")
    CollectionModel<EstadoModel> listar();

    @ApiOperation("Busca um estado por ID")
    @ApiResponses({
            @ApiResponse(responseCode = "400", description = "ID de estado inválido",
                    content = @Content(schema = @Schema(implementation = Problem.class))),
            @ApiResponse(responseCode = "404", description = "Estado não encontrada",
                    content = @Content(schema = @Schema(implementation = Problem.class))),
    })
    EstadoModel buscar(@ApiParam(name = "Corpo", value = "Representação de um nova estado", required = true)
                       Long estadoId);

    @ApiOperation("Cadastra um estado")
    @ApiResponses({
            @ApiResponse(responseCode = "201", description = "Estado cadastrado")
    })
    EstadoModel salvar(@ApiParam(name = "Corpo", value = "Representação de um nova estado com os novos dados")
                       EstadoInput estadoInput);

    @ApiOperation("Atualiza um estado por ID")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Estado atualizado"),
            @ApiResponse(responseCode = "404", description = "Estado não encontrado",
                    content = @Content(schema = @Schema(implementation = Problem.class)))
    })
    EstadoModel atualizar(@ApiParam(name = "Corpo", value = "Representação de um novo estado", required = true)
                          Long estadoId,
                          @ApiParam(name = "Corpo", value = "Representação de um estado com os novos dados")
                          EstadoInput estadoInput);

    @ApiOperation("Exclui um estado por ID")
    @ApiResponses({
            @ApiResponse(responseCode = "204", description = "Estado excluído"),
            @ApiResponse(responseCode = "404", description = "Estado não encontrada",
                    content = @Content(schema = @Schema(implementation = Problem.class)))
    })
    void remover(@ApiParam(name = "Corpo", value = "Representação de um nova estado", required = true) Long estadoId);

}
