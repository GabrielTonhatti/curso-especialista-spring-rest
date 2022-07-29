package com.algaworks.algafood.domain.filter;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.OffsetDateTime;

import static org.springframework.format.annotation.DateTimeFormat.ISO;

@Getter
@Setter
public class PedidoFilter {

    @Schema(example = "1")
    private Long clienteId;

    @Schema(example = "2")
    private Long restauranteId;

    @DateTimeFormat(iso = ISO.DATE_TIME)
    @Schema(example = "2022-10-30T10:00:00Z")
    private OffsetDateTime dataCriacaoInicio;

    @DateTimeFormat(iso = ISO.DATE_TIME)
    @Schema(example = "2022-10-30T10:00:00Z")
    private OffsetDateTime dataCriacaoFim;

}
