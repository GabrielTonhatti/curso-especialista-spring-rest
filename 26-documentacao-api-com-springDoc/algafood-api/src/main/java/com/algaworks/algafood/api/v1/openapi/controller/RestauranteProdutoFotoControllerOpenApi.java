package com.algaworks.algafood.api.v1.openapi.controller;

import com.algaworks.algafood.api.v1.model.FotoProdutoModel;
import com.algaworks.algafood.api.v1.model.input.FotoProdutoInput;
import org.springframework.http.ResponseEntity;
import org.springframework.web.HttpMediaTypeNotAcceptableException;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface RestauranteProdutoFotoControllerOpenApi {

    ResponseEntity<?> buscar(Long restauranteId, Long produtoId, String acceptHeader) throws HttpMediaTypeNotAcceptableException;

    FotoProdutoModel atualizarFoto(Long restauranteId, Long produtoId, FotoProdutoInput fotoProdutoInput, MultipartFile arquivo) throws IOException;

    void excluir(Long restauranteId,Long produtoId);

}
