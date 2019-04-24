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

<script language="JavaScript" type="text/javascript" src="resources/MascaraValidacao.js"></script>
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
	
	 <link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    
        <link rel="stylesheet" href="resources/style.css">

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
	
	<!-- banner -->

<div class="container">
<div class="properties-listing spacer">

<div class="row">
<div class="col-lg-3 col-sm-4 ">

    <div class="row">
            <div class="col-lg-12  col-sm-10">
             <div id="resumo">
		
	<h4><div class="sei"><span  class="glyphicon glyphicon-tags"></span>Grupo - Descrição - Preço</div></h4>
		
		<h5><div  id="divAutomovel"></div></h5>

<h4><div class="icon"><span class="glyphicon glyphicon-tags"></span>Proteção - Preço</div></h4>
		
		<h5><div id="divProtecao"></div></h5>

<h4><div class="icon"><span class="glyphicon glyphicon-tags" ></span>Opcionais - Preço</div></h4>
		
		<h5><div id="divOpcional"></div></h5>
		
<br>
<br>
	</div>
            </div>
          
           <div id="teste"></div>		
  </div>

</div>
	<form name="form1" action="adicionaLocacao" method="get">

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
								<c:if test="${lojas.id eq locacao.local_Reserva}">
									<option value="${locacao.local_Reserva}" selected="selected">${lojas.bairro}</option>
								</c:if>

								<c:if test="${lojas.id eq null}">
									<option value="${lojas.id}">${lojas.bairro}</option>
								</c:if>

								<c:if test="${lojas.id ne locacao.local_Reserva}">
									<option value="${lojas.id}">${lojas.bairro}</option>
								</c:if>
							</c:forEach>

						</select>

						<h4>
							<span class="glyphicon glyphicon-calendar"></span>Data de Origem:
						</h4>
						<input type="text" class="form-control" name="data_Retirada"
							id="R_Data" value="${locacao.data_Retirada}"
							placeholder="Quando?" mask="##/##/####" maxlength="" />

						<h4>
							<span class="glyphicon glyphicon-time"></span>Hora de Origem:
						</h4>

						<select name="hora_Retirada" id="R_Hora"
							title="Horário de retirada do veículo"
							onchange="jq(('#D_Hora').val(this.value);"
							onblur="resumoLocacaoDataHora()" class="form-control">

							<option value="Selecione">Selecione</option>
							<option selected value='${locacao.hora_Retirada}'>${locacao.hora_Retirada}</option>
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
							id="D_Data" value="${locacao.data_Prevista}"
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
							<option selected value='${locacao.hora_Prevista}'>${locacao.hora_Prevista}</option>
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
						<table >
					
<input type="hidden" name="exemplar" value="1">
						<c:forEach items="${grupos}" var="grupos">
							<c:if test="${grupos.loja eq locacao.local_Reserva}">
								<tr>
									<td><h4>
											<img class="img"
												src="data:image/jpeg;base64, ${grupos.foto64 }" />
										</h4></td>
									<td><h4>${grupos.nome} ${grupos.descricao}</h4></td>
									
									<td><h4>R$ ${grupos.preco}</h4></td>

									<td><h4>
											<input type="radio" name="grupo"   class="radio-custom" value="${grupos.id}"
												id="${grupos.nome} - ${grupos.descricao} - R$ ${grupos.preco}">
												<label value="${grupos.id}" for="${grupos.nome} - ${grupos.descricao} - R$ ${grupos.preco}" class="radio-custom-label">Selecionar</label>
										</h4></td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
				<div>
            
        
				<div id="LocacaoItens" class="cont_tab">
					<br /> <label class="title" for="title">Proteção:</label>
						<table  >

						<c:forEach items="${protecoes}" var="protecoes">

							<tr>
								<td><h4>
										<img class="img"
											src="data:image/jpeg;base64, ${protecoes.foto64 }"/>
									</h4></td>
								<td><h4 >${protecoes.descricao}</h4></td>
								<td><h4>R$ ${protecoes.preco}</h4></td>
								<td><h4>
										<input type="radio"  class="radio-custom" name="protecao" value="${protecoes.id}"
											id="${protecoes.descricao} - R$ ${protecoes.preco}">
											<label value="${protecoes.id}" for="${protecoes.descricao} - R$ ${protecoes.preco}" class="radio-custom-label">Selecionar</label>
									</h4></td>
							</tr>
						</c:forEach>
					</table>

					<br /> 
					<br/>
					<label class="title" for="title">Opcionais:</label>
					
					<table >
						
						<c:forEach items="${opcionais}" var="opcionais">

							<tr>
								<td><h4>
										<img class="img"
											src="data:image/jpeg;base64, ${opcionais.foto64 }"  />
									</h4></td>
								<td><h4>${opcionais.nome}</h4></td>
								<td><h4>R$ ${opcionais.preco}</h4></td>
								<td><h4>
										<input type="checkbox" class="checkbox-custom" name="opcional"
											value="${opcionais.id}"
											id="${opcionais.nome} - R$ ${opcionais.preco}"
											onclick="verificaChecks()">
											 <label value="${opcionais.id}" for="${opcionais.nome} - R$ ${opcionais.preco}" class="checkbox-custom-label" onclick="verificaChecks()">Selecionar</label>
									</h4></td>
							</tr>

						</c:forEach>

					</table>
				</div>
	
        </div>
				<div id="LocacaoFinalizar" class="cont_tab">
				<input type="hidden" name="cliente" value="${clientes.id +1}">
	 <div class="col-lg-6">
					<h4>
					
						<label for="nome">Nome:</label>
					</h4>
					
					<input type="text" name="nome" id="nome" class="form-control" >
					</div>
					 <div class="col-lg-6">
					<h4>
						<label for="email">Email:</label>
					</h4>
					<input type="text" name="email" id="email"   pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" 
        class="form-control" >
