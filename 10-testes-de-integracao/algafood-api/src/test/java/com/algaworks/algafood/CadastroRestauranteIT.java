package com.algaworks.algafood;

import com.algaworks.algafood.domain.repository.RestauranteRepository;
import com.algaworks.algafood.util.DatabaseCleaner;
import io.restassured.RestAssured;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.web.server.LocalServerPort;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@TestPropertySource("/application-test.properties")
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class CadastroRestauranteIT {

    @LocalServerPort
    private int port;

    @Autowired
    private DatabaseCleaner databaseCleaner;

    @Autowired
    private RestauranteRepository restauranteRepository;

    private int quantidadeRestaurantesCadastrados;

    @BeforeEach
    public void setUp() {
        RestAssured.enableLoggingOfRequestAndResponseIfValidationFails();
        RestAssured.port = port;
        RestAssured.basePath = "/restaurantes";

        databaseCleaner.clearTables();
//        prepararDados();
//        jsonCorretoCozinhaChinesa = ResourceUtils
//                .getContentFromResource("/json/correto/cozinha-chinesa.json");
    }

    @Test
    public void teste() {

    }

//    private void prepararDados() {
//        Restaurante restaurante1 = new Restaurante();
//        restaurante1.setNome("Thai Gourmet");
//        restaurante1.setTaxaFrete(BigDecimal.valueOf(10.00));
//        restauranteRepository.save(restaurante1);
//        restaurante1.getCozinha().setId(1L);
//
//        quantidadeRestaurantesCadastrados = (int) restauranteRepository.count();
//    }

}
