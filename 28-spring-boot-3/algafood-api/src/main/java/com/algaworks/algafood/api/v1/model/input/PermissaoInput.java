package com.algaworks.algafood.api.v1.model.input;

import lombok.Getter;
import lombok.Setter;

import jakarta.validation.constraints.NotBlank;

@Getter
@Setter
public class PermissaoInput {

    @NotBlank
    private String nome;

    @NotBlank
    private String descricao;
}
