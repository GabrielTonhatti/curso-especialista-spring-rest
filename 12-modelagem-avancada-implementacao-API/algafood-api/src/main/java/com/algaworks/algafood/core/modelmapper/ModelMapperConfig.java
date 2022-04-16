package com.algaworks.algafood.core.modelmapper;

import com.algaworks.algafood.api.model.EnderecoModel;
import com.algaworks.algafood.api.model.RestauranteModel;
import com.algaworks.algafood.domain.model.Endereco;
import com.algaworks.algafood.domain.model.Restaurante;
import org.modelmapper.ModelMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ModelMapperConfig {

    @Bean
    public ModelMapper modelMapper() {
        var modelMapper = new ModelMapper();

//        modelMapper
//                .createTypeMap(Restaurante.class, RestauranteModel.class)
//                .addMapping(Restaurante::getTaxaFrete, RestauranteModel::setPrecoFrete);

        var enderecoToEnderecoModelTypeMap = modelMapper
                .createTypeMap(Endereco.class, EnderecoModel.class);

        enderecoToEnderecoModelTypeMap
                .<String>addMapping(
                        enderecoSrc -> enderecoSrc.getCidade().getEstado().getNome(),
                        (enderecoModelDest, value) -> enderecoModelDest.getCidade().setEstado(value)
                );

        return modelMapper;
    }

}
