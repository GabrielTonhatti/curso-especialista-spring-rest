package com.algaworks.algafood.api.v1.model;

import lombok.Getter;
import lombok.Setter;
import org.springframework.hateoas.RepresentationModel;
import org.springframework.hateoas.server.core.Relation;

@Getter
@Setter
@Relation(collectionRelation = "fotos")
public class FotoProdutoModel extends RepresentationModel<FotoProdutoModel> {

    private String nomeArquivo;

    private String descricao;

    private String contentType;

    private Long tamanho;

}
