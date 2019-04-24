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
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />

<link rel="stylesheet" type="text/css" href="resources/geral.css" />
<script src="resources/code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>


<script type="text/javascript" src="/_js/script.min.js"></script>

<script type="text/javascript">
	var jq = $.noConflict(true);
</script>



</head>

<form action="reserva" method="get">
	<div class="container">
		<!-- banner -->
		<h3>Alugue um carro</h3>

		<div class="searchbar">

			<div class="row">
				<div class="col-lg-6 col-sm-6">
					<select class="form-control" name="local_Reserva"
						placeholder="Onde você quer alugar?" required="required">
						<option disabled="disabled" value="" selected="selected">Onde
							você quer alugar?</option>
						<c:forEach items="${lojas}" var="lojas">
							<option value="${lojas.id}">${lojas.bairro}</option>
						</c:forEach>
					</select>

					<div class="row">

						<div class="col-lg-3 col-sm-3 ">


							<input class="form-control" type="text" name="data_Retirada"
								id="R_Data" placeholder="Quando?" mask="##/##/####"
								maxlength="" class="data datepicker" required="required" />
						</div>
						<div class="col-lg-3 col-sm-4">

							<select class="form-control" name="hora_Retirada"
								id="R_Hora"
								title="Horário de retirada do veículo"
								onchange="$('#D_Hora').val(this.value);" required="required">
								<option value="Selecione">Selecione</option>
								<option selected value='10:00'>10:00</option>
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

						<div class="col-lg-3 col-sm-4">
							<input class="form-control" type="text" name="data_Prevista"
								id="D_Data" value="" placeholder="Até quando?" mask="##/##/####"
								maxlength="" class="data datepicker" required="required"/>
						</div>

						<div class="col-lg-3 col-sm-4">
							<select class="form-control" name="hora_Prevista"
							 id="D_Hora"
								title="Horário de retirada do veículo"
								onchange="$('#D_Hora').val(this.value);" required="required">
								<option value="Selecione">Selecione</option>
								<option selected value='10:00'>10:00</option>
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
						<div class="col-lg-9 col-sm-6">
						<hr class="cor">
						</div>
						<div class="col-lg-3 col-sm-4">
							<button class="btn btn-success"
								onclick="window.location.href='buysalerent'" type="submit">
								Buscar</button>
						</div>
					</div>
				</div>
				<div class="col-lg-5 col-lg-offset-1 col-sm-6 ">
					<p>Faça login para gerenciar suas reservas.</p>
					<button class="btn btn-info" data-toggle="modal"
						data-target="#loginpop">Login</button>
				</div>
			</div>
		</div>
	</div>
</form>

<script type="text/javascript">
//Permite Criar Inputs com Máscara
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
				|| ((sMask.charAt(i) == "(") || (sMask.charAt(i) == ")")
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
</script>
</body>
</html>