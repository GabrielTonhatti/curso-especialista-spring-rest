package com.algaworks.algafood.client.model.input;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class RestauranteInput {

    private String nome;
    private BigDecimal taxaFrete;
    private CozinhaIdInput cozinha;
    private EnderecoInput endereco;

}
