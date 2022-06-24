package com.algaworks.algafood.api.v1.openapi.controller;

import com.algaworks.algafood.api.exceptionhandler.Problem;
import com.algaworks.algafood.api.v1.model.UsuarioModel;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import org.springframework.hateoas.CollectionModel;
import org.springframework.http.ResponseEntity;

@Api(tags = "Restaurantes")
public interface RestauranteUsuarioResponsavelControllerOpenApi {

    @ApiOperation("Lista os responsáveis associados a restaurante")
    @ApiResponses({
            @ApiResponse(responseCode = "404", description = "Restaurante não encontrado",
                    content = @Content(schema = @Schema(implementation = Problem.class)))
    })
    CollectionModel<UsuarioModel> listar(@ApiParam(value = "ID de um restaurante", example = "1", required = true) Long restauranteId);

    @ApiOperation("Associação de restaurante com usuário responsável")
    @ApiResponses({
            @ApiResponse(responseCode = "204", description = "Associação realizada com sucesso"),
            @ApiResponse(responseCode = "404", description = "Restaurante ou usuário não encontrado",
                    content = @Content(schema = @Schema(implementation = Problem.class)))
    })
    ResponseEntity<Void> associar(@ApiParam(value = "ID do restaurante", example = "1", required = true) Long restauranteId,
                                  @ApiParam(value = "ID do usuário", example = "1", required = true) Long usuarioId) ;

    @ApiOperation("Desassociação de restaurante com usuário responsável")
    @ApiResponses({
            @ApiResponse(responseCode = "204", description = "Desassociação realizada com sucesso"),
            @ApiResponse(responseCode = "404", description = "Restaurante ou usuário não encontrado",
                    content = @Content(schema = @Schema(implementation = Problem.class)))
    })
    ResponseEntity<Void> desassociar(@ApiParam(value = "ID do restaurante", example = "1", required = true) Long restauranteId,
                     @ApiParam(value = "ID do usuário", example = "1", required = true) Long usuarioId) ;

}
