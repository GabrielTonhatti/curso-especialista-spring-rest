package com.algaworks.algafood.client;

import com.algaworks.algafood.client.api.ClientApiException;
import com.algaworks.algafood.client.api.RestauranteClient;
import com.algaworks.algafood.client.model.RestauranteModel;
import com.algaworks.algafood.client.model.input.CidadeIdInput;
import com.algaworks.algafood.client.model.input.CozinhaIdInput;
import com.algaworks.algafood.client.model.input.EnderecoInput;
import com.algaworks.algafood.client.model.input.RestauranteInput;
import org.springframework.web.client.RestTemplate;

import java.math.BigDecimal;

public class InclusaoRestauranteMain {

    public static void main(String[] args) {
        try {
            var restTemplate = new RestTemplate();

            var restauranteClient = new RestauranteClient(
                    restTemplate,
                    "http://api.algafood.local:8080"
            );

            var cozinha = new CozinhaIdInput();
            cozinha.setId(1L);

            var cidade = new CidadeIdInput();
            cidade.setId(2L);

            var endereco = new EnderecoInput();
            endereco.setCidade(cidade);
            endereco.setCep("38500-111");
            endereco.setLogradouro("Rua Xyz");
            endereco.setNumero("300");
            endereco.setBairro("Centro");

            var restaurante = new RestauranteInput();
            restaurante.setNome("Comida Mineira");
            restaurante.setTaxaFrete(BigDecimal.valueOf(9.5));
            restaurante.setCozinha(cozinha);
            restaurante.setEndereco(endereco);

            RestauranteModel restauranteModel = restauranteClient.adicionar(restaurante);

            System.out.println(restauranteModel);
        } catch (ClientApiException e) {
            if (e.getMessage() != null) {
                System.out.println(e.getProblem().getUserMessage());

                e.getProblem().getObjects().forEach(p -> {
                    System.out.println("- " + p.getUserMessage());
                });
            } else {
                System.out.println("Erro desconhecido");
                e.printStackTrace();
            }
        }
    }

}
