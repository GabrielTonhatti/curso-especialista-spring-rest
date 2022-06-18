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
        @PreAuthorize("isAuthenticated()")
        @interface PodeConsultar {
        }

        @Target(METHOD)
        @Retention(RUNTIME)
        @PreAuthorize("hasAnyAuthority('EDITAR_COZINHAS')")
        @interface PodeEditar {
        }

    }

}
