package com.algaworks.algafood.api.v1.model;

import lombok.Getter;
import lombok.Setter;
import org.springframework.hateoas.RepresentationModel;

import java.math.BigDecimal;

@Getter
@Setter
public class ItemPedidoModel extends RepresentationModel<ItemPedidoModel> {

    private Long produtoId;

    private String produtoNome;

    private BigDecimal precoUnitario;

    private BigDecimal precoTotal;

    private Integer quantidade;

    private String observacao;

}
