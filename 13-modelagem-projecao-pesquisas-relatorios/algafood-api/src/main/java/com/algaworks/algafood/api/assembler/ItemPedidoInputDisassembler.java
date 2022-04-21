package com.algaworks.algafood.api.assembler;

import com.algaworks.algafood.api.model.input.ItemPedidoInput;
import com.algaworks.algafood.domain.model.ItemPedido;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ItemPedidoInputDisassembler {

    @Autowired
    private ModelMapper modelMapper;

    public ItemPedido toDomainObject(ItemPedidoInput itemPedidoInput) {
        return modelMapper.map(itemPedidoInput, ItemPedido.class);
    }

    public void copyToDomainObject(ItemPedidoInput itemPedidoInput, ItemPedido itemPedido) {
        modelMapper.map(itemPedidoInput, itemPedido);
    }

}
