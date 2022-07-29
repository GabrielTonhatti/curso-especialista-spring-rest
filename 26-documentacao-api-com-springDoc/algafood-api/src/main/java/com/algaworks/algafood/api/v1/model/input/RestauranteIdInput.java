package com.algaworks.algafood.api.v1.model.input;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotNull;

@Getter
@Setter
public class RestauranteIdInput {

    @NotNull
    @Schema(example = "1", required = true)
    private Long id;

}