</div>
 <div class="col-lg-6">
					<h4>
						<label for="cpf">CPF:</label>
					</h4>
					<input type="text" name="cpf" id="cpf" class="form-control"  maxlength="11" onKeyPress="return Apenas_Numeros(event);" onBlur="validaCPF(this);">
</div>

<div class="col-lg-6">
 <h4>
 <label for="rg">RG:</label>
 </h4>
        <input type="text" name="rg" id="rg"  maxlength="12" required="required" class="form-control" onKeyPress="MascaraRG(form1.rg);"  onkeypress='return SomenteNumero(event)'>
        </div>
         
 <div class="col-lg-6">
 <h4>
<label for="dataNascimento">Data de Nascimento:</label>
      </h4>
        
        <input type="date" class="form-control" name="dataNascimento" id="dataNascimento" required="required" maxlength="10" name="date" pattern="[0-9]{2}\/[0-9]{2}\/[0-9]{4}$" min="01-01-2012" max="18-02-2016" />
        </div>

          <div class="col-lg-6">
         
         <h4>
		<label>
		Sexo:<br/>
		<input type="radio" name="sexo" value="Masculino" id="tipo" required>
		Masculino</label><br/>
		</h4>
		<h4>
		<label>
		<input type="radio" name="sexo" value="Feminino"  id="tipo" required>
		Feminino</label></h4>
		
		</div>

         <div class="col-lg-6">
         <h4>
          <label>Cep:</label>
          </h4>
         
        <input name="cep" type="text" id="cep"  maxlength="9"
               onblur="pesquisacep(this.value);" class="form-control"required="required"   onkeypress='return SomenteNumero(event)'  /><br />
         </div>
         
         <div class="col-lg-6"> 
         <h4>
        <label for="rua">Rua:</label>
        </h4>
        <input type="text" name="rua" class="form-control" required="required"  id="rua" >
        </div>
        
        
        <div class="col-lg-12">
         <h4>
        <label for="complemento">Complemento:</label>
        </h4>
        <input type="text" name="complemento" class="form-control" id="complemento" >
        </div>
        
        
         <div class="col-lg-3">
         <h4>
        <label for="numRua">Nº:</label>
        </h4>
        <input type="text" name="numRua" class="form-control" required="required"    onkeypress='return SomenteNumero(event)'  id="numRua" >
        </div>
        
         <div class="col-lg-3">
         <h4>
        <label>Bairro:</label>
        </h4>
       
        <input name="bairro" type="text" id="bairro" class="form-control" required="required"  />
         </div>
         
        
         <div class="col-lg-3">
         
          <h4>
        <label>Cidade:</label>
        </h4>
        
        <input name="cidade" type="text" id="cidade" class="form-control"   required="required"   /><br />
        
        </div>
         <div class="col-lg-3">
         <h4>
        <label>Estado:</label>
        </h4>
        <input name="uf" type="text" id="uf" required="required" class="form-control"  />
        
        </div>

         <div class="col-lg-6">
         <h4>
        <label>Telefone</label>
        </h4>
        <input name="telefone" type="text" id="telefone" onkeydown="mascara( this )" onkeyup="mascara( this )" required="required" class="form-control"  />
        
        </div>
         
          <div class="col-lg-6">
         <h4>
        <label>Tipo</label>
        </h4>
         
       <select class="form-control" class="tipoTelefone" required="required"  name="tipoTelefone">
        <option value="celular">Celular</option>
        <option value="residencial">Residêncial</option>
        </select>
        
         </div>				  
					   <div class="col-lg-6"> 
         <h4>
        <label for="cnh">Cnh:</label>
        </h4>
        <input type="text" name="cnh"  onkeypress='return SomenteNumero(event)' maxlength="11" class="form-control" required="required"  id="cnh" >
        </div>
        
         <div class="col-lg-6"> 
         <h4>
        <label for="validadeCnh">Validade:</label>
        </h4>
        <input type="date" name="validadeCnh" id="validadeCnh" class="form-control" required="required" maxlength="10" name="date" pattern="[0-9]{2}\/[0-9]{2}\/[0-9]{4}$" min="01-01-2012" max="18-02-2016" />
        </div>
        
         <div class="col-lg-6"> 
         <h4>
        <label for="emissaoCnh">Emissão:</label>
        </h4>
          <input type="date" name="emissaoCnh" id="emissaoCnh" class="form-control" required="required"   maxlength="10" name="date" pattern="[0-9]{2}\/[0-9]{2}\/[0-9]{4}$" min="01-01-2012" max="18-02-2016" />
        </div>
        
					<p>
					<p>
					<hr>
						<input class="btFinalizar" type="submit" name="bt_gravar" id="bt_gravar" 
							value="finalizar reserva">
							<hr>
					</p>
				</div>
			</div>

			<div id="bts">
			
				<a href="teste"><input  type="button"  value="Cancelar" class="bt" /></a>
				
				<input  type="button"  value="Anterior" id="ant" class="bt" />
				
				 <input 
					 type="button" value="Próxima" id="prox" class="bt" />
			</div>

		</div>
	</form>

	
	</div>
	</div>
	</div>
	
	<script type="text/javascript">
	while (table.rows.length > 0)
    { table.deleteRow(0); }
	</script>

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
			

			var txt2 = document.getElementById("R_Data");
			document.getElementById("divR_Data").innerHTML = "Data de Retirada ......"
					+ txt2.value;

			var txt3 = document.getElementById("R_Hora");
			document.getElementById("divR_Hora").innerHTML = "Hora de Retirada...... "
					+ txt3.value;

			var txt4 = document.getElementById("D_Data");
			document.getElementById("divD_Data").innerHTML = "Data de Previsão...... "
					+ txt4.value;

			var txt5 = document.getElementById("D_Hora");
			document.getElementById("divD_Hora").innerHTML = "Hora de Previsão...... "
					+ txt5.value;
		}

		function verificaChecks() {
			var str = "";
			var boxes = document.getElementsByName("opcional");

			for (var i = 0; i < boxes.length; i++) {
				if (boxes[i].checked == true) {
					var tmp = boxes[i].id;
					str += tmp + " ; ";
				

				} else {
					document.getElementById('divOpcional').innerHTML = " ";
				}

				document.getElementById('divOpcional').innerHTML = " "
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
															.getElementById("divProtecao").innerHTML = " "
															+ ident1;

												} else if (jq(this).attr("name") == "grupo") {
													var identificador2 = jq(this)
															.attr("id");
													var ident2 = identificador2;
													document
															.getElementById("divAutomovel").innerHTML = " "
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
													.getElementById("divProtecao").innerHTML = " "
													+ ident1;

										} else if (jq(this).attr("name") == "grupo") {
											var identificador2 = jq(this)
													.attr("id");
											var ident2 = identificador2;
											document
													.getElementById("divAutomovel").innerHTML = " "
													+ ident2;
										}
									});
				});
	</script>


