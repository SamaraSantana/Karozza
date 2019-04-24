<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />

<link rel="stylesheet" type="text/css" href="resources/geral.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="/_js/jquery.placeholder.min.js"></script>
<script type="text/javascript" src="/_js/libs.min.js"></script>
<script type="text/javascript" src="/_js/script.min.js"></script>
<script type="text/javascript"
	src="/_comp/jqueryui/js/jquery-ui-1.9.2.custom.min.js"></script>
</head>
<body>



<div id="tabs" style="height: 300px">
			<ul class="nav">
				<li><a class="disabled" href="#LocacaoDataHora">Seu itinerário</a></li>
				<li class="active"><a href="#LocacaoGrupo">Escolha seu veiculo</a></li>
				<li><a href="#LocacaoItens">Proteção e itens</a></li>
				<li><a href="#LocacaoFinalizar">Finalizar</a></li>
			</ul>
			</div>
			
			
			<div id="LocacaoDataHora" class="tab-pane">
				<label class="loja" for="loja">Local:</label> <select
					class="local_Reserva" name="local_Reserva" id="local_Reserva"
					onblur="resumoLocacaoDataHora()">
					<c:forEach items="${lojas}" var="lojas">
						<option id="${lojas.bairro}" selected
							value="${param.local_Reserva0}">${lojas.bairro}</option>
					</c:forEach>
				</select> <input type="text" name="data_Retirada" id="R_Data"
					value="${param.data_Retirada0}" placeholder="Quando?"
					mask="##/##/####" maxlength="" class="data datepicker" /> <select
					name="hora_Retirada" class="data hora" id="R_Hora"
					title="Horário de retirada do veículo"
					onchange="$('#D_Hora').val(this.value);"
					onblur="resumoLocacaoDataHora()">

					<option value="Selecione">Selecione</option>
					<option selected value='${param.hora_Retirada0}'>${param.hora_Retirada0}</option>
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
				</select> <input type="text" name="data_Prevista" id="D_Data"
					value="${param.data_Prevista0}" placeholder="Quando?"
					mask="##/##/####" maxlength="" class="data datepicker"
					onkeypress="return InputMask(this, this.getAttribute('mask'), event);"
					onblur="resumoLocacaoDataHora()" /> <select name="hora_Prevista"
					class="data hora" id="D_Hora"
					title="Horário de retirada do veículo"
					onchange="$('#D_Hora').val(this.value);"
					onblur="resumoLocacaoDataHora()">

					<option value="Selecione">Selecione</option>
					<option selected value='${param.hora_Prevista0}'>${param.hora_Prevista0}</option>
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

		$(document)
				.ready(
						function() {
							$.datepicker.regional['pt-BR'] = {
								closeText : 'Fechar',
								prevText : '&#x3c;Anterior',
								nextText : 'Pr&oacute;ximo&#x3e;',
								currentText : 'Hoje',
								monthNames : [ 'Janeiro', 'Fevereiro',
										'Mar&ccedil;o', 'Abril', 'Maio',
										'Junho', 'Julho', 'Agosto', 'Setembro',
										'Outubro', 'Novembro', 'Dezembro' ],
								monthNamesShort : [ 'Jan', 'Fev', 'Mar', 'Abr',
										'Mai', 'Jun', 'Jul', 'Ago', 'Set',
										'Out', 'Nov', 'Dez' ],
								dayNames : [ 'Domingo', 'Segunda-feira',
										'Ter&ccedil;a-feira', 'Quarta-feira',
										'Quinta-feira', 'Sexta-feira', 'Sabado' ],
								dayNamesShort : [ 'Dom', 'Seg', 'Ter', 'Qua',
										'Qui', 'Sex', 'Sab' ],
								dayNamesMin : [ 'Dom', 'Seg', 'Ter', 'Qua',
										'Qui', 'Sex', 'Sab' ],
								weekHeader : 'Sm',
								dateFormat : 'dd/mm/yy',
								firstDay : 0,
								isRTL : false,
								showMonthAfterYear : false,
								yearSuffix : ''
							};

							$.datepicker
									.setDefaults($.datepicker.regional['pt-BR']);
							$(".datepicker")
									.datepicker(
											{
												showAnim : 'slideDown',
												duration : 'fast',
												minDate : 0,
												onSelect : function(
														selectedDate) {
													if ($(this).attr('id') == 'R_Data') {
														if ($("#R_Hora").length > 0)
															$("#R_Hora")
																	.focus();

														if ($("#D_Data").length > 0) {
															$("#D_Data")
																	.datepicker(
																			"option",
																			"minDate",
																			add_date(
																					selectedDate,
																					1));
															$("#D_Data")
																	.datepicker(
																			"option",
																			"maxDate",
																			add_date(
																					selectedDate,
																					27));
															$("#D_Data")
																	.val(
																			add_date(
																					selectedDate,
																					1));
														}

													}
													if ($(this).attr('id') == 'D_Data') {
														if ($("#D_Hora").length > 0)
															$("#D_Hora")
																	.focus();
													}
												}

											});
						});

		$(document).ready(function() {
			$(".cont_tab").hide();
			$("ul.tabs li:first").addClass("active").show();
			$(".cont_tab:first").show();
			$("ul.tabs li").click(function() {
				$("ul.tabs li").removeClass("active")
				$(this).addClass("active")
				$(".cont_tab").hide();
				var activeTab = $(this).find("a").attr("href");
				$(activeTab).fadeIn("slow");
				
				$('.nav li').not('.active').addClass('disabled');
				
				return false;
			});

			/*Efeito Zebrado*/
			$('tr:odd').css('background', '#FFEBCC');
		});
		
		$("#tabs").tabs();
		
		// numero de tabs geradas
		$numTabs = $("#tabs ul li").length

		// função do botão próximo
		$("#prox").click(
				function() {
					// aba que esta ativa no momento
					$currentTab = parseInt($("#tabs ul li.ui-state-active a")
							.attr("id").replace(/\D/g, ''));

					// se for a ultima, nao deixa mudar
					// caso contrário, vai pra prox
					if ($currentTab == $numTabs) {
						alert("Já está na ultima aba")
					} else {
						$("#ui-id-" + ($currentTab + 1)).click();
						resumoLocacaoDataHora();
					}
				})
		
		// função do botão anterior
		$("#ant").click(
				function() {
					// aba que esta ativa no momento
					$currentTab = parseInt($("#tabs ul li.ui-state-active a")
							.attr("id").replace(/\D/g, ''));

					// se for a primeira, nao deixa mudar
					// caso contrário, vai pra anterior
					if ($currentTab == 1) {
						alert("Já está na primeira aba")
					} else {
						$("#ui-id-" + ($currentTab - 1)).click();
					}
				})

		if ($("#LojaR").length > 0) {
			$("#LojaR").autocomplete({
				source : "/services/karozza/listarLojas",
				minLength : 1,
				autoFocus : true,
				delay : 500,
				//position: { offset: "171 -10", my: "right center", at: "right bottom", of: "#Cod_Agente" },
				open : function(event, ui) {
					//i = false;
				},
				close : function(event, ui) {
					//i = true;
					//$(this).autocomplete("destroy");
				},
				select : function(event, ui) {
					$("#LojaR").val(ui.item.label);
					$("#R_FilialID").val(ui.item.id);
					$("#R_Filial_Horario").val(ui.item.horario);

					if ($("#R_Data").length > 0)
						$("#R_Data").focus();

					if ($("#LojaD").length > 0) {
						$("#LojaD").val(ui.item.label);
						$("#D_FilialID").val(ui.item.id);
						$("#D_Filial_Horario").val(ui.item.horario);
					}

					return false;
				}
			}).data("ui-autocomplete")._renderItem = function(ul, item) {
				if (item.aero == 2)
					img = "<img src='/_img/reserva/aviao.png'>";
				else
					img = "<img src='/_img/reserva/next.png'>";

				return $("<li>")

				.append(
						"<a style='border:1px solid #ccc;'>" + item.label
								+ "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "
								+ img + "&nbsp;&nbsp;" + item.sigla + " - "
								+ item.descr + "</a>").appendTo(ul);
			};
		}
	</script>

	<script type="text/javascript">
		function resumoLocacaoDataHora() {
			var txt1 = document.getElementById("local_Reserva");
			var d1 = document.getElementById("divlocal_Reserva");
			d1.innerHTML = "Local da Reserva: " + txt1.value;

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

		$(document)
				.ready(
						function() {
							$('input[type="radio"]')
									.click(
											function() {

												if ($(this).attr("name") == "protecao") {
													var identificador1 = $(this)
															.attr("id");
													var ident1 = identificador1;
													document
															.getElementById("divProtecao").innerHTML = "Protecao: "
															+ ident1;

												} else if ($(this).attr("name") == "grupo") {
													var identificador2 = $(this)
															.attr("id");
													var ident2 = identificador2;
													document
															.getElementById("divAutomovel").innerHTML = "Grupo: "
															+ ident2;
												}
											});
						});
	</script>



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


</body>
</html>