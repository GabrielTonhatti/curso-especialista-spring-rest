package com.algaworks.algafood.api.model;

import com.algaworks.algafood.domain.model.Produto;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FotoProdutoModel {

    @ApiModelProperty(example = "b8bbd21a-4dd3-4954-835c-3493af2ba6a0_Prime-Rib.jpg")
    private String nomeArquivo;

    @ApiModelProperty(example = "Prime Rib ao ponto")
    private String descricao;

    @ApiModelProperty(example = "image/jpeg")
    private String contentType;

    @ApiModelProperty(example = "202912")
    private Long tamanho;

}
