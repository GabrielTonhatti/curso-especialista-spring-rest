package com.algaworks.algafood.api.v1.openapi.controller;

import com.algaworks.algafood.api.v1.model.FormaPagamentoModel;
import com.algaworks.algafood.api.v1.model.input.FormaPagamentoInput;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import org.springframework.hateoas.CollectionModel;
import org.springframework.http.ResponseEntity;
import org.springframework.web.context.request.ServletWebRequest;

@SecurityRequirement(name = "security_auth")
public interface FormaPagamentoControllerOpenApi {

    ResponseEntity<CollectionModel<FormaPagamentoModel>> listar(ServletWebRequest request);

    ResponseEntity<FormaPagamentoModel> buscar( Long formaPagamentoId, ServletWebRequest request);

    FormaPagamentoModel adicionar( FormaPagamentoInput formaPagamentoInput);

    FormaPagamentoModel atualizar( Long formaPagamentoId,FormaPagamentoInput formaPagamentoInput);

    void excluir(Long formaPagamentoId);

}
