package com.algaworks.algafood.domain.repository;

import com.algaworks.algafood.domain.model.Produto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ProdutoRepository extends JpaRepository<Produto, Long> {

    List<Produto> findAllByRestauranteId(Long restauranteId);

    Optional<Produto> findByIdAndRestauranteId(Long produtoId, Long restauranteId);

}
