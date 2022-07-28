package com.algaworks.algafood.api.v1.model;

import lombok.Getter;
import lombok.Setter;
import org.springframework.hateoas.RepresentationModel;
import org.springframework.hateoas.server.core.Relation;

@Setter
@Getter
@Relation(collectionRelation = "estados")
public class EstadoModel extends RepresentationModel<EstadoModel> {

    private Long id;
    private String nome;

}
