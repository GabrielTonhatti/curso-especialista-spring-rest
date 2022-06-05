package com.algaworks.algafood.api.v2.model.input;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
@ApiModel("CozinhaInput")
public class CozinhaInputV2 {

    @NotBlank
    @ApiModelProperty(example = "Brasileira", required = true)
    private String nomeCozinha;

}
