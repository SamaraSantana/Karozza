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
<link rel="icon" type="image/jpg" href="resources/icon.png" />

<link rel='stylesheet prefetch'
	href='http://netdna.bootstrapcdn.com/font-awesome/4.0.1/css/font-awesome.min.css'>
<link rel='stylesheet prefetch'
	href='http://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css'>
<link rel='stylesheet prefetch'
	href='http://mottie.github.com/tablesorter/css/theme.bootstrap.css'>

<link rel="stylesheet" href="resources/TableSort/css/style.css">

<title>Automovel</title>
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
                         Autom�veis
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="adm">Inicial</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-automobile "></i>  Autom�veis
                               
                        </ol>
                    </div>
                </div>
	

			<table>
				<thead>
					<tr>
						<td>ID</td>
						<td>Marca</td>
						<td>Modelo</td>
						<td>Ano</td>
						<td>Motor</td>
						<td>Transmiss�o</td>
						<td>Bomba Combust�vel</td>
						<td>Grupo</td>
						<td>Alterar</td>
						<td>Remover</td>
					</tr>
				</thead>

				<tbody>

					<c:forEach items="${automoveis}" var="automoveis">

						<tr>
							<td>${automoveis.id}</td>
							<td>${automoveis.marca}</td>
							<td>${automoveis.modelo}</td>
							<td>${automoveis.ano}</td>
							<td>${automoveis.motor}</td>
							<td>${automoveis.transmissao}</td>
							<td>${automoveis.bombaCombustivel}</td>
							<td>${automoveis.grupo}</td>
							<td><a href="alterarA?id=${automoveis.id}"><img
									src="resources/edit.png" /></a></td>
							<td><a href="removerAutomovel?id=${automoveis.id}"><img
									src="resources/delete.png" /></a></td>
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