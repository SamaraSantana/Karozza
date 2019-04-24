<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/jpg" href="resources/icon.png" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="Informações para concluir a reserva." />
<title>Informações para concluir a reserva.</title>
 <link href="resources/folha.css" rel="stylesheet">
<body>
			
	<div id="impressao">

<div class="local2">
<div class="seila"><img class="img"
					src="resources/menor_logo2.png" width="200px"></div></div>	
					
					<div class="local2">
				<div class="qr">
				<img
			src="http://chart.apis.google.com/chart?cht=qr&chl=${resumo.id}&chs=120x120"
			alt="QR code" /></div>
				</div>	
					
	<div class="local">
			<h3>Prezado(a) : ${resumoCliente.nome}</h3>
				
				<hr>
				<p>Reserva efetuada com sucesso!<br>
				Por favor, anote o número da sua rserva?
				<h1>${resumo.id}</h1>
				</div>	
		<hr >

<div id="dados">
		<h3>Dados Pessoais</h3>
		<div class="seila">CPF: ${resumoCliente.cpf}</div>
		<div class="seila">Nome: ${resumoCliente.nome}</div>
		<div class="seila"> Email: ${resumoCliente.email}</div>
		<div class="seila">Telefone: ${resumoCliente.telefone}</div>
			
	</div>

			<div class="item">
		<h3>Dados da retirada</h3>
				<div class="seila">Local: ${resumo.local_Reserva}</div>
				<div class="seila">Data:${resumo.data_Retirada}</div>
				<div class="seila">Hora: ${resumo.hora_Retirada}</div>
</div>

<div class="item">
	</div>	
	
			<div class="item">
		     <h3>Dados da Devolução</h3>
				<div class="seila">Local: ${resumo.local_Reserva}</div>
				<div class="seila">Data: ${resumo.data_Prevista}</div>
				<div class="seila">Hora: ${resumo.hora_Prevista}</div>

</div>
<hr style="margin-top:150px;">

<div id="reserva">

<div class="item">
	<h3><div class="seila">${resumoGrupo.nome} - ${resumoGrupo.descricao}</div></h3>
	<div class="seila"><img class="img"
					src="data:image/jpeg;base64, ${resumoGrupo.foto64 }"></div>
</div>

		<div class="item">
			<h3><div class="seila">Proteção: ${resumoProtecao.descricao}</div></h3>
			<div class="seila">Descrição: ${resumoProtecao.descricao}</div>
			<div class="seila">Preço: R$ ${resumoProtecao.preco}</div>		
			<div class="seila">Preço Total: R$ ${resumoProtecao.preco * dias}</div>
		</div>

<div class="item">
			<c:forEach items="${resumoOpcionais}" var="opcionais">
			<h3><div class="seila">Opcional: ${opcionais.nome}</div></h3>
			<div class="seila">Descrição: ${opcionais.nome}</div>
			<div class="seila">Preço: R$ ${opcionais.preco}</div>	
			<div class="seila">Preço Total: R$ ${opcionais.preco * dias}</div>
			</c:forEach>
		</div>
		
		<div class="grupo">
			<div class="seila">Grupo: ${resumoGrupo.nome}</div>
			<div class="seila">Preço: R$ ${resumoGrupo.preco}</div>
			<div class="seila">Preço Total: ${resumoGrupo.preco * dias}</div>
		</div>
		
		<div class="grupo">
		<div class="seila">Dias (Locação): ${dias}</div>
		</div>

	<div id="total">	
			<h3>Valor Total</h3>
			<h2><div class="seila">R$ ${resumoGrupo.preco * dias + resumoProtecao.preco * dias + somaOpcionais * dias}</div></h2>
	</div>
		
	</div>
	</div>
	
	<div id="bts">
			
				<a href="teste"><input  type="button"  value="Inicio" class="bt" style="margin-left: 300px;"/></a>
	
	<button class="bt" id="btn" style="margin-left: 150px;" >Clique para imprimir</button>
</div>

	<script type="text/javascript">
		document.getElementById('btn').onclick = function() {
			var conteudo = document.getElementById('impressao').innerHTML, tela_impressao = window
					.open('about:blank');
			
		

			tela_impressao.document.write(conteudo);
			tela_impressao.window.print();
			tela_impressao.window.close();
			
		};
	</script>
	
	

</body>
</html>