package com.algaworks.di.notificao;

import com.algaworks.di.modelo.Cliente;

public interface Notificador {
	
	void notificar(Cliente cliente, String mensagem);

}
