package com.algaworks.algafood.domain.service;

import com.algaworks.algafood.domain.exception.ProdutoNaoEncontradoException;
import com.algaworks.algafood.domain.model.Produto;
import com.algaworks.algafood.domain.model.Restaurante;
import com.algaworks.algafood.domain.repository.ProdutoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CadastroProdutoService {

    @Autowired
    private ProdutoRepository produtoRepository;

    @Autowired
    private CadastroRestauranteService cadastroRestaurante;

    @Transactional
    public Produto salvar(Long restauranteId, Produto produto) {
        Restaurante restaurante = cadastroRestaurante.buscarOuFalhar(restauranteId);

        produto.setRestaurante(restaurante);

        return produtoRepository.save(produto);
    }

    public Produto buscarOuFalhar(Long produtoId, Long restauranteId) {
        return produtoRepository.findByIdAndRestauranteId(produtoId, restauranteId)
                .orElseThrow(() -> new ProdutoNaoEncontradoException(produtoId, restauranteId));
    }

}
