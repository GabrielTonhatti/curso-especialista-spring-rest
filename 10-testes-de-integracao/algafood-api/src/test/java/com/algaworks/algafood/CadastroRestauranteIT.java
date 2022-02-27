package com.algaworks.algafood;

import com.algaworks.algafood.domain.model.Cozinha;
import com.algaworks.algafood.domain.model.Restaurante;
import com.algaworks.algafood.domain.repository.CozinhaRepository;
import com.algaworks.algafood.domain.repository.RestauranteRepository;
import com.algaworks.algafood.util.DatabaseCleaner;
import com.algaworks.algafood.util.ResourceUtils;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.web.server.LocalServerPort;
import org.springframework.http.HttpStatus;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.math.BigDecimal;

import static org.hamcrest.Matchers.equalTo;
import static org.hamcrest.Matchers.hasSize;
import static io.restassured.RestAssured.given;

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

    @Autowired
    private CozinhaRepository cozinhaRepository;

    private int quantidadeRestaurantesCadastrados;
    private Restaurante restauranteThaiDelivery;
    private String jsonCorretoRestauranteComidaMineira;
    public static final int ID_RESTAURANTE_INEXISTENTE = 100;

    @BeforeEach
    public void setUp() {
        RestAssured.enableLoggingOfRequestAndResponseIfValidationFails();
        RestAssured.port = port;
        RestAssured.basePath = "/restaurantes";

        databaseCleaner.clearTables();
        prepararDados();
        jsonCorretoRestauranteComidaMineira = ResourceUtils
                .getContentFromResource("/json/correto/restaurante-comida-mineira.json");
    }

    @Test
    public void deveRetornarStatus200QuandoConsultarRestaurantes() {
        given()
                .accept(ContentType.JSON)
                .when()
                .get()
                .then()
                .statusCode(HttpStatus.OK.value());
    }

    @Test
    public void deveRetornarQuantidadeCorretaDeRestaurantesQuandoConsultarRestaurantes() {
        given()
                .accept(ContentType.JSON)
                .when()
                .get()
                .then()
                .body("", hasSize(quantidadeRestaurantesCadastrados));
    }

    @Test
    public void deveRetornarStatus201QuandoCadastrarRestaurante() {
        given()
                .body(jsonCorretoRestauranteComidaMineira)
                .accept(ContentType.JSON)
                .contentType(ContentType.JSON)
                .when()
                .post()
                .then()
                .statusCode(HttpStatus.CREATED.value());
    }

    @Test
    public void deveRetornarRespostaEStatusCorretosQuandoConsultarRestauranteExistente() {
        given()
                .pathParams("restauranteId", restauranteThaiDelivery.getId())
                .accept(ContentType.JSON)
                .when()
                .get("/{restauranteId}")
                .then()
                .statusCode(HttpStatus.OK.value())
                .body("nome", equalTo(restauranteThaiDelivery.getNome()));
    }

    @Test
    public void deveRetornarRespostaEStatus404QuandoConsultarRestauranteInexistente(){
        given()
                .pathParams("restauranteId", ID_RESTAURANTE_INEXISTENTE)
                .accept(ContentType.JSON)
                .when()
                .get("/{restauranteId}")
                .then()
                .statusCode(HttpStatus.NOT_FOUND.value());
    }

    private void prepararDados() {
        Cozinha cozinha1 = new Cozinha();
        cozinha1.setNome("Tailandesa");
        cozinhaRepository.save(cozinha1);

        Restaurante restaurante1 = new Restaurante();
        restaurante1.setNome("Thai Gourmet");
        restaurante1.setTaxaFrete(BigDecimal.valueOf(10.00));
        restaurante1.setCozinha(new Cozinha());
        restaurante1.getCozinha().setId(1L);
        restauranteRepository.save(restaurante1);

        Cozinha cozinha2 = new Cozinha();
        cozinha2.setNome("Americana");
        cozinhaRepository.save(cozinha2);

        restauranteThaiDelivery = new Restaurante();
        restauranteThaiDelivery.setNome("Thai Delivery");
        restauranteThaiDelivery.setTaxaFrete(BigDecimal.valueOf(10.00));
        restauranteThaiDelivery.setCozinha(new Cozinha());
        restauranteThaiDelivery.getCozinha().setId(2L);
        restauranteRepository.save(restauranteThaiDelivery);

        quantidadeRestaurantesCadastrados = (int) restauranteRepository.count();
    }

}
