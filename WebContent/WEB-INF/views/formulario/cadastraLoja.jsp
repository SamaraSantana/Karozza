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
<title>Loja</title>
    
    <!-- Bootstrap core CSS -->
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

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript" type="text/javascript" src="resources/MascaraValidacao.js"></script>
	
<script>
function checa(){    
	if (this.form1.cnpj.value!=""){         
		this.form1.submit();   
		}else{        
			alert("o campo PCF não pode ficar vazio");}
	
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


<script>
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script', '//www.google-analytics.com/analytics.js',
			'ga');

	ga('create', 'UA-17536895-19', 'auto');
	ga('send', 'pageview');
</script>
<div id="fb-root"></div>
<script>
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/pt_BR/all.js#xfbml=1";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
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
                        <h1 class="page-header">
                      Loja
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="adm">Inicial</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-bar-chart-o"></i> Loja
                        </ol>
                    </div>
                </div>

	<form name="form1" action="adicionaLoja" class="form-horizontal"   method="get">


     <div class="form-group">
                        <label class="col-lg-3 control-label">Cnpj</label>
                        <div class="col-lg-5">
                            <input class="form-control" id="cnpj" name="cnpj"    onkeydown="mascara( this )" onkeyup="mascara( this )" onKeyPress="MascaraCNPJ(form1.cnpj);" 
maxlength="18" onBlur="ValidarCNPJ(form1.cnpj);" required="required"type="text" />
                        </div>
                    </div>   
                    
		
			
			     <div class="form-group">
                        <label class="col-lg-3 control-label">Telefone</label>
                        <div class="col-lg-5">
                            <input class="form-control" id="telefone" name="telefone"    onkeydown="mascara( this )" onkeyup="mascara( this )"required="required"type="text" />
                        </div>
                    </div>   
		
		 <div class="form-group">
                        <label class="col-lg-3 control-label">Cep</label>
                        <div class="col-lg-5">
                            <input class="form-control" id="cep" name="cep"  value="" size="10" maxlength="9"
               onblur="pesquisacep(this.value);" onkeypress='return SomenteNumero(event)'  required="required" type="text" />
                        </div>
                    </div>   
		
		
		<div class="form-group">
                        <label class="col-lg-3 control-label">Rua</label>
                        <div class="col-lg-5">
                            <input class="form-control" id="rua"  required="required" name="rua" type="text" />
                        </div>
                    </div>   
        
           
        
       
        
        
           <div class="form-group">
                        <label class="col-lg-3 control-label">N°</label>
                        <div class="col-lg-5">
                            <input class="form-control" id="numRua" name="numRua"  onkeypress='return SomenteNumero(event)' type="text" />
                        </div>
                    </div>   
       
     
        
   <div class="form-group">
                        <label class="col-lg-3 control-label">Complemento</label>
                        <div class="col-lg-5">
                            <input class="form-control" id="complemento" name="complemento" type="text" />
                        </div>
                    </div>   
       
          
        
      <div class="form-group">
                        <label class="col-lg-3 control-label">Bairro</label>
                        <div class="col-lg-5">
                            <input class="form-control" id="bairro" name="bairro" required="required"  type="text" />
                        </div>
                    </div>   
       
       <div class="form-group">
                        <label class="col-lg-3 control-label">Cidade</label>
                        <div class="col-lg-5">
                            <input class="form-control" id="cidade" name="cidade" required="required" type="text" />
                        </div>
                    </div>   
     
     <div class="form-group">
                        <label class="col-lg-3 control-label">Estado</label>
                        <div class="col-lg-5">
                            <input class="form-control" id="uf" name="uf"  required="required" type="text" />
                        </div>
                    </div>   
       
			
		
		  <div class="form-group">
                        <label class="col-lg-3 control-label">Tipo</label>
                          <div class="col-lg-5">
        <select class="form-control" class="tipo"  required="required" name="tipo">
        <option value="Filial">Filial</option>
         <option value="Matriz">Matriz</option>
       
        </select>
        </div>
        </div>
       
			 <!-- 											
			<input type="button" name="botaoValidarCNPJ"
			id="botaoValidarCNPJ"value="Validar CNPJ">
			 -->		
			
		

		
	<p>



                    <div class="form-group">
                        <div class="col-lg-offset-3 col-lg-3">
                            <button type="submit" class="btn btn-primary">Enviar</button>
                            <div id="resposta"> </div>
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