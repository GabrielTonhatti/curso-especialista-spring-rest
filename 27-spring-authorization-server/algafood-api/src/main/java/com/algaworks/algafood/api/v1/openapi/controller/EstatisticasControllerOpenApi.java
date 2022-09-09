package com.algaworks.algafood.api.v1.openapi.controller;

import com.algaworks.algafood.core.springdoc.EstatisticaFilterParameter;
import com.algaworks.algafood.domain.filter.VendaDiariaFilter;
import com.algaworks.algafood.domain.model.dto.VendaDiaria;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.ArraySchema;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;

import java.util.List;

import static com.algaworks.algafood.api.v1.controller.EstatisticasController.EstatisticasModel;

@Tag(name = "Estatísticas")
@SecurityRequirement(name = "security_auth")
public interface EstatisticasControllerOpenApi {

    @Operation(hidden = true)
    EstatisticasModel estatisticas();

    @EstatisticaFilterParameter
    @Operation(
            summary = "Consulta estatísticas de vendas diárias",
            responses = {
                    @ApiResponse(responseCode = "200", content = {
                            @Content(mediaType = "application/json",
                                    array = @ArraySchema(schema = @Schema(implementation = VendaDiaria.class))),
                            @Content(mediaType = "application/pdf", schema = @Schema(type = "string", format = "binary")),
                    }),
            }
    )
    List<VendaDiaria> consultarVendasDiarias(@Parameter(hidden = true) VendaDiariaFilter filtro,
                                             @Parameter() String timeOffset);

    @Operation(hidden = true)
    ResponseEntity<byte[]> consultarVendasDiariasPdf(VendaDiariaFilter filtro, String timeOffset);

}
