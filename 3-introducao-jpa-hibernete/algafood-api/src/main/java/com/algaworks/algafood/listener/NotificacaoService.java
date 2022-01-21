package com.algaworks.algafood.listener;

import com.algaworks.algafood.di.notificao.NivelUrgencia;
import com.algaworks.algafood.di.notificao.Notificador;
import com.algaworks.algafood.di.notificao.TipoDoNotificador;
import com.algaworks.algafood.di.service.ClienteAtivadoEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

@Component
public class NotificacaoService {

    @Autowired
    @TipoDoNotificador(NivelUrgencia.SEM_URGENCIA)
    private Notificador notificador;

    @EventListener
    public void clienteAtivadoListener(ClienteAtivadoEvent event) {
        notificador.notificar(event.getCliente(), "Seu cadastro no sistema está ativo.");
    }

}
