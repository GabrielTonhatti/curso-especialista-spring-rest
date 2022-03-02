package com.algaworks.algafood.domain.exception;

public class CozinhaNaoEncontradoException extends EntidadeNaoEncontradaException {

    public CozinhaNaoEncontradoException(String mensagem) {
        super(mensagem);
    }

    public CozinhaNaoEncontradoException(Long estadoId) {
        this(String.format("Não existe um cadastro de cozinha com o código %d", estadoId));
    }

}
