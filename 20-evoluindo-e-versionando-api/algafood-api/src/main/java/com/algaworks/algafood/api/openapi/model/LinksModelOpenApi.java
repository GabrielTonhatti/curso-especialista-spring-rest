package com.algaworks.algafood.api.openapi.model;

import io.swagger.annotations.ApiModel;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@ApiModel("links")
public class LinksModelOpenApi {

    private LinkModel rel;

    @Getter
    @Setter
    @ApiModel("link")
    private class LinkModel {

        private String href;
        private boolean templated;

    }

}
