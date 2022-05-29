package com.algaworks.algafood.domain.exception;

public class PermissaoNaoEncontradoException extends EntidadeNaoEncontradaException {

    public PermissaoNaoEncontradoException(String mensagem) {
        super(mensagem);
    }

    public PermissaoNaoEncontradoException(Long permissaoId) {
        this(String.format("Não existe um cadastro de permissão com o código %d", permissaoId));
    }

}
