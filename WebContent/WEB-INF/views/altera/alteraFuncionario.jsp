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

<!-- Bootstrap core CSS -->z
    <link href="resources/bootstrap-3.3.6/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="resources/bootstrap-3.3.6/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

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
    
    <link rel="stylesheet" href="resources/validacao-de-formularios-bootstrap-com-form-validation/css/bootstrap.css"/>
    <link rel="stylesheet" href="../validacao-de-formularios-bootstrap-com-form-validation/css/formValidation.css"/>

    <script type="text/javascript" src="resources/validacao-de-formularios-bootstrap-com-form-validation/js/jquery.min.js"></script>
    <script type="text/javascript" src="resources/validacao-de-formularios-bootstrap-com-form-validation/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="resources/validacao-de-formularios-bootstrap-com-form-validation/js/formValidation.js"></script>
    <script type="text/javascript" src="resources/validacao-de-formularios-bootstrap-com-form-validation/js/bootstrap.js"></script>


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Funcionário</title>

<script>
	function formatar(mascara, documento) {
		var i = documento.value.length;
		var saida = mascara.substring(0, 1);
		var texto = mascara.substring(i)

		if (texto.substring(0, 1) != saida) {
			documento.value += texto.substring(0, 1);
		}

	}
</script>

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
</head>

<body>

	<div id="wrapper">
		<c:import url="../cabecalho_funcionario.jsp"></c:import>


		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header"> Funcionário</h1>
						<ol class="breadcrumb">
							<li><i class="fa fa-dashboard"></i> <a href="adm">Inicial</a>
							</li>
							<li class="active"><i class="fa fa-fw fa-edit"></i>
								 Funcionário
						</ol>
					</div>
				</div>

				<form name="form1" action="alterarFuncionario" class="form-horizontal" method="post">

					<input type="hidden" name="id" id="id" value="${funcionario.id}">

				  
   <div class="form-group">
                        <label class="col-lg-3 control-label">Nome</label>
                        <div class="col-lg-5">

						<input type="text" name="nome" id="nome" class="form-control"
							value="${funcionario.nome}">
					</div>
</div>
				
				  
   <div class="form-group">
                        <label class="col-lg-3 control-label">Data de nascimento</label>
                        <div class="col-lg-5">
                        
						<input type="date" name="dataNascimento" id="dataNascimento"
							class="form-control" value="${funcionario.dataNascimento}"
							required="required" maxlength="10" name="date"
							pattern="[0-9]{2}\/[0-9]{2}\/[0-9]{4}$" min="01-01-2012"
							max="18-02-2016">
					</div>
</div>
					
   <div class="form-group">
                        <label class="col-lg-3 control-label">Rg</label>
                        <div class="col-lg-5">

						<input type="text" name="rg" id="rg" class="form-control"
							value="${funcionario.rg}" onKeyPress="MascaraRG(form1.rg);"
							maxlength="12" onkeypress='return SomenteNumero(event)'>
			</div>
					</div>

					  
   <div class="form-group">
                        <label class="col-lg-3 control-label">Cpf</label>
                        <div class="col-lg-5">

						<input type="text" name="cpf" id="cpf" class="form-control"
							value="${funcionario.cpf}" maxlength="11"
							onKeyPress="return Apenas_Numeros(event);"
							onBlur="validaCPF(this);">
					</div>

</div>
					<c:if test="${funcionario.sexo == 'Masculino'}">
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


						<c:if test="${funcionario.sexo == 'Feminino'}">
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
                        <label class="col-lg-3 control-label">Email</label>
                        <div class="col-lg-5">
						<input type="text" name="email" id="email"
							pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
							class="form-control" value="${funcionario.email}">
					</div>
					</div>

				  
   <div class="form-group">
                        <label class="col-lg-3 control-label">Telefone</label>
                        <div class="col-lg-5">
						<input type="text" name="telefone" id="telefone"
							class="form-control" OnKeyPress="formatar('####-####', this)"
							maxlength="09" value="${funcionario.telefone}"
							onkeypress='return SomenteNumero(event)'>
					</div>

</div>

					  
   <div class="form-group">
                        <label class="col-lg-3 control-label">Cep</label>
                        <div class="col-lg-5">

						<input name="cep" type="text" id="cep" maxlength="9"
							onblur="pesquisacep(this.value);" class="form-control"
							required="required" onkeypress='return SomenteNumero(event)'
							value="${funcionario.cep}" /><br />
					</div>
					</div>

					  
   <div class="form-group">
                        <label class="col-lg-3 control-label">Rua</label>
                        <div class="col-lg-5">
						<input type="text" name="rua" class="form-control"
							required="required" id="rua" value="${funcionario.rua}">
					</div>
</div>

				  
   <div class="form-group">
                        <label class="col-lg-3 control-label">Complemento</label>
                        <div class="col-lg-5">
						<input type="text" name="complemento" class="form-control"
							id="complemento" value="${funcionario.complemento}">
					</div>
</div>

					
					  
   <div class="form-group">
                        <label class="col-lg-3 control-label">Nº</label>
                        <div class="col-lg-5">
						<input type="text" name="numRua" class="form-control"
							required="required" onkeypress='return SomenteNumero(event)'
							id="numRua" value="${funcionario.numRua}">
					</div>
					
					</div>

					  
   <div class="form-group">
                        <label class="col-lg-3 control-label">Bairro</label>
                        <div class="col-lg-5">
						<input name="bairro" type="text" id="bairro" class="form-control"
							required="required" value="${funcionario.bairro}" />
					</div>
</div>

  
   <div class="form-group">
                        <label class="col-lg-3 control-label">Cidade</label>
                        <div class="col-lg-5">
						<input name="cidade" type="text" id="cidade" class="form-control"
							required="required" value="${funcionario.cidade}" /><br />
</div>
					</div>
					
					  
   <div class="form-group">
                        <label class="col-lg-3 control-label">Estado</label>
                        <div class="col-lg-5">
						<input name="uf" type="text" id="uf" required="required"
							class="form-control" value="${funcionario.uf}" />
</div>
					</div>

					  
   <div class="form-group">
                        <label class="col-lg-3 control-label">Login</label>
                        <div class="col-lg-5">
						<input name="login" type="text" id="login" required="required"
							class="form-control" value="${funcionario.login}" />
</div>
					</div>
  
   <div class="form-group">
                        <label class="col-lg-3 control-label">Senha</label>
                        <div class="col-lg-5">
						<input name="senha" type="text" id="senha" required="required"
							class="form-control" value="${funcionario.senha}" />

</div>
					</div>

					<div class="form-group">
						<label class="col-lg-3 control-label">Tipo</label>
						<div class="col-lg-5">
  
						<select class="form-control" class="tipo" name="tipo">
							
        <option value="atendente">Atendente</option>
         <option value="operadorCaixa">Operador de caixa</option>
          <option value="administradorFilial">Administrador filial</option>
             <option value="administradorMatriz">Administrador Matriz</option>
        </select>
        </div>
        </div>
							
				

					<div class="form-group">
						<label class="col-lg-3 control-label">Loja</label>
						<div class="col-lg-5">
  
						<select class="form-control" class="loja" name="loja">
							<c:forEach items="${loja}" var="loja">
								<option value="${loja.id}">${loja.bairro}</option>
							</c:forEach>
						</select>
					</div>
</div>
					<div class="form-group">
						<div class="col-lg-offset-3 col-lg-2">
							<button style="margin-top: 40px;margin-right: 20px;" type="submit" class="btn btn-primary" value="Enviar">Enviar</button>
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