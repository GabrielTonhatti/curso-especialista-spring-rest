function consultarRestaurantes() {
    $.ajax({
        url: 'http://api.algafood.local:8080/cozinhas',
        type: 'GET',
        header: {
            'X-Teste': 'Abc'
        },
        success: function (response) {
            $("#conteudo")
                .text(JSON.stringify(response));
        }
    });
}

function fecharRestaurantes() {
    $.ajax({
        url: 'http://api.algafood.local:8080/restaurantes/1/fechamento',
        type: 'PUT',
        success: function (response) {
            alert("Restaurante foi fechado!");
        }
    });
}

$("#botao"
).click(consultarRestaurantes);