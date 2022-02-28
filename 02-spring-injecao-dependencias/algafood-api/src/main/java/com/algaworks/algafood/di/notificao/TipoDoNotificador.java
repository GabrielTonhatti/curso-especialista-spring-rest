package com.algaworks.algafood.di.notificao;

import org.springframework.beans.factory.annotation.Qualifier;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Qualifier
@Retention(RetentionPolicy.RUNTIME)
public @interface TipoDoNotificador {

    NivelUrgencia value();

}
