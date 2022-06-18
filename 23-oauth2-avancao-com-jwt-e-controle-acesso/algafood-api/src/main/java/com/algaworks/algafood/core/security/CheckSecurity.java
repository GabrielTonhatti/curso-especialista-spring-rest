package com.algaworks.algafood.core.security;

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
        @interface PodeEditar {
        }

    }

}
