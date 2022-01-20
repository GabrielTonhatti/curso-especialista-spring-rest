package com.algaworks.algafood.di.notificao;

import com.algaworks.algafood.di.modelo.Cliente;
import org.springframework.stereotype.Component;

public class NotificadorEmail implements Notificador {

    @Override
    public void notificar(Cliente cliente, String mensagem) {

        System.out.printf("Notificando %s através do e-mail %s usando SMTP %s: %s\n", cliente.getNome(), cliente.getEmail(), mensagem);
    }
}