<script>
function formatar(mascara, documento){
  var i = documento.value.length;
  var saida = mascara.substring(0,1);
  var texto = mascara.substring(i)
  
  if (texto.substring(0,1) != saida){
            documento.value += texto.substring(0,1);
  }
  
}
</script>


<script>
stop = '';
function mascara( campo ) {
        campo.value = campo.value.replace( /[^\d]/g, '' )
                                 .replace( /^(\d\d)(\d)/, '($1) $2' )
                                 .replace( /(\d{4})(\d)/, '$1-$2' );
        if ( campo.value.length > 14 ) campo.value = stop;
        else stop = campo.value;    
}
</script>

</head>

<script language='JavaScript'>
function SomenteNumero(e){
    var tecla=(window.event)?event.keyCode:e.which;   
    if((tecla>47 && tecla<58)) return true;
    else{
    	if (tecla==8 || tecla==0) return true;
	else  return false;
    }
}

</script>

<script type="text/javascript">
function Apenas_Numeros(caracter)
{
  var nTecla = 0;
  if (document.all) {
	  nTecla = caracter.keyCode;
  } else {
	  nTecla = caracter.which;
  }
  if ((nTecla> 47 && nTecla <58)
  || nTecla == 8 || nTecla == 127
  || nTecla == 0 || nTecla == 9  // 0 == Tab
  || nTecla == 13) { // 13 == Enter
	  return true;
  } else {
	  return false;
  }
}
</script>

