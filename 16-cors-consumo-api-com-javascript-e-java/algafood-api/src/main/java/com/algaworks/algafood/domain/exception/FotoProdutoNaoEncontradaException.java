package com.algaworks.algafood.domain.exception;

public class FotoProdutoNaoEncontradaException extends EntidadeNaoEncontradaException {

    public FotoProdutoNaoEncontradaException(String mensagem) {
        super(mensagem);
    }

    public FotoProdutoNaoEncontradaException(Long restauranteId, Long produtoId) {
        this(String.format("Não existe um cadastro de foto do produto com o código %d para o restaurante de código %d",
                produtoId, restauranteId));
    }

}
