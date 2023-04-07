package com.algaworks.algafood.api.v1.model.input;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PositiveOrZero;
import java.math.BigDecimal;

@Getter
@Setter
public class ProdutoInput {

    @NotBlank
    @Schema(example = "Espetinho de Cupim")
    private String nome;

    @NotBlank
    @Schema(example = "Acompanha farinha, mandioca e vinagrete")
    private String descricao;

    @NotNull
    @PositiveOrZero
    @Schema(example = "12.50")
    private BigDecimal preco;

    @NotNull
    @Schema(example = "true")
    private Boolean ativo;

}
