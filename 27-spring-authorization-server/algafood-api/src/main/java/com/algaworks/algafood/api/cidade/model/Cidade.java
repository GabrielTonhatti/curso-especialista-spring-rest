package com.algaworks.algafood.api.cidade.model;

import lombok.*;

import javax.persistence.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString(of = {"id"})
@Table(name = "CIDADE")
@EqualsAndHashCode(of = {"id"})
public class Cidade {

    @Id
    @Column(name = "ID")
    @GeneratedValue(generator = "SEQ_CIDADE", strategy = GenerationType.SEQUENCE)
    @SequenceGenerator(name = "SEQ_CIDADE", sequenceName = "SEQ_CIDADE", allocationSize = 1)
    private Long id;

    @Column(name = "NOME", length = 100, nullable = false)
    private String nome;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "FK_UF", nullable = false, foreignKey = @ForeignKey(name = "FK_UF"),
            referencedColumnName = "id")
    private Uf uf;

}
