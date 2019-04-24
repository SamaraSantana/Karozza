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
<title>Lista negra</title>
</head>

<body>

	<div id="wrapper">
		<c:import url="../cabecalho_funcionario.jsp"></c:import>


		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Lista Negra</h1>
						<ol class="breadcrumb">
							<li><i class="fa fa-dashboard"></i> <a href="adm">Dashboard</a>
							</li>
							<li class="active"><i class="fa fa-bar-chart-o"></i> Lista
								Negra
						</ol>
					</div>
				</div>

				<form name="form1" action="alterarListaNegra" method="get">

					<input type="hidden" name="id" id="id" value="${listaNegra.id}">

					<div class="col-lg-6">
						<h4>

							<label for="motivo">Motivo:</label>
						</h4>

						<input type="text" name="motivo" id="motivo" class="form-control"
							value="${listaNegra.motivo}">
					</div>

					
<div class="form-group">
									<label class="col-lg-3 control-label">Loja</label>
									<div class="col-lg-6">
										<select class="form-control" name="cliente" id="listaNegra.cliente"
											class="cliente">


											<c:forEach items="${cliente}" var="cliente">
												<c:if test="${listaNegra.cliente == cliente.id}">
													<option value="${cliente.id}" selected="selected">${cliente.nome}</option>

												</c:if>
											</c:forEach>


											

										</select>

									</div>
								</div>

					<div class="form-group">
					<div class="col-lg-offset-3 col-lg-2">
						<button type="submit" class="btn btn-primary" value="Enviar">Enviar</button>
						<div id="resposta"></div>
					</div>
			</div>

			</form>
			
			<!-- jQuery -->
    <script src="resources/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resources/js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="resources/js/plugins/morris/raphael.min.js"></script>
    <script src="resources/js/plugins/morris/morris.min.js"></script>
    <script src="resources/js/plugins/morris/morris-data.js"></script>
			
			</div>
			</div>
			</div>
			
</body>
</html>