<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script src="resources/jquery.tablesorter.min.js"></script>
<script src="resources/jquery.tablesorter.pager.js"></script>
<link rel="stylesheet" href="resources/custom.css" media="screen" />
<link rel="stylesheet" type="text/css" href="resources/geral.css">
<title>Lista de chamados</title>
</head>
<body>




	<div id="topo_form">
<img src="resources/fundo_cabecalho2.png" />
<div class="lista_chamado2">
<div id="formulario_funcionario">


			<form method="post" action="exemplo.html" id="frm-filtro">
      <p>
        <label for="pesquisar">Pesquisar</label>
        <input type="text" id="pesquisar" name="pesquisar" size="30" />
      </p>
    </form>
    
    <table>
      <thead>
        <tr>
<th>ID</th>
<th>Data abertura</th>
<th>Usuario</th>
<th>Problema</th>
<th>Categoria</th>
<th>Equipamento</th>
<th>Nº série</th>
<th>Técnico</th>
<th>Status</th>
<th>Data fechamento</th>
<th>finalizar</th>
          
        </tr>
      </thead>
      <tbody>
      <c:forEach items="${chamados }" var="chamados">
        <tr>
 
		<c:if test="${funcionarioLogado.nome == chamados.tecnico or funcionarioLogado.tipo =='Gestor' or usuarioLogado != null and usuarioLogado.nome == chamados.usuario}">
<td>${chamados.id}</td>
<td><fmt:formatDate value="${chamados.dataAbertura.time }"/></td>
<td>${chamados.usuario}</td>
<td>${chamados.problema}</td>
<td>${chamados.categoria}</td>
<td>${chamados.equipamento}</td>
<td>${chamados.serie}</td>


<td><c:if test="${chamados.tecnico == null}"><c:if test="${funcionarioLogado.tipo == 'Gestor'}">
<a href="eTecnico?id=${chamados.id}" style="color: #000">Escolher Técnico</a></c:if></c:if><c:if test="${chamados.tecnico != null}">${chamados.tecnico}</c:if></td>


<td>${chamados.status}</td>
<td><fmt:formatDate value="${chamados.dataFinalizacao.time }"/></td>




<td><c:if test="${chamados.tecnico != null}"><c:if test="${funcionarioLogado.tipo == 'Tecnico'}">
<a  href="finalizarAgora?id=${chamados.id}"><img src="resources/check.png"></a></c:if></c:if></td>

</c:if>
        </tr>
        
            
  <div id="pager" class="pager" style="top: 776px; position: absolute;">
    	<form>
				<span>
					Exibir <select class="pagesize">
							<option selected="selected" value="10">10</option>
							<option value="20">20</option>
							<option value="30">30</option>
							<option value="40">40</option>
					</select> registros
				</span>

				<img src="resources/first.png" class="first">
    		<img src="resources/prev.png" class="prev">
    		<input type="text" class="pagedisplay">
    		<img src="resources/next.png" class="next">
    		<img src="resources/last.png" class="last">
    	</form>
    </div>
   <script>
    $(function(){
      
      $('table > tbody > tr:odd').addClass('odd');
      
      $('table > tbody > tr').hover(function(){
        $(this).toggleClass('hover');
      });
      
      $('#marcar-todos').click(function(){
        $('table > tbody > tr > td > :checkbox')
          .attr('checked', $(this).is(':checked'))
          .trigger('change');
      });
      
      $('table > tbody > tr > td > :checkbox').bind('click change', function(){
        var tr = $(this).parent().parent();
        if($(this).is(':checked')) $(tr).addClass('selected');
        else $(tr).removeClass('selected');
      });
      
      $('form').submit(function(e){ e.preventDefault(); });
      
      $('#pesquisar').keydown(function(){
        var encontrou = false;
        var termo = $(this).val().toLowerCase();
        $('table > tbody > tr').each(function(){
          $(this).find('td').each(function(){
            if($(this).text().toLowerCase().indexOf(termo) > -1) encontrou = true;
          });
          if(!encontrou) $(this).hide();
          else $(this).show();
          encontrou = false;
        });
      });
      
      $("table") 
        .tablesorter({
          dateFormat: 'uk',
          headers: {
            0: {
              sorter: false
            },
            5: {
              sorter: false
            }
          }
        }) 
        .tablesorterPager({container: $("#pager")})
        .bind('sortEnd', function(){
          $('table > tbody > tr').removeClass('odd');
          $('table > tbody > tr:odd').addClass('odd');
        });
      
    });
    </script>
    </c:forEach>  
        </tbody>
   </table>
		</div>
		</div>
		</div>
		
	
	
</body>
</html>