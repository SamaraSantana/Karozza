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
<script language="JavaScript" type="text/javascript"
	src="resources/MascaraValidacao.js"></script>
<link rel="icon" type="image/jpg" href="resources/icon.png" />


<!-- Bootstrap core CSS -->
<link href="resources/bootstrap-3.3.6/css/bootstrap.min.css"
	rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link
	href="resources/bootstrap-3.3.6/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="navbar.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="resources/bootstrap-3.3.6/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<link rel="stylesheet"
	href="resources/validacao-de-formularios-bootstrap-com-form-validation/css/bootstrap.css" />
<link rel="stylesheet"
	href="../validacao-de-formularios-bootstrap-com-form-validation/css/formValidation.css" />
</head>
<script type="text/javascript"
	src="resources/validacao-de-formularios-bootstrap-com-form-validation/js/jquery.min.js"></script>
<script type="text/javascript"
	src="resources/validacao-de-formularios-bootstrap-com-form-validation/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="resources/validacao-de-formularios-bootstrap-com-form-validation/js/formValidation.js"></script>
<script type="text/javascript"
	src="resources/validacao-de-formularios-bootstrap-com-form-validation/js/bootstrap.js"></script>



<title>Cliente</title>

<script>
	stop = '';
	function mascara(campo) {
		campo.value = campo.value.replace(/[^\d]/g, '').replace(/^(\d\d)(\d)/,
				'($1) $2').replace(/(\d{4})(\d)/, '$1-$2');
		if (campo.value.length > 14)
			campo.value = stop;
		else
			stop = campo.value;
	}
</script>

</head>

<script language='JavaScript'>
	function SomenteNumero(e) {
		var tecla = (window.event) ? event.keyCode : e.which;
		if ((tecla > 47 && tecla < 58))
			return true;
		else {
			if (tecla == 8 || tecla == 0)
				return true;
			else
				return false;
		}
	}
</script>

<script type="text/javascript">
	function Apenas_Numeros(caracter) {
		var nTecla = 0;
		if (document.all) {
			nTecla = caracter.keyCode;
		} else {
			nTecla = caracter.which;
		}
		if ((nTecla > 47 && nTecla < 58) || nTecla == 8 || nTecla == 127
				|| nTecla == 0 || nTecla == 9 // 0 == Tab
				|| nTecla == 13) { // 13 == Enter
			return true;
		} else {
			return false;
		}
	}
</script>


<script>
	function validaCPF(cpf) {
		erro = new String;

		if (cpf.value.length == 11) {
			cpf.value = cpf.value.replace('.', '');
			cpf.value = cpf.value.replace('.', '');
			cpf.value = cpf.value.replace('-', '');

			var nonNumbers = /\D/;

			if (nonNumbers.test(cpf.value)) {
				erro = "A verificacao de CPF suporta apenas números!";
			} else {
				if (cpf.value == "00000000000" || cpf.value == "11111111111"
						|| cpf.value == "22222222222"
						|| cpf.value == "33333333333"
						|| cpf.value == "44444444444"
						|| cpf.value == "55555555555"
						|| cpf.value == "66666666666"
						|| cpf.value == "77777777777"
						|| cpf.value == "88888888888"
						|| cpf.value == "99999999999") {

					erro = "Número de CPF inválido!"
				}

				var a = [];
				var b = new Number;
				var c = 11;

				for (i = 0; i < 11; i++) {
					a[i] = cpf.value.charAt(i);
					if (i < 9)
						b += (a[i] * --c);
				}

				if ((x = b % 11) < 2) {
					a[9] = 0
				} else {
					a[9] = 11 - x
				}
				b = 0;
				c = 11;

				for (y = 0; y < 10; y++)
					b += (a[y] * c--);

				if ((x = b % 11) < 2) {
					a[10] = 0;
				} else {
					a[10] = 11 - x;
				}

				if ((cpf.value.charAt(9) != a[9])
						|| (cpf.value.charAt(10) != a[10])) {
					erro = "Número de CPF inválido.";

				}
			}
		} else {
			if (cpf.value.length == 0)
				return false
			else
				erro = "Número de CPF inválido.";
		}
		if (erro.length > 0) {
			alert(erro);
			cpf.focus();
			return false;
		}
		return true;
	}

	//envento onkeyup
	function maskCPF(CPF) {
		var evt = window.event;
		kcode = evt.keyCode;
		if (kcode == 8)
			return;
		if (CPF.value.length == 3) {
			CPF.value = CPF.value + '.';
		}
		if (CPF.value.length == 7) {
			CPF.value = CPF.value + '.';
		}
		if (CPF.value.length == 11) {
			CPF.value = CPF.value + '-';
		}
	}

	// evento onBlur
	function formataCPF(CPF) {
		with (CPF) {
			value = value.substr(0, 3) + '.' + value.substr(3, 3) + '.'
					+ value.substr(6, 3) + '-' + value.substr(9, 2);
		}
	}
	function retiraFormatacao(CPF) {
		with (CPF) {
			value = value.replace(".", "");
			value = value.replace(".", "");
			value = value.replace("-", "");
			value = value.replace("/", "");
		}
	}
