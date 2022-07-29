package com.algaworks.algafood.api.v1.model.input;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

@Getter
@Setter
public class UsuarioInput {

    @NotBlank
    @Schema(example = "João da Silva")
    private String nome;

    @Email
    @NotBlank
    @Schema(example = "joao.ger@algafood.com.br")
    private String email;

}
