package com.algaworks.algafood.api.exceptionhandler;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Builder;
import lombok.Getter;

import java.time.OffsetDateTime;
import java.util.List;

import static com.fasterxml.jackson.annotation.JsonInclude.Include;

@Getter
@Builder
@Schema(name = "Problema")
@JsonInclude(Include.NON_NULL)
public class Problem {

    @Schema(example = "400")
    private Integer status;

    @Schema(example = "2022-07-15T11:21:50.902245498Z")
    private OffsetDateTime timestamp;

    @Schema(example = "https://algafood.com.br/dados-invalidos")
    private String type;

    @Schema(example = "Dados inválidos")
    private String title;

    @Schema(example = "Um ou mais campos estão inválidos. Faça o preenchimento correto e tente novamente.")
    private String detail;

    @Schema(example = "Um ou mais campos estão inválidos. Faça o preenchimento correto e tente novamente.")
    private String userMessage;

    @Schema(description = "Lista de objetos ou campos que geraram o erro")
    private List<Objects> objects;

    @Getter
    @Builder
    @Schema(name = "ObjetoProblema")
    public static class Objects {

        @Schema(example = "preco")
        private String name;

        @Schema(example = "O preço é inválido")
        private String userMessage;

    }
}