</script>
</head>

<body>

	<div id="wrapper">
		<c:import url="../cabecalho_funcionario.jsp"></c:import>


		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Cliente</h1>
						<ol class="breadcrumb">
							<li><i class="fa fa-dashboard"></i> <a href="adm">Inicial</a>
							</li>
							<li class="active"><i class="fa fa-bar-chart-o"></i> Cliente
							
						</ol>
					</div>
				</div>
				

					<form name="form1" class="form-horizontal" action="alterarCliente" method="get">

						<input type="hidden" name="id" value="${cliente.id}">
						<div class="form-group">
						<label class="col-lg-3 control-label">Nome</label>
						<div class="col-lg-5">
							<input type="text" name="nome" id="nome" class="form-control"
								value="${cliente.nome}">
						</div>
						</div>
						
						<div class="form-group">
						<label class="col-lg-3 control-label">Email</label>
						<div class="col-lg-5">
							<input type="text" name="email" id="email"
								pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
								class="form-control" value="${cliente.email}">
						</div>
						</div>
						<div class="form-group">
						<label class="col-lg-3 control-label">Cpf</label>
						<div class="col-lg-5">
							<input type="text" name="cpf" id="cpf" class="form-control"
								maxlength="11" onKeyPress="return Apenas_Numeros(event);"
								onBlur="validaCPF(this);" value="${cliente.cpf}">
						</div>
						</div>

						<div class="form-group">
						<label class="col-lg-3 control-label">Rg</label>
						<div class="col-lg-5">
							<input type="text" name="rg" id="rg" maxlength="12"
								required="required" class="form-control"
								onKeyPress="MascaraRG(form1.rg);"
								onkeypress='return SomenteNumero(event)' value="${cliente.rg}">
						</div>
</div>
						
						<div class="form-group">
						<label class="col-lg-3 control-label">Data de nascimento</label>
						<div class="col-lg-5">
							<input type="date" class="form-control" name="dataNascimento"
								id="dataNascimento" required="required" maxlength="10"
								name="date" pattern="[0-9]{2}\/[0-9]{2}\/[0-9]{4}$"
								min="01-01-2012" max="18-02-2016"
								value="${cliente.dataNascimento}" />
						</div>
</div>
						<c:if test="${cliente.sexo == 'Masculino'}">
							<div class="form-group">
						<label class="col-lg-3 control-label">Sexo</label>
						<div class="col-lg-5">
									 <input type="radio" name="sexo"
										value="Masculino" id="tipo" required checked="checked">
										Masculino
									<br />
								
								
									<input type="radio" name="sexo"
										value="Feminino" id="tipo" required> Feminino
									
								
</div>
							</div>
						</c:if>


						<c:if test="${cliente.sexo == 'Feminino'}">
							<div class="form-group">
						<label class="col-lg-3 control-label">Sexo</label>
						<div class="col-lg-5">

								
									 <input type="radio" name="sexo"
										value="Masculino" id="tipo" required> Masculino
									<br />
								
								<input type="radio" name="sexo"
										value="Feminino" id="tipo" required checked="checked">
										Feminino
									
							</div>
							</div>
							
						</c:if>


