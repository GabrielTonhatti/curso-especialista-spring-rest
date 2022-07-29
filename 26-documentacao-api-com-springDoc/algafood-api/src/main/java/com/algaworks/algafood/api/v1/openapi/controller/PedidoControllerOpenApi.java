package com.algaworks.algafood.api.v1.openapi.controller;

import com.algaworks.algafood.api.v1.model.PedidoModel;
import com.algaworks.algafood.api.v1.model.PedidoResumoModel;
import com.algaworks.algafood.api.v1.model.input.PedidoInput;
import com.algaworks.algafood.core.springdoc.PageableParameter;
import com.algaworks.algafood.core.springdoc.PedidoFilterParameter;
import com.algaworks.algafood.domain.filter.PedidoFilter;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.parameters.RequestBody;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.hateoas.PagedModel;

@Tag(name = "Pedidos")
@SecurityRequirement(name = "security_auth")
public interface PedidoControllerOpenApi {

    @PageableParameter
    @PedidoFilterParameter
    @Operation(summary = "Lista os pedidos")
    PagedModel<PedidoResumoModel> pesquisar(@Parameter(hidden = true) PedidoFilter filtro,
                                            @PageableDefault @Parameter(hidden = true) Pageable pageable);

    @Operation(summary = "Busca um pedido por código", responses = {
            @ApiResponse(responseCode = "200"),
            @ApiResponse(responseCode = "404", description = "Pedido não encontrado",
                    content = @Content(schema = @Schema(ref = "Problema"))
            ),
    })
    PedidoModel buscar(@Parameter(description = "Código de um pedido",
            example = "76b94576-c101-11ec-a54b-0242ac110007", required = true) String codigoPedido);

    @Operation(summary = "Registra um pedido", responses = {@ApiResponse(responseCode = "201", description = "Pedido registrado")})
    PedidoModel adicionar(@RequestBody(description = "Representação de um novo pedido", required = true) PedidoInput pedidoInput);

}
