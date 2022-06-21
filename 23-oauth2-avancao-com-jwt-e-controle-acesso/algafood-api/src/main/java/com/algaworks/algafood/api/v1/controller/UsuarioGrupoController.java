package com.algaworks.algafood.api.v1.controller;

import com.algaworks.algafood.api.v1.AlgaLinks;
import com.algaworks.algafood.api.v1.assembler.GrupoModelAssembler;
import com.algaworks.algafood.api.v1.model.GrupoModel;
import com.algaworks.algafood.api.v1.openapi.controller.UsuarioGrupoControllerOpenApi;
import com.algaworks.algafood.core.security.AlgaSecurity;
import com.algaworks.algafood.core.security.CheckSecurity.UsuarioGruposPermissoes.PodeConsultar;
import com.algaworks.algafood.core.security.CheckSecurity.UsuarioGruposPermissoes.PodeEditar;
import com.algaworks.algafood.domain.model.Usuario;
import com.algaworks.algafood.domain.service.CadastroUsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path = "v1/usuarios/{usuarioId}/grupos", produces = MediaType.APPLICATION_JSON_VALUE)
public class UsuarioGrupoController implements UsuarioGrupoControllerOpenApi {

    @Autowired
    private CadastroUsuarioService cadastroUsuario;

    @Autowired
    private GrupoModelAssembler grupoModelAssembler;

    @Autowired
    private AlgaLinks algaLinks;

    @Autowired
    private AlgaSecurity algaSecurity;

    @Override
    @GetMapping
    @PodeConsultar
    public CollectionModel<GrupoModel> listar(@PathVariable Long usuarioId) {
        Usuario usuario = cadastroUsuario.buscarOuFalhar(usuarioId);

        CollectionModel<GrupoModel> gruposModel = grupoModelAssembler
                .toCollectionModel(usuario.getGrupos())
                .removeLinks();

        if (algaSecurity.podeEditarUsuariosGruposPermissoes()) {
            gruposModel.add(algaLinks.linkToGruposUsuarioAssocicao(usuarioId, "associar"));

            gruposModel
                    .getContent()
                    .forEach(grupoModel -> grupoModel
                            .add(algaLinks.linkToGruposUsuarioDesassocicao(usuarioId, grupoModel.getId(), "desassociar")));
        }

        return gruposModel;
    }

    @Override
    @PodeEditar
    @PutMapping("/{grupoId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public ResponseEntity<Void> associar(@PathVariable Long usuarioId, @PathVariable Long grupoId) {
        cadastroUsuario.associarGrupo(usuarioId, grupoId);

        return ResponseEntity.noContent().build();
    }

    @Override
    @PodeEditar
    @DeleteMapping("/{grupoId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public ResponseEntity<Void> desassociar(@PathVariable Long usuarioId, @PathVariable Long grupoId) {
        cadastroUsuario.desassociarGrupo(usuarioId, grupoId);

        return ResponseEntity.noContent().build();
    }

}
