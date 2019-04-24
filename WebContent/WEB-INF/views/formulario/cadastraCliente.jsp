<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" />
<link rel="icon" type="image/jpg" href="resources/icon.png" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script language="JavaScript" type="text/javascript" src="resources/MascaraValidacao.js"></script>
<title>Cliente</title>
</head>



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

<body>

<H3>Novo Cliente</H3>
<form name="form1"  action="adicionaCliente" method="get">


        <label for="nome">Nome:</label>
        <input type="text" name="nome" id="nome" >
        
        <label for="dataNascimento">Data de Nascimento:</label>
        <input type="date" name="dataNascimento" id="dataNascimento" required="required" maxlength="10" name="date" pattern="[0-9]{2}\/[0-9]{2}\/[0-9]{4}$" min="01-01-2012" max="18-02-2016" />
        
      
        
        <label for="rg">RG:</label>
        <input type="text" name="rg" id="rg"  maxlength=12" required="required"  onKeyPress="MascaraRG(form1.rg);"  onkeypress='return SomenteNumero(event)'>
        
        <label for="cpf">CPF:</label>
        <input type="text" name="cpf" id="cpf" required="required"  maxlength="11" onKeyPress="return Apenas_Numeros(event);" onBlur="validaCPF(this);">
        
        <p>
		<label>
		Sexo:<br>
		<input type="radio" name="sexo" value="Masculino" id="tipo" required>
		Masculino</label>
		<br />
		<label>
		<input type="radio" name="sexo" value="Feminino"  id="tipo" required>
		Feminino</label>
		</p>
        
        <label for="email">Email:</label>
        <input type="email"required="required"  class="input-text"  id="email"  name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" >
        
        <label for="telefone">Telefone:</label>
        <input type="text" name="telefone" id="telefone" required="required"  onkeydown="mascara( this )" onkeyup="mascara( this )" >
        
        <label class="tipoTelefone"  for="tipoTelefone">Tipo:</label>
        <select class="tipoTelefone" required="required"  name="tipoTelefone">
        <option value="celular">Celular</option>
        <option value="residencial">Residêncial</option>
        </select>
        
          <label>Cep:
        <input name="cep" type="text" id="cep" value="" size="10" maxlength="9"
               onblur="pesquisacep(this.value);" required="required"  onkeypress='return SomenteNumero(event)'  /></label><br />
        
        
        <label for="rua">Rua:</label>
        <input type="text" name="rua" required="required"  id="rua" >
        
        <label for="numRua">Nº:</label>
        <input type="text" name="numRua" required="required"   onkeypress='return SomenteNumero(event)'  id="numRua" >
        
        <label for="complemento">Complemento:</label>
        <input type="text" name="complemento" id="complemento" >
        
        <label>Bairro:
        <input name="bairro" type="text" id="bairro" required="required"  size="40" /></label><br />
        
        <label>Cidade:
        <input name="cidade" type="text" id="cidade" required="required"  size="40" /></label><br />
        
        <label>Estado:
        <input name="uf" type="text" id="uf" required="required"  size="2" /></label><br />
        
        <p>
        <label for="cnh">Cnh:</label>
        <input type="text" name="cnh"  onkeypress='return SomenteNumero(event)' required="required"  id="cnh" >
        
        <label for="validadeCnh">Validade:</label>
        <input type="date" name="validadeCnh" id="validadeCnh" required="required" maxlength="10" name="date" pattern="[0-9]{2}\/[0-9]{2}\/[0-9]{4}$" min="01-01-2012" max="18-02-2016" />
        
        <label for="emissaoCnh">Emissão:</label>
          <input type="date" name="emissaoCnh" id="emissaoCnh" required="required" maxlength="10" name="date" pattern="[0-9]{2}\/[0-9]{2}\/[0-9]{4}$" min="01-01-2012" max="18-02-2016" />
        
        </p>

<p>
<input type="submit" name="bt_gravar" id="bt_gravar" value="Adicionar">
</p> 

</form>

</body>
</html>