<div class="form-group">
						<label class="col-lg-3 control-label">Telefone</label>
						<div class="col-lg-5">
  
        <input type="text" class="form-control" name="telefone" id="telefone" required="required"  value="${cliente.telefone }" onkeydown="mascara( this )" onkeyup="mascara( this )" >
        </div>
        </div>
        
        <div class="form-group">
						<label class="col-lg-3 control-label">Tipo</label>
						<div class="col-lg-5">
     
        <select class="form-control" class="tipoTelefone" required="required"  name="tipoTelefone">
        <option value="celular">Celular</option>
        <option value="residencial">Residêncial</option>
        </select>
        </div>
        </div>
<div class="form-group">
						<label class="col-lg-3 control-label">Cep</label>
						<div class="col-lg-5">

							<input name="cep" type="text" id="cep" maxlength="9"
								onblur="pesquisacep(this.value);" class="form-control"
								required="required" onkeypress='return SomenteNumero(event)'
								value="${cliente.cep}" /><br />
						</div>
</div>
						<div class="form-group">
						<label class="col-lg-3 control-label">Rua</label>
						<div class="col-lg-5">
							<input type="text" name="rua" class="form-control"
								required="required" id="rua" value="${cliente.rua}">
						</div>
</div>

						<div class="form-group">
						<label class="col-lg-3 control-label">Complemento</label>
						<div class="col-lg-5">
							<input type="text" name="complemento" class="form-control"
								id="complemento" value="${cliente.complemento}">
						</div>

</div>

						<div class="form-group">
						<label class="col-lg-3 control-label">Nº</label>
						<div class="col-lg-5">
							<input type="text" name="numRua" class="form-control"
								required="required" onkeypress='return SomenteNumero(event)'
								id="numRua" value="${cliente.numRua}">
						</div>
						</div>

						<div class="form-group">
						<label class="col-lg-3 control-label">Bairro</label>
						<div class="col-lg-5">
							<input name="bairro" type="text" id="bairro" class="form-control"
								required="required" value="${cliente.bairro}" />
						</div>
</div>

						<div class="form-group">
						<label class="col-lg-3 control-label">Cidade</label>
						<div class="col-lg-5">
							<input name="cidade" type="text" id="cidade" class="form-control"
								required="required" value="${cliente.cidade}" /><br />

						</div>
						</div>
						<div class="form-group">
						<label class="col-lg-3 control-label">Estado</label>
						<div class="col-lg-5">
							<input name="uf" type="text" id="uf" required="required"
								class="form-control" value="${cliente.uf}" />

						</div>
</div>

						<div class="form-group">
						<label class="col-lg-3 control-label">Cnh</label>
						<div class="col-lg-5">
							<input type="text" name="cnh"
								onkeypress='return SomenteNumero(event)' maxlength="11"
								class="form-control" required="required" id="cnh"
								value="${cliente.cnh}">
						</div>
</div>
						<div class="form-group">
						<label class="col-lg-3 control-label">Validade</label>
						<div class="col-lg-5">
							<input type="date" name="validadeCnh" id="validadeCnh"
								class="form-control" required="required" maxlength="10"
								name="date" pattern="[0-9]{2}\/[0-9]{2}\/[0-9]{4}$"
								min="01-01-2012" max="18-02-2016" value="${cliente.validadeCnh}" />
						</div></div>

						<div class="form-group">
						<label class="col-lg-3 control-label">Emissão</label>
						<div class="col-lg-5">
							<input type="date" name="emissaoCnh" id="emissaoCnh"
								class="form-control" required="required" maxlength="10"
								name="date" pattern="[0-9]{2}\/[0-9]{2}\/[0-9]{4}$"
								min="01-01-2012" max="18-02-2016" value="${cliente.emissaoCnh}" />
						</div>
</div>

						<div class="form-group">
							<div class="col-lg-offset-3 col-lg-2">
								<button style="margin-top:20px;" type="submit" class="btn btn-primary" value="Enviar">Enviar</button>
								<div id="resposta"></div>
							</div>
							</div>

					</form>
				</div>
				
			</div>
			</div>
			
		
	

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
	
	  <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="resources/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resources/js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="resources/js/plugins/morris/raphael.min.js"></script>
    <script src="resources/js/plugins/morris/morris.min.js"></script>
    <script src="resources/js/plugins/morris/morris-data.js"></script>

</body>