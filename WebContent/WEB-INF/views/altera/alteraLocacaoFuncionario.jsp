<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" />
<link rel="icon" type="image/jpg" href="resources/icon.png" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />

<link rel="stylesheet" type="text/css" href="resources/aba.css" />
<link rel="stylesheet" type="text/css" href="resources/table.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="/_js/jquery.placeholder.min.js"></script>
<script type="text/javascript" src="/_js/libs.min.js"></script>
<script type="text/javascript" src="/_js/script.min.js"></script>
<script type="text/javascript"
	src="/_comp/jqueryui/js/jquery-ui-1.9.2.custom.min.js"></script>

<script type="text/javascript">
	jQuery(function(){
		   jQuery.noConflict();
		});
	
	jq = $.noConflict();
</script>

<title>Locação</title>
</head>
</head>

<body>
	<H3>Nova Locação</H3>

	<form name="form1" action="alteraLocacaoFuncionario" method="get">
		<input type="hidden" name="id" id="id" value="${lojaLocacao.id}">

		<div id="nav">
			<ul class="tabs">
				<li><a href="#LocacaoDataHora">1 - Seu itinerário</a></li>
				<li><a href="#LocacaoGrupo">2 - Escolha seu veiculo</a></li>
				<li><a href="#LocacaoItens">3 - Proteção e itens</a></li>
				<li><a href="#LocacaoFinalizar">4 - Finalizar</a></li>
			</ul>

			<div class="tab_container">

				<div class="col-lg-12">
					<div id="LocacaoDataHora" class="cont_tab">
						<br /> <label class="title" for="title">Seu itinerário:</label>
						<h4>
							<span class="glyphicon glyphicon-map-marker"></span>Local da
							Reserva:
						</h4>
						<select class="form-control" name="local_Reserva"
							id="local_Reserva" onblur="resumoLocacaoDataHora()">

							<c:forEach items="${lojas}" var="lojas">
								<c:if test="${lojas.bairro eq lojaLocacao.local_Reserva}">
									<option value="${lojas.id}" selected="selected">${lojas.bairro}</option>
								</c:if>

								<c:if test="${lojas.bairro ne lojaLocacao.local_Reserva}">
									<option value="${lojas.id}">${lojas.bairro}</option>
								</c:if>
							</c:forEach>

						</select>

						<h4>
							<span class="glyphicon glyphicon-calendar"></span>Data de Origem:
						</h4>
						<input type="text" class="form-control" name="data_Retirada"
							id="R_Data" value="${lojaLocacao.data_Retirada}"
							placeholder="Quando?" mask="##/##/####" maxlength="" />

						<h4>
							<span class="glyphicon glyphicon-time"></span>Hora de Origem:
						</h4>

						<select name="hora_Retirada" id="R_Hora"
							title="Horário de retirada do veículo"
							onchange="jq(('#D_Hora').val(this.value);"
							onblur="resumoLocacaoDataHora()" class="form-control">

							<option value="Selecione">Selecione</option>
							<option selected value='${lojaLocacao.hora_Retirada}'>${lojaLocacao.hora_Retirada}</option>
							<option value='10:00'>10:00</option>
							<option value='10:15'>10:15</option>
							<option value='10:30'>10:30</option>
							<option value='10:45'>10:45</option>
							<option value='11:00'>11:00</option>
							<option value='11:15'>11:15</option>
							<option value='11:30'>11:30</option>
							<option value='11:45'>11:45</option>
							<option value='12:00'>12:00</option>
							<option value='12:15'>12:15</option>
							<option value='12:30'>12:30</option>
							<option value='12:45'>12:45</option>
							<option value='13:00'>13:00</option>
							<option value='13:15'>13:15</option>
							<option value='13:30'>13:30</option>
							<option value='13:45'>13:45</option>
							<option value='14:00'>14:00</option>
							<option value='14:15'>14:15</option>
							<option value='14:30'>14:30</option>
							<option value='14:45'>14:45</option>
							<option value='15:00'>15:00</option>
							<option value='15:15'>15:15</option>
							<option value='15:30'>15:30</option>
							<option value='15:45'>15:45</option>
							<option value='16:00'>16:00</option>
							<option value='16:15'>16:15</option>
							<option value='16:30'>16:30</option>
							<option value='16:45'>16:45</option>
							<option value='17:00'>17:00</option>
							<option value='17:15'>17:15</option>
							<option value='17:30'>17:30</option>
							<option value='17:45'>17:45</option>
							<option value='18:00'>18:00</option>
							<option value='18:15'>18:15</option>
							<option value='18:30'>18:30</option>
							<option value='18:45'>18:45</option>
							<option value='19:00'>19:00</option>
							<option value='19:15'>19:15</option>
							<option value='19:30'>19:30</option>
							<option value='19:45'>19:45</option>
							<option value='20:00'>20:00</option>
						</select>

						<h4>
							<span class="glyphicon glyphicon-calendar"></span>Data de
							Devolução:
						</h4>
						<input type="text" class="form-control" name="data_Prevista"
							id="D_Data" value="${lojaLocacao.data_Prevista}"
							placeholder="Quando?" mask="##/##/####" maxlength=""
							class="data datepicker"
							onkeypress="return InputMask(this, this.getAttribute('mask'), event);"
							onblur="resumoLocacaoDataHora()" />

						<h4>
							<span class="glyphicon glyphicon-time"></span>Hora de Devolução:
						</h4>
						<select name="hora_Prevista" id="D_Hora" class="form-control"
							title="Horário de retirada do veículo"
							onchange="jq('#D_Hora').val(this.value);"
							onblur="resumoLocacaoDataHora()">

							<option value="Selecione">Selecione</option>
							<option selected value='${lojaLocacao.hora_Prevista}'>${lojaLocacao.hora_Prevista}</option>
							<option value='10:00'>10:00</option>
							<option value='10:15'>10:15</option>
							<option value='10:30'>10:30</option>
							<option value='10:45'>10:45</option>
							<option value='11:00'>11:00</option>
							<option value='11:15'>11:15</option>
							<option value='11:30'>11:30</option>
							<option value='11:45'>11:45</option>
							<option value='12:00'>12:00</option>
							<option value='12:15'>12:15</option>
							<option value='12:30'>12:30</option>
							<option value='12:45'>12:45</option>
							<option value='13:00'>13:00</option>
							<option value='13:15'>13:15</option>
							<option value='13:30'>13:30</option>
							<option value='13:45'>13:45</option>
							<option value='14:00'>14:00</option>
							<option value='14:15'>14:15</option>
							<option value='14:30'>14:30</option>
							<option value='14:45'>14:45</option>
							<option value='15:00'>15:00</option>
							<option value='15:15'>15:15</option>
							<option value='15:30'>15:30</option>
							<option value='15:45'>15:45</option>
							<option value='16:00'>16:00</option>
							<option value='16:15'>16:15</option>
							<option value='16:30'>16:30</option>
							<option value='16:45'>16:45</option>
							<option value='17:00'>17:00</option>
							<option value='17:15'>17:15</option>
							<option value='17:30'>17:30</option>
							<option value='17:45'>17:45</option>
							<option value='18:00'>18:00</option>
							<option value='18:15'>18:15</option>
							<option value='18:30'>18:30</option>
							<option value='18:45'>18:45</option>
							<option value='19:00'>19:00</option>
							<option value='19:15'>19:15</option>
							<option value='19:30'>19:30</option>
							<option value='19:45'>19:45</option>
							<option value='20:00'>20:00</option>
						</select>
					</div>
				</div>

				<div id="LocacaoGrupo" class="cont_tab">
					<br /> <label class="title" for="title">Escolha seu
						veículo:</label>
					<table class="table table-striped">
						<tr>
							<td>Foto</td>
							<td>Nome</td>
							<td>Descrição</td>
							<td>Preço</td>
							<td>Selecionar</td>
						</tr>

						<c:forEach items="${grupos}" var="grupos">
							<tr>
								<td><h4>
										<img class="img"
											src="data:image/jpeg;base64, ${grupos.foto64 }" />
									</h4></td>
								<td><h4>${grupos.nome}</h4></td>
								<td><h4>${grupos.descricao}</h4></td>
								<td><h4>R$ ${grupos.preco}</h4></td>

								<c:if test="${grupos.id == grupoLocacao.id}">
									<td><h4>
											<input type="radio" name="grupo" value="${grupos.id}"
												id="${grupos.nome} - ${grupos.descricao} - R$ ${grupos.preco}"
												checked="checked">
										</h4></td>
								</c:if>


								<c:if test="${grupos.id != grupoLocacao.id}">
									<td><h4>
											<input type="radio" name="grupo" value="${grupos.id}"
												id="${grupos.nome} - ${grupos.descricao} - R$ ${grupos.preco}">
										</h4></td>
								</c:if>
							</tr>

						</c:forEach>
					</table>
				</div>

				<div id="LocacaoItens" class="cont_tab">
					<br /> <label class="title" for="title">Proteção:</label>
					<table class="table table-striped">
						<tr>
							<td>Foto</td>
							<td>Descricao</td>
							<td>Preço</td>
							<td>Selecionar</td>
						</tr>

						<c:forEach items="${protecoes}" var="protecoes">

							<tr>
								<td><h4>
										<img class="img"
											src="data:image/jpeg;base64, ${protecoes.foto64 }" />
									</h4></td>
								<td><h4>${protecoes.descricao}</h4></td>
								<td><h4>R$ ${protecoes.preco}</h4></td>

								<c:if test="${protecoes.id == protecaoLocacao.id}">
									<td><h4>
											<input type="radio" name="protecao" value="${protecoes.id}"
												id="${protecoes.descricao} - R$ ${protecoes.preco}"
												checked="checked">
										</h4></td>
								</c:if>

								<c:if test="${protecoes.id != protecaoLocacao.id}">
									<td><h4>
											<input type="radio" name="protecao" value="${protecoes.id}"
												id="${protecoes.descricao} - R$ ${protecoes.preco}">
										</h4></td>
								</c:if>
							</tr>
						</c:forEach>
					</table>

					<br /> <label class="title" for="title">Opcionais:</label>
					<table class="table table-striped">
						<tr>
							<td>Foto</td>
							<td>Nome</td>
							<td>Preço</td>
							<td>Selecionar</td>
						</tr>

						<c:forEach items="${opcionais}" var="opcionais">

							<tr>
								<td><h4>
										<img class="img"
											src="data:image/jpeg;base64, ${opcionais.foto64 }" />
									</h4></td>
								<td><h4>${opcionais.nome}</h4></td>
								<td><h4>R$ ${opcionais.preco}</h4></td>

								<c:forEach items="${opcionalLocacao}" var="opcionalLocacao">
									<c:if test="${opcionais.id == opcionalLocacao.id}">
										<td><h4>
												<span><input type="checkbox" name="opcional"
													value="${opcionais.id}"
													id="${opcionais.nome} - R$ ${opcionais.preco}"
													onclick="verificaChecks()" checked="checked"></span>
											</h4></td>
									</c:if>
								</c:forEach>
							</tr>

						</c:forEach>

					</table>
				</div>
				<div id="LocacaoFinalizar" class="cont_tab">
					<input type="hidden" name="cliente" value="${clientes.id}">
					<h4>
						<label for="nome">Nome:</label>
					</h4>
					<input type="text" name="nome" id="nome"
						value="${clientes.nome}" class="form-control">

					<h4>
						<label for="cpf">CPF:</label>
					</h4>
					<input type="text" name="cpf" id="cpf" value="${clientes.cpf}"
						class="form-control">

					<h4>
						<label for="email">Email:</label>
					</h4>
					<input type="text" name="email" id="email"
						value="${clientes.email }" class="form-control">

					<h4>
						<label for="telefone">Telefone:</label>
					</h4>
					<input type="text" name="telefone"
						value="${clientes.telefone }" id="telefone"
						class="form-control">

					<h4>
						<label class="tipoTelefone" for="tipoTelefone"
							class="form-control">Tipo:</label>
					</h4>
					<select name="tipoTelefone" class="form-control">
						<option value="celular">Celular</option>
						<option value="residencial">Residêncial</option>
					</select>
					<p><input type="submit" name="bt_gravar" id="bt_gravar"
						value="Adicionar"></p>
				</div>
			</div>

			<div id="bts">
				<a href="teste"><input type="button" value="Cancelar" class="bt" /></a>
				<input type="button" value="Anterior" id="ant" class="bt" /> <input
					type="button" value="Próxima" id="prox" class="bt" />
			</div>

		</div>
	</form>

	<div id="resumo" style="padding: 30px;">
		<h4>Resumo</h4>
		<div id="divlocal_Reserva" style="width: 400px; height: 30px;"></div>
		<div id="divR_Data" style="width: 400px; height: 30px;"></div>
		<div id="divR_Hora" style="width: 400px; height: 30px;"></div>
		<div id="divD_Data" style="width: 400px; height: 30px;"></div>
		<div id="divD_Hora" style="width: 400px; height: 30px;"></div>

		<div id="divAutomovel" style="width: 400px; height: 30px;"></div>

		<div id="divProtecao" style="width: 400px; height: 30px;"></div>

		<div id="divOpcional" style="width: 400px; height: 30px;"></div>


		<div id="teste"></div>

	</div>

	<script type="text/javascript">
		// Permite Criar Inputs com Máscara
		// Onde MASK pode ser 9*#!
		// 9 - Digito Númerico 0-9
		// # - Caractere alfanumérico a-z A-Z
		// ! - Caractere Maíusculo A-Z (Converte se necessário)
		// * - Caractere Maíusculo ou Dígito Numérico (Converte se Necessário)
		function InputMask(fld, sMask, evtKeyPress) {
			if (sMask == "")
				return true;

			var i, nCount, sValue, fldLen, mskLen, bolMask, sCod, nTecla;

			nTecla = (window.Event) ? evtKeyPress.which : evtKeyPress.keyCode;

			if (nTecla == 8)
				return true;

			var x = $("#" + fld.id).get(0);

			var startPos = fld.selectionStart;
			var endPos = fld.selectionEnd;

			if (startPos < endPos && x) {
				x.value = '';
			}

			sValue = fld.value;
			sValue = sValue.toString().replace("-", "");
			sValue = sValue.toString().replace("-", "");
			sValue = sValue.toString().replace("-", "");
			sValue = sValue.toString().replace("-", "");
			sValue = sValue.toString().replace(".", "");
			sValue = sValue.toString().replace(".", "");
			sValue = sValue.toString().replace(".", "");
			sValue = sValue.toString().replace(".", "");
			sValue = sValue.toString().replace("/", "");
			sValue = sValue.toString().replace("/", "");
			sValue = sValue.toString().replace("/", "");
			sValue = sValue.toString().replace("/", "");
			sValue = sValue.toString().replace("(", "");
			sValue = sValue.toString().replace("(", "");
			sValue = sValue.toString().replace("(", "");
			sValue = sValue.toString().replace("(", "");
			sValue = sValue.toString().replace(")", "");
			sValue = sValue.toString().replace(")", "");
			sValue = sValue.toString().replace(")", "");
			sValue = sValue.toString().replace(")", "");
			sValue = sValue.toString().replace(" ", "");
			sValue = sValue.toString().replace(" ", "");
			sValue = sValue.toString().replace(" ", "");
			sValue = sValue.toString().replace(" ", "");
			sValue = sValue.toString().replace(":", "");
			sValue = sValue.toString().replace(":", "");
			sValue = sValue.toString().replace(":", "");
			sValue = sValue.toString().replace(":", "");
			fldLen = sValue.length;
			//    mskLen = sMask.length;

			i = 0;
			nCount = 0;
			sCod = "";
			mskLen = fldLen;

			while (i <= mskLen) {
				bolMask = ((sMask.charAt(i) == "-") || (sMask.charAt(i) == ".") || (sMask
						.charAt(i) == "/"));
				bolMask = bolMask
						|| ((sMask.charAt(i) == "(")
								|| (sMask.charAt(i) == ")")
								|| (sMask.charAt(i) == " ") || (sMask.charAt(i) == ":"));

				if (bolMask) {
					sCod += sMask.charAt(i);
					mskLen++;
				} else {
					sCod += sValue.charAt(nCount);
					nCount++;
				}

				i++;
			}

			fld.value = sCod;

			if (nTecla != 8) // backspace
			{
				if (sMask.charAt(i - 1) == "9") { // apenas números...
					return ((nTecla > 47) && (nTecla < 58));
				} // números de 0 a 9
				else if (sMask.charAt(i - 1) == "#") {
					return ((nTecla >= 65 && nTecla <= 90) || (nTecla >= 97 && nTecla <= 122));
				} else if (sMask.charAt(i - 1) == "!") {
					if (nTecla >= 65 && nTecla <= 90)
						return true;
					else if (nTecla >= 97 && nTecla <= 122) {
						nTecla -= 32;
						if (window.Event)
							evtKeyPress.which = nTecla;
						else
							evtKeyPress.keyCode = nTecla;
						return true;
					} else
						return false;
				} else if (sMask.charAt(i - 1) == "*") {
					if (nTecla >= 65 && nTecla <= 90)
						return true;
					else if (nTecla >= 48 && nTecla <= 57)
						return true;
					else if (nTecla >= 97 && nTecla <= 122) {
						nTecla -= 32;
						if (window.Event)
							evtKeyPress.which = nTecla;
						else
							evtKeyPress.keyCode = nTecla;
						return true;
					} else
						return false;
				} else { // qualquer caracter...
					return true;
				}
			} else {
				return true;
			}
		}

		function add_date(datepicker, interval) {
			var parms = datepicker.split("/");
			var joindate = new Date(parms[1] + "/" + parms[0] + "/" + parms[2]);

			joindate.setDate(joindate.getDate() + interval);

			var dd = joindate.getDate();

			if (dd < 10)
				dd = '0' + dd;

			var mm = joindate.getMonth() + 1;

			if (mm < 10)
				mm = "0" + mm;

			var y = joindate.getFullYear();

			return dd + '/' + mm + '/' + y;
		}

		jq(document).ready(
				function() {
					jq.datepicker.regional['pt-BR'] = {
						closeText : 'Fechar',
						prevText : '&#x3c;Anterior',
						nextText : 'Pr&oacute;ximo&#x3e;',
						currentText : 'Hoje',
						monthNames : [ 'Janeiro', 'Fevereiro', 'Mar&ccedil;o',
								'Abril', 'Maio', 'Junho', 'Julho', 'Agosto',
								'Setembro', 'Outubro', 'Novembro', 'Dezembro' ],
						monthNamesShort : [ 'Jan', 'Fev', 'Mar', 'Abr', 'Mai',
								'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez' ],
						dayNames : [ 'Domingo', 'Segunda-feira',
								'Ter&ccedil;a-feira', 'Quarta-feira',
								'Quinta-feira', 'Sexta-feira', 'Sabado' ],
						dayNamesShort : [ 'Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex',
								'Sab' ],
						dayNamesMin : [ 'Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex',
								'Sab' ],
						weekHeader : 'Sm',
						dateFormat : 'dd/mm/yy',
						firstDay : 0,
						isRTL : false,
						showMonthAfterYear : false,
						yearSuffix : ''
					};

							jq.datepicker.setDefaults(jq.datepicker.regional['pt-BR']);
							jq("#R_Data").datepicker(
									{
										showAnim : 'slideDown',
										duration : 'fast',
										minDate : 0,
										onSelect : function(selectedDate) {
											if (jq(this).attr('id') == 'R_Data') {
												if (jq("#R_Hora").length > 0)
													jq("#R_Hora").focus();

												if (jq("#D_Data").length > 0) {
													jq("#D_Data").datepicker("option",
															"minDate",
															add_date(selectedDate, 1));
													jq("#D_Data").datepicker("option",
															"maxDate",
															add_date(selectedDate, 29));
													jq("#D_Data").val(
															add_date(selectedDate, 1));
												}

											}
											if (jq(this).attr('id') == 'D_Data') {
												if (jq("#D_Hora").length > 0)
													jq("#D_Hora").focus();
											}
										}

									});

							jq("#D_Data").datepicker(
									{
										showAnim : 'slideDown',
										duration : 'fast',
										minDate : 0,
										onSelect : function(selectedDate) {
											if (jq(this).attr('id') == 'R_Data') {
												if (jq("#R_Hora").length > 0)
													jq("#R_Hora").focus();

												if (jq("#D_Data").length > 0) {
													jq("#D_Data").datepicker("option",
															"minDate",
															add_date(selectedDate, 1));
													jq("#D_Data").datepicker("option",
															"maxDate",
															add_date(selectedDate, 27));
													jq("#D_Data").val(
															add_date(selectedDate, 1));
												}

											}
											if (jq(this).attr('id') == 'D_Data') {
												if (jq("#D_Hora").length > 0)
													jq("#D_Hora").focus();
											}
										}

									});
						});


		jQuery( "#nav" ).tabs({ active: 1 });
		jQuery('#nav ul li').not('.active').addClass('disabled');
		
		// numero de tabs geradas
		jQuerynumTabs = jQuery("#nav ul li").length

		// função do botão próximo
		jQuery("#prox").click(
				function() {
					// aba que esta ativa no momento
					jQuerycurrentTab = parseInt(jQuery("#nav ul li.ui-state-active a")
							.attr("id").replace(/\D/g, ''));

					// se for a ultima, nao deixa mudar
					// caso contrário, vai pra prox
					if (jQuerycurrentTab == jQuerynumTabs) {
						alert("Já está na ultima aba")
					} else {
						jQuery("#ui-id-" + (jQuerycurrentTab + 1)).click();
						resumoLocacaoDataHora();
					}
				})
		
		// função do botão anterior
		jQuery("#ant").click(
				function() {
					// aba que esta ativa no momento
					jQuerycurrentTab = parseInt(jQuery("#nav ul li.ui-state-active a")
							.attr("id").replace(/\D/g, ''));

					// se for a primeira, nao deixa mudar
					// caso contrário, vai pra anterior
					if (jQuerycurrentTab == 1) {
						alert("Já está na primeira aba")
						
					} else {
						jQuery("#ui-id-" + (jQuerycurrentTab - 1)).click();
					}
				})
