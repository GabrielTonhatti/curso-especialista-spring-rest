package com.algaworks.algafood.domain.exception;

public class CidadeNaoEncontradoException extends EntidadeNaoEncontradaException {

    public CidadeNaoEncontradoException(String mensagem) {
        super(mensagem);
    }

    public CidadeNaoEncontradoException(Long estadoId) {
        this(String.format("Não existe cadastro de cidade com o código %d", estadoId));
    }

}