<script>
function validaCPF(cpf) 
 {
   erro = new String;
 
 	if (cpf.value.length == 11)
 	{	
 			cpf.value = cpf.value.replace('.', '');
 			cpf.value = cpf.value.replace('.', '');
 			cpf.value = cpf.value.replace('-', '');
 
 			var nonNumbers = /\D/;
 	
 			if (nonNumbers.test(cpf.value)) 
 			{
 					erro = "A verificacao de CPF suporta apenas números!"; 
 			}
 			else
 			{
 					if (cpf.value == "00000000000" || 
 							cpf.value == "11111111111" || 
 							cpf.value == "22222222222" || 
 							cpf.value == "33333333333" || 
 							cpf.value == "44444444444" || 
 							cpf.value == "55555555555" || 
 							cpf.value == "66666666666" || 
 							cpf.value == "77777777777" || 
 							cpf.value == "88888888888" || 
 							cpf.value == "99999999999") {
 							
 							erro = "Número de CPF inválido!"
 					}
 	
 					var a = [];
 					var b = new Number;
 					var c = 11;
 
 					for (i=0; i<11; i++){
 							a[i] = cpf.value.charAt(i);
 							if (i < 9) b += (a[i] * --c);
 					}
 	
 					if ((x = b % 11) < 2) { a[9] = 0 } else { a[9] = 11-x }
 					b = 0;
 					c = 11;
 	
 					for (y=0; y<10; y++) b += (a[y] * c--); 
 	
 					if ((x = b % 11) < 2) { a[10] = 0; } else { a[10] = 11-x; }
 	
 					if ((cpf.value.charAt(9) != a[9]) || (cpf.value.charAt(10) != a[10])) {
 						erro = "Número de CPF inválido.";
						
 					}
 			}
 	}
 	else
 	{
 		if(cpf.value.length == 0)
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
 	kcode=evt.keyCode;
 	if (kcode == 8) return;
 	if (CPF.value.length == 3) { CPF.value = CPF.value + '.'; }
 	if (CPF.value.length == 7) { CPF.value = CPF.value + '.'; }
 	if (CPF.value.length == 11) { CPF.value = CPF.value + '-'; }
 }
 
 // evento onBlur
 function formataCPF(CPF)
 {
 	with (CPF)
 	{
 		value = value.substr(0, 3) + '.' + 
 				value.substr(3, 3) + '.' + 
 				value.substr(6, 3) + '-' +
 				value.substr(9, 2);
 	}
 }
 function retiraFormatacao(CPF)
 {
 	with (CPF)
 	{
 		value = value.replace (".","");
 		value = value.replace (".","");
 		value = value.replace ("-","");
 		value = value.replace ("/","");
 	}
 }

</script>

<script type="text/javascript" >
    
    function limpa_formulário_cep() {
            //Limpa valores do formulário de cep.
            document.getElementById('rua').value=("");
            document.getElementById('bairro').value=("");
            document.getElementById('cidade').value=("");
            document.getElementById('uf').value=("");
            
    }

    function meu_callback(conteudo) {
        if (!("erro" in conteudo)) {
            //Atualiza os campos com os valores.
            document.getElementById('rua').value=(conteudo.logradouro);
            document.getElementById('bairro').value=(conteudo.bairro);
            document.getElementById('cidade').value=(conteudo.localidade);
            document.getElementById('uf').value=(conteudo.uf);
           
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
            if(validacep.test(cep)) {

                //Preenche os campos com "..." enquanto consulta webservice.
                document.getElementById('rua').value="...";
                document.getElementById('bairro').value="...";
                document.getElementById('cidade').value="...";
                document.getElementById('uf').value="...";
               

                //Cria um elemento javascript.
                var script = document.createElement('script');

                //Sincroniza com o callback.
                script.src = '//viacep.com.br/ws/'+ cep + '/json/?callback=meu_callback';

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

 
</body>


</html>