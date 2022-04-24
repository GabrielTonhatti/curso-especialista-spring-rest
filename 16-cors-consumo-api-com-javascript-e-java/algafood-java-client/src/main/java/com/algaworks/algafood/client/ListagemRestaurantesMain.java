package com.algaworks.algafood.client;

import com.algaworks.algafood.client.api.RestauranteClient;
import org.springframework.web.client.RestTemplate;

public class ListagemRestaurantesMain {

    public static void main(String[] args) {
        RestTemplate restTemplate = new RestTemplate();

        RestauranteClient restauranteClient = new RestauranteClient(
                restTemplate,
                "http://api.algafood.local:8080"
        );

        restauranteClient.listar().forEach(System.out::println);
    }

}
