package com.algaworks.algafood.api.v1.model;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import org.springframework.hateoas.RepresentationModel;
import org.springframework.hateoas.server.core.Relation;

import java.math.BigDecimal;
import java.time.OffsetDateTime;

@Getter
@Setter
@Relation(collectionRelation = "pedidos")
public class PedidoResumoModel extends RepresentationModel<PedidoResumoModel> {

    @Schema(example = "76b94576-c101-11ec-a54b-0242ac110007")
    private String codigo;

    @Schema(example = "298.90")
    private BigDecimal subtotal;

    @Schema(example = "10.00")
    private BigDecimal taxaFrete;

    @Schema(example = "308.90")
    private BigDecimal valorTotal;

    @Schema(example = "CRIADO")
    private String status;

    @Schema(example = "2022-12-01T20:34:04Z")
    private OffsetDateTime dataCriacao;

    private RestauranteApenasNomeModel restaurante;

    private UsuarioModel cliente;

}
