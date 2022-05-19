package com.algaworks.algafood.api.assembler;

import com.algaworks.algafood.api.controller.*;
import com.algaworks.algafood.api.model.PedidoModel;
import com.algaworks.algafood.domain.model.Pedido;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.*;
import org.springframework.hateoas.server.mvc.RepresentationModelAssemblerSupport;
import org.springframework.stereotype.Component;

import static org.springframework.hateoas.TemplateVariable.*;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@Component
public class PedidoModelAssembler extends RepresentationModelAssemblerSupport<Pedido, PedidoModel> {

    @Autowired
    private ModelMapper modelMapper;

    public PedidoModelAssembler() {
        super(PedidoController.class, PedidoModel.class);
    }

    @Override
    public PedidoModel toModel(Pedido pedido) {
        PedidoModel pedidoModel = createModelWithId(pedido.getCodigo(), pedido);
        modelMapper.map(pedido, pedidoModel);

        TemplateVariables pageVariables = new TemplateVariables(
                new TemplateVariable("page", VariableType.REQUEST_PARAM),
                new TemplateVariable("size", VariableType.REQUEST_PARAM),
                new TemplateVariable("sort", VariableType.REQUEST_PARAM)
        );

        String pedidosUrl = linkTo(PedidoController.class).withRel("pedidos").toUri().toString();
        pedidoModel.add(Link.of(UriTemplate.of(pedidosUrl, pageVariables), "pedidos"));

        pedidoModel.getRestaurante()
                .add(linkTo(methodOn(RestauranteController.class)
                        .buscar(pedidoModel.getRestaurante().getId()))
                        .withSelfRel());

        pedidoModel.getCliente()
                .add(linkTo(methodOn(UsuarioController.class)
                        .buscar(pedidoModel.getCliente().getId()))
                        .withSelfRel());

        // Passamos null no segundo argumento, porque é indiferente para a
        // contrução da URL do recurso de forma de pagamento
        pedidoModel.getFormaPagamento()
                .add(linkTo(methodOn(FormaPagamentoController.class)
                        .buscar(pedidoModel.getFormaPagamento().getId(), null))
                        .withSelfRel());

        pedidoModel.getEnderecoEntrega().getCidade()
                .add(linkTo(methodOn(CidadeController.class)
                        .buscar(pedidoModel.getEnderecoEntrega().getCidade().getId()))
                        .withSelfRel());

        pedidoModel.getItens()
                .forEach(item -> item.add(linkTo(methodOn(RestauranteProdutoController.class)
                                .buscar(pedidoModel.getRestaurante().getId(), item.getProdutoId())
                        ).withRel("produto"))
                );

        return pedidoModel;
    }

    @Override
    public CollectionModel<PedidoModel> toCollectionModel(Iterable<? extends Pedido> entities) {
        return super.toCollectionModel(entities)
                .add(linkTo(PedidoController.class)
                        .withSelfRel());
    }

}
