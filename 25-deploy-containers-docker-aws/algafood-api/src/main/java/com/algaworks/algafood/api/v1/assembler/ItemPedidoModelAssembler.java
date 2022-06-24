package com.algaworks.algafood.api.v1.assembler;

import com.algaworks.algafood.api.v1.model.ItemPedidoModel;
import com.algaworks.algafood.domain.model.ItemPedido;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class ItemPedidoModelAssembler {

    @Autowired
    private ModelMapper modelMapper;

    public ItemPedidoModel toModel(ItemPedido itemPedido) {
        return modelMapper.map(itemPedido, ItemPedidoModel.class);
    }

    public List<ItemPedidoModel> toCollectionModel(List<ItemPedido> itensPedido) {
        return itensPedido
                .stream()
                .map(itemPedido -> toModel(itemPedido))
                .collect(Collectors.toList());
    }

}
