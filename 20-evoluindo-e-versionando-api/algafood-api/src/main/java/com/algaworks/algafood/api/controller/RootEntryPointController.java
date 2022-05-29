package com.algaworks.algafood.api.controller;

import com.algaworks.algafood.api.AlgaLinks;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.RepresentationModel;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(produces = MediaType.APPLICATION_JSON_VALUE)
public class RootEntryPointController {

    @Autowired
    private AlgaLinks algaLinks;

    @GetMapping
    public RooEntryPointModel root() {
        return new RooEntryPointModel()
                .add(algaLinks.linkToGrupos("grupos"))
                .add(algaLinks.linkToCidades("cidades"))
                .add(algaLinks.linkToEstados("estados"))
                .add(algaLinks.linkToPedidos("pedidos"))
                .add(algaLinks.linkToCozinhas("cozinhas"))
                .add(algaLinks.linkToUsuarios("usuarios"))
                .add(algaLinks.linkToPermissoes("permissoes"))
                .add(algaLinks.linkToEstatisticas("estatisticas"))
                .add(algaLinks.linkToRestaurantes("restaurantes"))
                .add(algaLinks.linkToFormasPagamento("formas-pagamento"));
    }

    private static class RooEntryPointModel extends RepresentationModel<RooEntryPointModel> {

    }


}
