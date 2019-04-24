<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="icon" type="image/jpg" href="resources/icon.png" />

<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel='stylesheet prefetch'
	href='http://netdna.bootstrapcdn.com/font-awesome/4.0.1/css/font-awesome.min.css'>
<link rel='stylesheet prefetch'
	href='http://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css'>
	
<link rel='stylesheet prefetch'
	href='http://mottie.github.com/tablesorter/css/theme.bootstrap.css'>

<link rel="stylesheet" href="resources/TableSort/css/style.css">
<title>Locações</title>
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
                        Locações
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="adm">Inicial</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-fw fa-table "></i> Locações
                               
                        </ol>
                    </div>
                </div>
                <div id="bts">
			
				
	
	
                
              
			<table>
				<thead>
					<tr>
<td>Cód.Reserva</td>
<td>Grupo</td>
<td>Proteção</td>
<td>Cliente</td>
<td>Data de retirada</td>
<td>Data Prevista</td>

</tr>
</thead>

				<tbody>

<c:forEach items="${locacao}" var="locacao">

<tr>
<td>${locacao.id}</td>
<td>${locacao.grupo}</td>
<td>${locacao.protecao}</td>
<td>${locacao.cliente}</td>
<td>${locacao.data_Retirada}</td>
<td>${locacao.data_Prevista}</td>
</tr>

</c:forEach>
</tbody>
			</table>
			
			</div>
		</div>
	</div>
	

	
	<script
	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.25.8/js/jquery.tablesorter.min.js'></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.25.8/js/jquery.tablesorter.widgets.min.js'></script>

<script src="resources/TableSort/js/index.js"></script>


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