package com.algaworks.algafood.domain.repository;

import com.algaworks.algafood.domain.model.Pedido;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface PedidoRepository extends CustomJpaRepository<Pedido, Long>, JpaSpecificationExecutor<Pedido> {

    @Query("FROM Pedido  p JOIN FETCH p.cliente JOIN FETCH p.restaurante r JOIN FETCH r.cozinha")
    List<Pedido> findAll();

    Optional<Pedido> findByCodigo(String codigo);

}
