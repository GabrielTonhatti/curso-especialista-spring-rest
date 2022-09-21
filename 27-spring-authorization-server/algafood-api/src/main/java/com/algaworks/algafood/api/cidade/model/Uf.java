package com.algaworks.algafood.api.cidade.model;

import lombok.*;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "UF")
@ToString(of = {"id"})
@EqualsAndHashCode(of = {"id"})
public class Uf {

    @Id
    @Column(name = "ID")
    @GeneratedValue(generator = "SEQ_UF", strategy = GenerationType.SEQUENCE)
    @SequenceGenerator(name = "SEQ_UF", sequenceName = "SEQ_UF", allocationSize = 1)
    private Long id;

    @Column(name = "NOME", length = 100, nullable = false)
    private String nome;

    @Column(name = "UF", length = 2, nullable = false)
    private String uf;

}
