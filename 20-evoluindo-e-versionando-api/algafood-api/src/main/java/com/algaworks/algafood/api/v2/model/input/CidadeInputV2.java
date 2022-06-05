package com.algaworks.algafood.api.v2.model.input;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Getter
@Setter
public class CidadeInputV2 {

    @NotBlank
    @ApiModelProperty(example = "Uberlândia", required = true)
    private String nomeCidade;

    @NotNull
    @ApiModelProperty(example = "1", required = true)
    private Long idEstado;

}
