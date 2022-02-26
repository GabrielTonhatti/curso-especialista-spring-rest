package com.algaworks.algafood;

import com.algaworks.algafood.domain.exception.CozinhaNaoEncontradoException;
import com.algaworks.algafood.domain.exception.EntidadeEmUsoException;
import com.algaworks.algafood.domain.model.Cozinha;
import com.algaworks.algafood.domain.service.CadastroCozinhaService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import javax.validation.ConstraintViolationException;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertThrows;

@SpringBootTest
@ExtendWith(SpringExtension.class)
public class CadastroCozinhaIntegrationTests {

    @Autowired
    private CadastroCozinhaService cadastroCozinha;

    @Test
    public void deveAtribuirIdQuandoCadastrarCozinhaComDadosCorretos() {
        Cozinha novaCozinha = new Cozinha();
        novaCozinha.setNome("Chinesa");

        novaCozinha = cadastroCozinha.salvar(novaCozinha);

        assertThat(novaCozinha).isNotNull();
        assertThat(novaCozinha.getId()).isNotNull();
    }

    @Test
    public void deveFalharQuandoCadastrarCozinhaSemNome() {
        Cozinha novaCozinha = new Cozinha();
        novaCozinha.setNome(null);
        ConstraintViolationException erroEsperado = assertThrows(ConstraintViolationException.class,
                () -> cadastroCozinha.salvar(novaCozinha));

        assertThat(erroEsperado).isNotNull();
    }

    @Test
    public void deveFalharQuandoExcluirCozinhaEmUso() {
        EntidadeEmUsoException erroEsperado = assertThrows(EntidadeEmUsoException.class,
                () -> cadastroCozinha.excluir(1L));
        assertThat(erroEsperado).isNotNull();
    }

    @Test
    public void deveFalharQuandoExcluirCozinhaInexistente() {
        CozinhaNaoEncontradoException erroEsperado = assertThrows(CozinhaNaoEncontradoException.class,
                () -> cadastroCozinha.excluir(10L));

        assertThat(erroEsperado).isNotNull();
    }

}
