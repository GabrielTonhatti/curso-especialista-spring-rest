package com.algaworks.algafood.domain.exception;

public class FormaPagamentoNaoEncontradoException extends EntidadeNaoEncontradaException {

    public FormaPagamentoNaoEncontradoException(String mensagem) {
        super(mensagem);
    }

    public FormaPagamentoNaoEncontradoException(Long estadoId) {
        this(String.format("Não existe um cadastro de forma de pagamento com o código %d", estadoId));
    }

}
