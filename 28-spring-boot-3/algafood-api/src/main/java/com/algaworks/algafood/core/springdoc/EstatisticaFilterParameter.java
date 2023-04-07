package com.algaworks.algafood.core.springdoc;

import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.enums.ParameterIn;
import io.swagger.v3.oas.annotations.media.Schema;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Parameter(
        in = ParameterIn.QUERY,
        name = "restauranteId",
        description = "ID do restauranteId para filtro da pesquisa",
        example = "1",
        schema = @Schema(type = "integer")
)
@Parameter(
        in = ParameterIn.QUERY,
        name = "dataCriacaoInicio",
        description = "Data/hora de criação inicial da criação do pedido",
        example = "2019-11-02T00:00:00Z"
)
@Parameter(
        in = ParameterIn.QUERY,
        name = "dataCriacaoFim",
        description = "Data/hora de criação final da criação do pedido",
        example = "2019-11-05T23:59:59Z"
)
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.METHOD, ElementType.ANNOTATION_TYPE})
public @interface EstatisticaFilterParameter {
}
