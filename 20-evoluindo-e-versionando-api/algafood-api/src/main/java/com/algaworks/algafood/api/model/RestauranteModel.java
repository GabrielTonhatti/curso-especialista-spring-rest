package com.algaworks.algafood.api.model;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import org.springframework.hateoas.RepresentationModel;
import org.springframework.hateoas.server.core.Relation;

import java.math.BigDecimal;

@Getter
@Setter
@Relation(collectionRelation = "restaurantes")
public class RestauranteModel extends RepresentationModel<RestauranteModel> {

    @ApiModelProperty(example = "1")
//    @JsonView({RestauranteView.Resumo.class, RestauranteView.ApenasNome.class})
    private Long id;

    @ApiModelProperty(example = "Thai Gourmet")
//    @JsonView({RestauranteView.Resumo.class, RestauranteView.ApenasNome.class})
    private String nome;

//    @JsonView(RestauranteView.Resumo.class)
    @ApiModelProperty(example = "11.00")
    private BigDecimal taxaFrete;

//    @JsonView(RestauranteView.Resumo.class)
    private CozinhaModel cozinha;

    @ApiModelProperty(example = "true")
    private Boolean ativo;

    @ApiModelProperty(example = "true")
    private Boolean aberto;

    private EnderecoModel endereco;

}
