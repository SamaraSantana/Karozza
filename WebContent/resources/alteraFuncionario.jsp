<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Funcionário</title>
</head>

<body>

<H3>Novo Funcionário</H3>
<form name="form1"  action="alterarFuncionario" method="get">
		
		<input type="hidden" name="id" id="id" value="${funcionario.id}">

        <label for="nome">Nome:</label>
        <input type="text" name="nome" id="nome" value="${funcionario.nome}">
        
        <label for="dataNascimento">Data de Nascimento:</label>
        <input type="text" name="dataNascimento" id="dataNascimento" value="${funcionario.dataNascimento}">
        
        <label for="rg">RG:</label>
        <input type="text" name="rg" id="rg" value="${funcionario.rg}">
        
        <label for="cpf">CPF:</label>
        <input type="text" name="cpf" id="cpf" value="${funcionario.cpf}">
        
        <p>
		<label>
		
		<c:if test="${funcionario.sexo == 'Masculino'}">
		Sexo:<br>
		<input type="radio" name="sexo" value="Masculino" id="tipo" required checked="checked">
		Masculino</label>
		<br />
		<label>
		<input type="radio" name="sexo" value="Feminino"  id="tipo" required>
		Feminino</label>
		</p>
		</c:if>
	
		<c:if test="${funcionario.sexo == 'Feminino'}">
		Sexo:<br>
		<input type="radio" name="sexo" value="Masculino" id="tipo" required>
		Masculino</label>
		<br />
		<label>
		<input type="radio" name="sexo" value="Feminino"  id="tipo" required  checked="checked">
		Feminino</label>
		</p>
		</c:if>		
        
        <label for="email">Email:</label>
        <input type="text" name="email" id="email" value="${funcionario.email}">
        
        <label for="telefone">Telefone:</label>
        <input type="text" name="telefone" id="telefone" value="${funcionario.telefone}">
        
        <label for="rua">Rua:</label>
        <input type="text" name="rua" id="rua" value="${funcionario.rua}">
        
        <label for="numRua">Nº:</label>
        <input type="text" name="numRua" id="numRua" value="${funcionario.numRua}">
        
        <label for="complemento">Complemento:</label>
        <input type="text" name="complemento" id="complemento" value="${funcionario.complemento}">
        
        <label>Cep:
        <input name="cep" type="text" id="cep" value="${funcionario.cep}" size="10" maxlength="9"
               onblur="pesquisacep(this.value);" /></label><br />
        
        <label>Bairro:
        <input name="bairro" type="text" id="bairro" size="40" /></label><br />
        
        <label>Cidade:
        <input name="cidade" type="text" id="cidade" size="40" /></label><br />
        
        <label>Estado:
        <input name="uf" type="text" id="uf" size="2" /></label><br />
        
        <label for="login">Login:</label>
        <input type="text" name="login" id="login" value="${funcionario.login}">
        
        <label for="senha">Senha:</label>
        <input type="text" name="senha" id="senha" value="${funcionario.senha}">
        
        <label class="tipo" for="tipo">Tipo:</label>
        <select class="tipo" name="tipo">
        <option value="atendente">Atendente</option>
        </select>
        
        <label class="loja" for="loja">Loja:</label>
		<select class="loja" name="loja">
		<c:forEach items="${loja}" var="loja">
		<option value="${loja.id}">${loja.bairro}</option>
		</c:forEach>
		</select>

<p>
<input type="submit" name="bt_gravar" id="bt_gravar" value="Adicionar">
</p> 

</form>

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