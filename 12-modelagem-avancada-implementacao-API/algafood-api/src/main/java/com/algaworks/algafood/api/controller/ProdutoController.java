package com.algaworks.algafood.api.controller;

import com.algaworks.algafood.api.assembler.ProdutoInputDisassembler;
import com.algaworks.algafood.api.assembler.ProdutoModelAssembler;
import com.algaworks.algafood.api.model.ProdutoModel;
import com.algaworks.algafood.api.model.input.ProdutoInput;
import com.algaworks.algafood.domain.repository.ProdutoRepository;
import com.algaworks.algafood.domain.service.CadastroProdutoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/restaurantes/{restauranteId}/produtos")
public class ProdutoController {

    @Autowired
    private ProdutoRepository produtoRepository;

    @Autowired
    private CadastroProdutoService cadastroProduto;

    @Autowired
    private ProdutoModelAssembler produtoModelAssembler;

    @Autowired
    private ProdutoInputDisassembler produtoInputDisassembler;

    @GetMapping
    public List<ProdutoModel> listar(@PathVariable Long restauranteId) {
        return produtoModelAssembler.toCollectionModel(produtoRepository.findAllByRestauranteId(restauranteId));
    }

    @GetMapping("/{produtoId}")
    public ProdutoModel buscar(@PathVariable Long restauranteId, @PathVariable Long produtoId) {
        return produtoModelAssembler.toModel(cadastroProduto.buscarOuFalhar(produtoId, restauranteId));
    }

    @PostMapping
    public ProdutoModel adicionar(@PathVariable Long restauranteId, @RequestBody @Valid ProdutoInput produtoInput) {
        return produtoModelAssembler
                .toModel(cadastroProduto
                .salvar(restauranteId, produtoInputDisassembler.toDomainObject(produtoInput)));
    }

}
