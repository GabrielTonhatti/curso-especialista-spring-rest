package com.algaworks.algafood.di.notificao;

import com.algaworks.algafood.di.modelo.Cliente;

public interface Notificador {

    void notificar(Cliente cliente, String mensagem);

}
