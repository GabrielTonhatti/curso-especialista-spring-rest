package com.algaworks.algafood.domain.repository;

import com.algaworks.algafood.domain.model.FormaPagamento;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.time.OffsetDateTime;

@Repository
public interface FormaPagamentoRepository  extends JpaRepository<FormaPagamento, Long> {

    @Query("SELECT MAX(dataAtualizacao) FROM FormaPagamento")
    OffsetDateTime getDataUltimaAtualizacao();

}
