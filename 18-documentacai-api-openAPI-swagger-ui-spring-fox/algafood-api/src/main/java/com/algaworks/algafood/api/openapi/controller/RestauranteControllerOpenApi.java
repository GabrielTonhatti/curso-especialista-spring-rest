package com.algaworks.algafood.api.openapi.controller;


import com.algaworks.algafood.api.exceptionhandler.Problem;
import com.algaworks.algafood.api.model.RestauranteModel;
import com.algaworks.algafood.api.model.input.RestauranteInput;
import com.algaworks.algafood.api.openapi.model.RestauranteBasicoModelOpenApi;
import io.swagger.annotations.*;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

import java.util.List;

@Api(tags = "Restaurantes")
public interface RestauranteControllerOpenApi {

    @ApiOperation(value = "Lista os restaurantes", response = RestauranteBasicoModelOpenApi.class)
    @ApiImplicitParams({
            @ApiImplicitParam(value = "Nome da projecao de restaurante", allowableValues = "apenas-nome",
                    name = "projecao", paramType = "query", type = "string")
    })
    List<RestauranteModel> listar();

    @ApiOperation(value = "Lista os restaurantes", hidden = true)
    List<RestauranteModel> listarApenasNomes();

    @ApiOperation("Busca um restaurante por ID")
    @ApiResponses({
            @ApiResponse(responseCode = "400", description = "ID d restaurante inválido",
                    content = @Content(schema = @Schema(implementation = Problem.class))),
            @ApiResponse(responseCode = "404", description = "Restaurante não encontrada",
                    content = @Content(schema = @Schema(implementation = Problem.class))),
    })
    RestauranteModel buscar(@ApiParam(value = "ID de um restaurante", example = "1", required = true) Long restauranteId);

    @ApiOperation("Cadastra um restaurante")
    @ApiResponses({
            @ApiResponse(responseCode = "201", description = "Restaurante cadastrada")
    })
    RestauranteModel adicionar(@ApiParam(name = "Corpo", value = "Representação de um novo restaurante com os novos dados",
            required = true) RestauranteInput restauranteInput);

    @ApiOperation("Atualiza um restaurante por ID")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Restaurante atualizada"),
            @ApiResponse(responseCode = "404", description = "Restaurante não encontrada",
                    content = @Content(schema = @Schema(implementation = Problem.class)))
    })
    RestauranteModel atualizar(@ApiParam(value = "ID de um restaurante", example = "1", required = true) Long restauranteId,
                               @ApiParam(name = "Corpo", value = "Representação de um restaurante com os novos dados",
                                       required = true) RestauranteInput restauranteInput);

    @ApiOperation("Ativa um restaurante por ID")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Restaurante ativado com sucesso"),
            @ApiResponse(responseCode = "404", description = "Restaurante não encontrada",
                    content = @Content(schema = @Schema(implementation = Problem.class)))
    })
    void ativar(@ApiParam(value = "ID de um restaurante", example = "1", required = true) Long restauranteId);

    @ApiOperation("Inativa um restaurante por ID")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Restaurante inativado com sucesso"),
            @ApiResponse(responseCode = "404", description = "Restaurante não encontrada",
                    content = @Content(schema = @Schema(implementation = Problem.class)))
    })
    void inativar(@ApiParam(value = "ID de um restaurante", example = "1", required = true) Long restauranteId);

    @ApiOperation("Ativa múltiplos restaurantes")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Restaurantes ativados com sucesso"),
            @ApiResponse(responseCode = "404", description = "Restaurante não encontrada",
                    content = @Content(schema = @Schema(implementation = Problem.class)))
    })
    void ativarMultiplos(@ApiParam(name = "corpo", value = "IDs de restaurantes", required = true) List<Long> restauranteIds);

    @ApiOperation("Inativa múltiplos restaurantes")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Restaurantes inativados com sucesso"),
            @ApiResponse(responseCode = "404", description = "Restaurante não encontrada",
                    content = @Content(schema = @Schema(implementation = Problem.class)))
    })
    void inativarMultiplos(@ApiParam(name = "corpo", value = "IDs de restaurantes", required = true) List<Long> restauranteIds);

    @ApiOperation("Abre um restaurante por ID")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Restaurante aberto com sucesso"),
            @ApiResponse(responseCode = "404", description = "Restaurante não encontrada",
                    content = @Content(schema = @Schema(implementation = Problem.class)))
    })
    void abrir(@ApiParam(value = "ID de um restaurante", example = "1", required = true) Long restauranteId);

    @ApiOperation("Fecha um restaurante por ID")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Restaurante fechado com sucesso"),
            @ApiResponse(responseCode = "404", description = "Restaurante não encontrada",
                    content = @Content(schema = @Schema(implementation = Problem.class)))
    })
    void fechar(@ApiParam(value = "ID de um restaurante", example = "1", required = true) Long restauranteId);


}
