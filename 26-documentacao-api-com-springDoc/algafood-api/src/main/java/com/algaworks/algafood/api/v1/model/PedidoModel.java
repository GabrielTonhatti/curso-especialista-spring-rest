package com.algaworks.algafood.api.v1.model;

import io.swagger.v3.oas.annotations.media.Schema;
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

    @Schema(example = "76b94576-c101-11ec-a54b-0242ac110007")
    private String codigo;

    @Schema(example = "298.90")
    private BigDecimal subtotal;

    @Schema(example = "10.00")
    private BigDecimal taxaFrete;

    @Schema(example = "308.90")
    private BigDecimal valorTotal;

    private EnderecoModel enderecoEntrega;

    @Schema(example = "CRIADO")
    private String status;

    @Schema(example = "2022-12-01T20:34:04Z")
    private OffsetDateTime dataCriacao;

    @Schema(example = "2022-12-01T20:34:04Z")
    private OffsetDateTime dataConfirmacao;

    @Schema(example = "2022-12-01T20:34:04Z")
    private OffsetDateTime dataCancelamento;

    @Schema(example = "2022-12-01T20:34:04Z")
    private OffsetDateTime dataEntrega;

    private FormaPagamentoModel formaPagamento;

    private RestauranteApenasNomeModel restaurante;

    private UsuarioModel cliente;

    private List<ItemPedidoModel> itens;

}
