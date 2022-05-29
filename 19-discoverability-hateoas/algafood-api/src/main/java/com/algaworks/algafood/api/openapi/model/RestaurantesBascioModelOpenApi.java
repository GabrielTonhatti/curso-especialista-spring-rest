package com.algaworks.algafood.api.openapi.model;

import com.algaworks.algafood.api.model.RestauranteModel;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import org.springframework.hateoas.Links;

import java.util.List;

@Data
@ApiModel("RestaurantesBascio   Model")
public class RestaurantesBascioModelOpenApi {

    private RestaurantesEmbeddedModelOpenApi _embedded;
    private Links _links;

    @Data
    @ApiModel("RestaurantesEmbeddedModel")
    public class RestaurantesEmbeddedModelOpenApi {

        private List<RestauranteModel> restaurantes;

    }
}
