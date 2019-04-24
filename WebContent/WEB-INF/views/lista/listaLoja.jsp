<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>Lojas</title>
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
                         Lojas
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="adm">Inicial</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-automobile "></i> Lojas
                               
                        </ol>
                    </div>
                </div>
			<table>
				<thead>
					<tr>
						<td>ID</td>
						<td>CNPJ</td>
						<td>Telefone</td>
						<td>Cep</td>
						<td>Rua</td>
						<td>N�</td>
						<td>Complemento</td>
						<td>Bairro</td>
						<td>Cidade</td>
						<td>Estado</td>
						<td>Tipo</td>
						
						<td>Alterar</td>

					</tr>
				</thead>

				<tbody>
					<c:forEach items="${lojas }" var="lojas">
						<tr>
							<td>${lojas.id}</td>
							<td>${lojas.cnpj}</td>
							<td>${lojas.telefone}</td>
							<td>${lojas.cep}</td>
							<td>${lojas.rua}</td>
							<td>${lojas.numRua}</td>
							<td>${lojas.complemento}</td>
							<td>${lojas.bairro}</td>
							<td>${lojas.cidade}</td>
							<td>${lojas.uf}</td>
							<td>${lojas.tipo}</td>

							<td><a href="alterarL?id=${lojas.id}"><img
									src="resources/edit.png" /></a></td>
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