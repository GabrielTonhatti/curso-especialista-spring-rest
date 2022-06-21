package com.algaworks.algafood.core.security;

import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

public @interface CheckSecurity {

    @interface Cozinha {

        @Target(METHOD)
        @Retention(RUNTIME)
        @PreAuthorize("hasAuthority('SCOPE_READ') AND isAuthenticated()")
        @interface PodeConsultar {
        }

        @Target(METHOD)
        @Retention(RUNTIME)
        @PreAuthorize("hasAuthority('SCOPE_WRITE') AND hasAuthority('EDITAR_COZINHAS')")
        @interface PodeEditar {
        }

    }

    @interface Restaurante {

        @Target(METHOD)
        @Retention(RUNTIME)
        @PreAuthorize("hasAuthority('SCOPE_READ') AND isAuthenticated()")
        @interface PodeConsultar {
        }

        @Target(METHOD)
        @Retention(RUNTIME)
        @PreAuthorize("hasAuthority('SCOPE_WRITE') AND hasAuthority('EDITAR_RESTAURANTES')")
        @interface GerenciarCadastro {
        }

        @Target(METHOD)
        @Retention(RUNTIME)
        @PreAuthorize("hasAuthority('SCOPE_WRITE') "
                + "AND (hasAuthority('EDITAR_RESTAURANTES') "
                + "OR @algaSecurity.gerenciaRestaurante(#restauranteId))"
        )
        @interface GerenciarFuncionamento {
        }

    }

    @interface Pedidos {

        @Target(METHOD)
        @Retention(RUNTIME)
        @PreAuthorize("hasAuthority('SCOPE_READ') AND isAuthenticated()")
        @PostAuthorize("hasAuthority('CONSULTAR_PEDIDOS') "
                + "OR @algaSecurity.usuarioAutenticadoIgual(returnObject.cliente.id "
                + "OR @algaSecurity.gerenciaRestaurante(returnObject.restaurante.id))"
        )
        @interface PodeBuscar {
        }

        @Target(METHOD)
        @Retention(RUNTIME)
        @PreAuthorize("hasAuthority('SCOPE_READ') AND (hasAuthority('CONSULTAR_PEDIDOS') "
                + "OR @algaSecurity.gerenciaRestaurante(#filtro.restauranteId)"
                + "OR @algaSecurity.usuarioAutenticadoIgual(#filtro.clienteId))"
        )
        @interface PodePesquisar {
        }

        @Target(METHOD)
        @Retention(RUNTIME)
        @PreAuthorize("hasAuthority('SCOPE_WRITE') AND isAuthenticated()")
        @interface PodeCriar {
        }

        @Target(METHOD)
        @Retention(RUNTIME)
        @PreAuthorize("hasAuthority('SCOPE_WRITE') AND (hasAuthority('GERENCIAR_PEDIDOS') "
                + "OR @algaSecurity.gerenciaRestauranteDoPedido(#codigoPedido))"
        )
        @interface PodeGerenciarPedidos {
        }

    }

    @interface FormasPagamento {

        @Target(METHOD)
        @Retention(RUNTIME)
        @PreAuthorize("hasAuthority('SCOPE_READ') AND isAuthenticated()")
        @interface PodeConsultar {
        }

        @Target(METHOD)
        @Retention(RUNTIME)
        @PreAuthorize("hasAuthority('SCOPE_WRITE') AND hasAuthority('EDITAR_FORMAS_PAGAMENTO')")
        @interface PodeEditar {
        }

    }

    @interface Cidades {

        @Target(METHOD)
        @Retention(RUNTIME)
        @PreAuthorize("hasAuthority('SCOPE_READ') AND isAuthenticated()")
        @interface PodeConsultar {
        }

        @Target(METHOD)
        @Retention(RUNTIME)
        @PreAuthorize("hasAuthority('SCOPE_WRITE') AND hasAuthority('EDITAR_CIDADES')")
        @interface PodeEditar {
        }

    }

    @interface Estados {

        @Target(METHOD)
        @Retention(RUNTIME)
        @PreAuthorize("hasAuthority('SCOPE_READ') AND isAuthenticated()")
        @interface PodeConsultar {
        }

        @Target(METHOD)
        @Retention(RUNTIME)
        @PreAuthorize("hasAuthority('SCOPE_WRITE') AND hasAuthority('EDITAR_ESTADOS')")
        @interface PodeEditar {
        }

    }

    @interface UsuarioGruposPermissoes {

        @Target(METHOD)
        @Retention(RUNTIME)
        @PreAuthorize("hasAuthority('SCOPE_READ') AND hasAuthority('CONSULTAR_USUARIOS_GRUPOS_PERMISSOES')")
        @interface PodeConsultar {

        }

        @Target(METHOD)
        @Retention(RUNTIME)
        @PreAuthorize("hasAuthority('SCOPE_WRITE') AND hasAuthority('EDITAR_USUARIOS_GRUPOS_PERMISSOES')")
        @interface PodeEditar {

        }

        @Target(METHOD)
        @Retention(RUNTIME)
        @PreAuthorize("hasAuthority('SCOPE_WRITE') AND @algaSecurity.usuarioAutenticadoIgual(#usuarioId)")
        @interface PodeAlterarPropriaSenha {

        }

        @Target(METHOD)
        @Retention(RUNTIME)
        @PreAuthorize("hasAuthority('SCOPE_WRITE') AND (hasAuthority('EDITAR_USUARIOS_GRUPOS_PERMISSOES') "
                + "OR @algaSecurity.usuarioAutenticadoIgual(#usuarioId))")
        @interface PodeAlterarUsuario {

        }

    }

    @interface Estatisticas {

        @Target(METHOD)
        @Retention(RUNTIME)
        @PreAuthorize("hasAuthority('SCOPE_READ') AND hasAuthority('GERAR_RELATORIOS')")
        @interface PodeConsultar {
        }

    }

}
