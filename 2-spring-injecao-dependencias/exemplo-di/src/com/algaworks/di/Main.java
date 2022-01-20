package com.algaworks.di;

import com.algaworks.di.modelo.Cliente;
import com.algaworks.di.notificao.Notificador;
import com.algaworks.di.notificao.NotificadorSMS;
import com.algaworks.di.service.AtivacaoClienteService;

public class Main {

	public static void main(String[] args) {
		Cliente joao = new Cliente("João", "joão@xyz.com", "34999998888");
		Cliente maria = new Cliente("Maria", "maria@xyz.com", "1177772222");

		Notificador notificador = new NotificadorSMS();
		
		AtivacaoClienteService ativacaoCliente = new AtivacaoClienteService(notificador);
		ativacaoCliente.ativar(joao);
		ativacaoCliente.ativar(maria);
	
	}
	
}
