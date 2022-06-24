package com.algaworks.algafood.api.v1.model;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import org.springframework.hateoas.RepresentationModel;
import org.springframework.hateoas.server.core.Relation;

@Setter
@Getter
@Relation(collectionRelation = "cozinhas")
public class CozinhaModel extends RepresentationModel<CozinhaModel> {

    @ApiModelProperty(example = "1")
//    @JsonView(RestauranteView.Resumo.class)
    private Long id;

//    @JsonView(RestauranteView.Resumo.class)
    @ApiModelProperty(example = "Brasileira")
    private String nome;

}
