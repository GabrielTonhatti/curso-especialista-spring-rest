package com.algaworks.algafood.api.v1.model;

import lombok.Getter;
import lombok.Setter;
import org.springframework.hateoas.RepresentationModel;
import org.springframework.hateoas.server.core.Relation;

import java.math.BigDecimal;
import java.time.OffsetDateTime;
import java.util.List;

@Getter
@Setter
@Relation(collectionRelation = "pedidos")
public class PedidoModel extends RepresentationModel<PedidoModel> {

    private String codigo;

    private BigDecimal subtotal;

    private BigDecimal taxaFrete;

    private BigDecimal valorTotal;

    private EnderecoModel enderecoEntrega;

    private String status;

    private OffsetDateTime dataCriacao;

    private OffsetDateTime dataConfirmacao;

    private OffsetDateTime dataCancelamento;

    private OffsetDateTime dataEntrega;

    private FormaPagamentoModel formaPagamento;

    private RestauranteApenasNomeModel restaurante;

    private UsuarioModel cliente;

    private List<ItemPedidoModel> itens;

}
