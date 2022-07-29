package com.algaworks.algafood.api.v1.model.input;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
public class SenhaInput {

    @NotBlank
    @Schema(example = "123", type = "string")
    private String senhaAtual;

    @NotBlank
    @Schema(example = "123", type = "string")
    private String novaSenha;

}
