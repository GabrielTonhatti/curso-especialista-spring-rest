package com.algaworks.algafood.api.controller;

import com.algaworks.algafood.api.assembler.CidadeInputDisassembler;
import com.algaworks.algafood.api.assembler.CidadeModelAssembler;
import com.algaworks.algafood.api.model.CidadeModel;
import com.algaworks.algafood.api.model.input.CidadeInput;
import com.algaworks.algafood.domain.exception.EstadoNaoEncontradoException;
import com.algaworks.algafood.domain.exception.NegocioException;
import com.algaworks.algafood.domain.model.Cidade;
import com.algaworks.algafood.domain.repository.CidadeRepository;
import com.algaworks.algafood.domain.service.CadastroCidadeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@Api(tags = "Cidades")
//@Tag(name = "Cidades")
@RequestMapping("/cidades")
public class CidadeController {

    @Autowired
    private CidadeRepository cidadeRepository;

    @Autowired
    private CadastroCidadeService cadastrarCidade;

    @Autowired
    private CidadeModelAssembler cidadeModelAssembler;

    @Autowired
    private CidadeInputDisassembler cidadeInputDesassembler;

    @GetMapping
    @ApiOperation("Lista as cidades")
    public List<CidadeModel> listar() {
        return cidadeModelAssembler.toCollectionModel(cidadeRepository.findAll());
    }

    @GetMapping("/{cidadeId}")
    @ApiOperation("Busca uma cidade por ID")
    public CidadeModel buscar(@ApiParam(value = "ID de uma cidade", example = "1") @PathVariable Long cidadeId) {
        Cidade cidade = cadastrarCidade.buscarOuFalhar(cidadeId);

        return cidadeModelAssembler.toModel(cidade);
    }

    @PostMapping
    @ApiOperation("Cadastra uma cidade")
    @ResponseStatus(HttpStatus.CREATED)
    public CidadeModel salvar(@ApiParam(name = "Corpo", value = "Representação de uma nova cidade")
                              @RequestBody @Valid CidadeInput cidadeInput) {
        try {
            Cidade cidade = cidadeInputDesassembler.toDomainObject(cidadeInput);

            cidade = cadastrarCidade.salvar(cidade);

            return cidadeModelAssembler.toModel(cidade);
        } catch (EstadoNaoEncontradoException e) {
            throw new NegocioException(e.getMessage(), e);
        }
    }

    @PutMapping("/{cidadeId}")
    @ApiOperation("Atualiza uma cidade por ID")
    public CidadeModel atualizar(@ApiParam(value = "ID de uma cidade", example = "1") @PathVariable Long cidadeId,
                                 @ApiParam(name = "Corpo", value = "Representação de uma nova cidade com os novos dados")
                                 @RequestBody @Valid CidadeInput cidadeInput) {
        try {
            Cidade cidadeAtual = cadastrarCidade.buscarOuFalhar(cidadeId);

            cidadeInputDesassembler.copyToDomainObject(cidadeInput, cidadeAtual);

            cidadeAtual = cadastrarCidade.salvar(cidadeAtual);

            return cidadeModelAssembler.toModel(cidadeAtual);
        } catch (EstadoNaoEncontradoException e) {
            throw new NegocioException(e.getMessage(), e);
        }
    }

    @DeleteMapping("/{cidadeId}")
    @ApiOperation("Exclui uma cidade por ID")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void remover(@ApiParam(value = "ID de uma cidade", example = "1") @PathVariable Long cidadeId) {
        cadastrarCidade.excluir(cidadeId);
    }

}
