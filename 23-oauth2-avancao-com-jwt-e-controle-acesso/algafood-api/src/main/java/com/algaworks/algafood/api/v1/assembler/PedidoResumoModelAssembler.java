package com.algaworks.algafood.api.v1.assembler;

import com.algaworks.algafood.api.v1.AlgaLinks;
import com.algaworks.algafood.api.v1.controller.PedidoController;
import com.algaworks.algafood.api.v1.model.PedidoResumoModel;
import com.algaworks.algafood.core.security.AlgaSecurity;
import com.algaworks.algafood.domain.model.Pedido;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.server.mvc.RepresentationModelAssemblerSupport;
import org.springframework.stereotype.Component;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;

@Component
public class PedidoResumoModelAssembler extends RepresentationModelAssemblerSupport<Pedido, PedidoResumoModel> {

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    AlgaLinks algaLinks;

    @Autowired
    private AlgaSecurity algaSecurity;

    public PedidoResumoModelAssembler() {
        super(PedidoController.class, PedidoResumoModel.class);
    }

    @Override
    public PedidoResumoModel toModel(Pedido pedido) {
        PedidoResumoModel pedidoModel = createModelWithId(pedido.getCodigo(), pedido);
        modelMapper.map(pedido, pedidoModel);

        if (algaSecurity.podePesquisarPedidos()) {
            pedidoModel.add(algaLinks.linkToPedidos("pedidos"));
        }

        if (algaSecurity.podeConsultarRestaurantes()) {
            pedidoModel
                    .getRestaurante()
                    .add(
                            algaLinks.linkToRestaurante(pedido.getRestaurante().getId())
                    );
        }

        if (algaSecurity.podeConsultarUsuariosGruposPermissoes()) {
            pedidoModel.getCliente().add(algaLinks.linkToUsuario(pedido.getCliente().getId()));
        }

        return pedidoModel;
    }

    @Override
    public CollectionModel<PedidoResumoModel> toCollectionModel(Iterable<? extends Pedido> entities) {
        return super.toCollectionModel(entities)
                .add(linkTo(PedidoController.class)
                        .withSelfRel());
    }

}
