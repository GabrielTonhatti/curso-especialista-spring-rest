package com.algaworks.algafood.api.model;

import com.algaworks.algafood.domain.model.Produto;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FotoProdutoModel {

    private String nomeArquivo;
    private String descricao;
    private String contentType;
    private Long tamanho;

}
