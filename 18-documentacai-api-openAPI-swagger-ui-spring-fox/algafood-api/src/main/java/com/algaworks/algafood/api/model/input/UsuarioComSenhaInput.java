package com.algaworks.algafood.api.model.input;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

@Getter
@Setter
public class UsuarioComSenhaInput extends UsuarioInput {

    @NotBlank
    @ApiModelProperty(example = "123", required = true)
    private String senha;

}
