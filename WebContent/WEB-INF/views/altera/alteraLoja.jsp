<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" type="image/jpg" href="resources/icon.png" />
<title>Funcionário</title>
</head>
<script type="text/javascript">
	function limpa_formulário_cep() {
		//Limpa valores do formulário de cep.
		document.getElementById('rua').value = ("");
		document.getElementById('bairro').value = ("");
		document.getElementById('cidade').value = ("");
		document.getElementById('uf').value = ("");

	}

	function meu_callback(conteudo) {
		if (!("erro" in conteudo)) {
			//Atualiza os campos com os valores.
			document.getElementById('rua').value = (conteudo.logradouro);
			document.getElementById('bairro').value = (conteudo.bairro);
			document.getElementById('cidade').value = (conteudo.localidade);
			document.getElementById('uf').value = (conteudo.uf);

		} //end if.
		else {
			//CEP não Encontrado.
			limpa_formulário_cep();
			alert("CEP não encontrado.");
		}
	}

	function pesquisacep(valor) {

		//Nova variável "cep" somente com dígitos.
		var cep = valor.replace(/\D/g, '');

		//Verifica se campo cep possui valor informado.
		if (cep != "") {

			//Expressão regular para validar o CEP.
			var validacep = /^[0-9]{8}$/;

			//Valida o formato do CEP.
			if (validacep.test(cep)) {

				//Preenche os campos com "..." enquanto consulta webservice.
				document.getElementById('rua').value = "...";
				document.getElementById('bairro').value = "...";
				document.getElementById('cidade').value = "...";
				document.getElementById('uf').value = "...";

				//Cria um elemento javascript.
				var script = document.createElement('script');

				//Sincroniza com o callback.
				script.src = '//viacep.com.br/ws/' + cep
						+ '/json/?callback=meu_callback';

				//Insere script no documento e carrega o conteúdo.
				document.body.appendChild(script);

			} //end if.
			else {
				//cep é inválido.
				limpa_formulário_cep();
				alert("Formato de CEP inválido.");
			}
		} //end if.
		else {
			//cep sem valor, limpa formulário.
			limpa_formulário_cep();
		}
	};
</script>

<body>

	<div id="wrapper">
		<c:import url="../cabecalho_funcionario.jsp"></c:import>


		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Loja</h1>
						<ol class="breadcrumb">
							<li><i class="fa fa-dashboard"></i> <a href="adm">Inicial</a>
							</li>
							<li class="active"><i class="fa fa-bar-chart-o"></i> Loja
						</ol>
					</div>
				</div>

				<form name="form1" action="alterarLoja" method="get">

					<input type="hidden" name="id" id="id" value="${loja.id}">

					<div class="col-lg-6">
						<h4>

							<label for="cnpj">Cnpj:</label>
						</h4>

						<input type="text" name="cnpj" id="cnpj" class="form-control"
							value="${loja.cnpj}">
					</div>

					<div class="col-lg-6">
						<h4>

							<label for="telefone">Telefone:</label>
						</h4>

						<input type="text" name="telefone" id="telefone"
							class="form-control" value="${loja.telefone}">
					</div>

					<div class="col-lg-6">
						<h4>
							<label for="cep">Cep:</label>
						</h4>

						<input type="text" name="cep" id="cep" class="form-control"
							value="${loja.cep}" size="10" maxlength="9"
							onblur="pesquisacep(this.value);" />
					</div>

					<div class="col-lg-6">
						<h4>
							<label for="rua">Rua:</label>
						</h4>

						<input type="text" name="rua" id="rua" class="form-control"
							value="${loja.rua}" />
					</div>

					<div class="col-lg-6">
						<h4>
							<label for="numRua">Nº:</label>
						</h4>

						<input type="text" name="numRua" id="numRua" class="form-control"
							value="${loja.numRua}" />
					</div>

					<div class="col-lg-6">
						<h4>
							<label for="complemento">Complemento:</label>
						</h4>

						<input type="text" name="complemento" id="complemento"
							class="form-control" value="${loja.complemento}" />
					</div>

					<div class="col-lg-6">
						<h4>
							<label for="bairro">Bairro:</label>
						</h4>

						<input type="text" name="bairro" id="bairro" class="form-control"
							value="${loja.bairro}" />
					</div>

					<div class="col-lg-6">
						<h4>
							<label for="cidade">Cidade:</label>
						</h4>

						<input type="text" name="cidade" id="cidade" class="form-control"
							value="${loja.cidade}" />
					</div>

					<div class="col-lg-6">
						<h4>
							<label for="uf">Estado:</label>
						</h4>

						<input type="text" name="uf" id="uf" class="form-control"
							value="${loja.uf}" size="2" />
					</div>

					<div class="col-lg-6">
						<h4>
							<label for="tipo">Tipo:</label>
						</h4>

						<select class="form-control" name="tipo">
							<c:if test="${loja.tipo != Matriz }">
								<option value="${loja.tipo}">${loja.tipo}</option>
							</c:if>
						</select>
					</div>

					<div class="form-group">
						<div class="col-lg-offset-3 col-lg-2">
							<button type="submit" class="btn btn-primary" value="Enviar">Enviar</button>
							<div id="resposta"></div>
						</div>
					</div>

				</form>
			</div>
			</section>
		</div>
	</div>
	
	<!-- jQuery -->
    <script src="resources/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resources/js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="resources/js/plugins/morris/raphael.min.js"></script>
    <script src="resources/js/plugins/morris/morris.min.js"></script>
    <script src="resources/js/plugins/morris/morris-data.js"></script>
	
</body>
</html>