</script>

	<script type="text/javascript">
		function resumoLocacaoDataHora() {
			var txt1 = document.getElementById("local_Reserva");
			document.getElementById("divlocal_Reserva").innerHTML = "Local da Reserva: " 
					+ txt1.value;

			var txt2 = document.getElementById("R_Data");
			document.getElementById("divR_Data").innerHTML = "Data de Retirada: "
					+ txt2.value;

			var txt3 = document.getElementById("R_Hora");
			document.getElementById("divR_Hora").innerHTML = "Hora de Retirada: "
					+ txt3.value;

			var txt4 = document.getElementById("D_Data");
			document.getElementById("divD_Data").innerHTML = "Data de Previsão: "
					+ txt4.value;

			var txt5 = document.getElementById("D_Hora");
			document.getElementById("divD_Hora").innerHTML = "Hora de Previsão: "
					+ txt5.value;
		}

		function verificaChecks() {
			var str = "";
			var boxes = document.getElementsByName("opcional");

			for (var i = 0; i < boxes.length; i++) {
				if (boxes[i].checked == true) {
					var tmp = boxes[i].id;
					str += tmp + ", ";

				} else {
					document.getElementById('divOpcional').innerHTML = "Opcional: ";
				}

				document.getElementById('divOpcional').innerHTML = "Opcional: "
						+ str;
			}
		}

		jq(document)
				.ready(
						function() {
							jq('input[type="radio"]')
									.click(
											function() {

												if (jq(this).attr("name") == "protecao") {
													var identificador1 = jq(this)
															.attr("id");
													var ident1 = identificador1;
													document
															.getElementById("divProtecao").innerHTML = "Protecao: "
															+ ident1;

												} else if (jq(this).attr("name") == "grupo") {
													var identificador2 = jq(this)
															.attr("id");
													var ident2 = identificador2;
													document
															.getElementById("divAutomovel").innerHTML = "Grupo: "
															+ ident2;
												}
											});
						});
		
		jq(document)
		.ready(
				function() {
					jq('input[type="button"]')
							.click(
									function() {

										if (jq(this).attr("name") == "protecao") {
											var identificador1 = jq(this)
													.attr("id");
											var ident1 = identificador1;
											document
													.getElementById("divProtecao").innerHTML = "Protecao: "
													+ ident1;

										} else if (jq(this).attr("name") == "grupo") {
											var identificador2 = jq(this)
													.attr("id");
											var ident2 = identificador2;
											document
													.getElementById("divAutomovel").innerHTML = "Grupo: "
													+ ident2;
										}
									});
				});
	</script>

</body>
</html>