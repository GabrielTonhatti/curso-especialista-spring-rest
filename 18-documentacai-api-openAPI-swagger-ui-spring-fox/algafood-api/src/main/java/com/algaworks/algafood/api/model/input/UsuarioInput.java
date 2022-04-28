package com.algaworks.algafood.api.model.input;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

@Getter
@Setter
public class UsuarioInput {

    @NotBlank
    @ApiModelProperty(example = "João da Silva", required = true)
    private String nome;

    @Email
    @NotBlank
    @ApiModelProperty(example = "joao.ger@algafood.com", required = true)
    private String email;

}
