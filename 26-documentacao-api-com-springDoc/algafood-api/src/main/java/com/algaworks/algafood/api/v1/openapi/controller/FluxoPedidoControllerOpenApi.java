package com.algaworks.algafood.api.v1.openapi.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;

@Tag(name = "Pedidos")
@SecurityRequirement(name = "security_auth")
public interface FluxoPedidoControllerOpenApi {

    @Operation(summary = "Confirmação pedido", responses = {
            @ApiResponse(responseCode = "204", description = "Pedido confirmado com sucesso"),
            @ApiResponse(responseCode = "404", description = "Pedido não encontrado",
                    content = @Content(schema = @Schema(ref = "Problema"))
            ),
    })
    ResponseEntity<Void> confirmar(@Parameter(description = "Código de um pedido",
            example = "76b94576-c101-11ec-a54b-0242ac110007", required = true) String codigoPedido);

    @Operation(summary = "Registra entrega do pedido", responses = {
            @ApiResponse(responseCode = "204", description = "Entrega de pedido registrada com sucesso"),
            @ApiResponse(responseCode = "404", description = "Pedido não encontrado",
                    content = @Content(schema = @Schema(ref = "Problema"))
            ),
    })
    ResponseEntity<Void> entregar(@Parameter(description = "Código de um pedido",
            example = "76b94576-c101-11ec-a54b-0242ac110007", required = true) String codigoPedido);

    @Operation(summary = "Cancelamento do pedido", responses = {
            @ApiResponse(responseCode = "204", description = "Pedido cancelado com sucesso"),
            @ApiResponse(responseCode = "404", description = "Pedido não encontrado",
                    content = @Content(schema = @Schema(ref = "Problema"))
            ),
    })
    ResponseEntity<Void> cancelar(@Parameter(description = "Código de um pedido",
            example = "76b94576-c101-11ec-a54b-0242ac110007", required = true) String codigoPedido);
}
