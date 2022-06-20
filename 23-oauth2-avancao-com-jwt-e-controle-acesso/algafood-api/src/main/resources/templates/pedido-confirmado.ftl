<#-- @ftlvariable name="pedido" type="com.algaworks.algafood.domain.model.Pedido"-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
</head>
<body style="font: 14px Arial, Helvetica, sans-serif">
    <h1 style="color: red; font-size: 26px">Pedido confirmado!</h1>

    <p>${pedido.cliente.nome}, seu pedido foi confirmado pelo restaurante e já
        está sendo preparado.</p>

    <h2 style="font-size: 20px">${pedido.restaurante.nome}</h2>

    <table width="100%" border="0" cellspacing="0" cellpadding="0"
           style="max-width: 400px; color: #6F6F6F">
        <#list pedido.itens as item>
        <tr>
            <td style="padding: 10px 0">${item.quantidade}x ${item.produto.nome}</td>
            <td style="width: 30px">${item.precoTotal?string.currency}</td>
        </tr>
        </#list>
        <tr>
            <td style="padding: 10px 0">Frete</td>
            <td>${pedido.taxaFrete?string.currency}</td>
        </tr>
        <tr style="font-weight: bold">
            <td style="padding: 10px 0">Total</td>
            <td>${pedido.valorTotal?string.currency}</td>
        </tr>
    </table>

    <h2 style="font-size: 20px">Forma de pagamento</h2>
    <p style="color: #6F6F6F">${pedido.formaPagamento.descricao}</p>
</body>
</html>