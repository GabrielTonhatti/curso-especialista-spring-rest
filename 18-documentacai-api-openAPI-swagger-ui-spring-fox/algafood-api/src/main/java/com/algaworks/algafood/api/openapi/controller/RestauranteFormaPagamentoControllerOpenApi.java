package com.algaworks.algafood.api.openapi.controller;

import com.algaworks.algafood.api.assembler.FormaPagamentoModelAssembler;
import com.algaworks.algafood.api.exceptionhandler.Problem;
import com.algaworks.algafood.api.model.FormaPagamentoModel;
import com.algaworks.algafood.domain.model.Restaurante;
import com.algaworks.algafood.domain.service.CadastroRestauranteService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Api(tags = "Restaurantes")
public interface RestauranteFormaPagamentoControllerOpenApi {

    @ApiOperation("Lista as formas de pagamento associadas a restaurante")
    @ApiResponses({
            @ApiResponse(responseCode = "404", description = "Restaurante não encontrado",
                    content = @Content(schema = @Schema(implementation = Problem.class)))
    })
    List<FormaPagamentoModel> listar(@ApiParam(value = "ID de um restaurante", example = "1", required = true) Long restauranteId);

    @ApiOperation("Associação de restaurante com forma de pagamento")
    @ApiResponses({
            @ApiResponse(responseCode = "204", description = "Associação realizada com sucesso"),
            @ApiResponse(responseCode = "404", description = "Restaurante ou forma de pagamento não encontrado",
                    content = @Content(schema = @Schema(implementation = Problem.class)))
    })
    void associar(@ApiParam(value = "ID do restaurante", example = "1", required = true) Long restauranteId,
                  @ApiParam(value = "ID da forma de pagamento", example = "1", required = true) Long formaPagamentoId);

    @ApiOperation("Desassociação de restaurante com forma de pagamento")
    @ApiResponses({
            @ApiResponse(responseCode = "204", description = "Desassociação realizada com sucesso"),
            @ApiResponse(responseCode = "404", description = "Restaurante ou forma de pagamento não encontrado",
                    content = @Content(schema = @Schema(implementation = Problem.class)))
    })
    void desassociar(@ApiParam(value = "ID do restaurante", example = "1", required = true) Long restauranteId,
                     @ApiParam(value = "ID da forma de pagamento", example = "1", required = true) Long formaPagamentoId);

}
