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
<title>Multa</title>
<link rel="icon" type="image/jpg" href="resources/icon.png" />
<!-- Bootstrap core CSS -->
<link href="resources/bootstrap-3.3.6/css/bootstrap.min.css"
	rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link
	href="resources/bootstrap-3.3.6/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet">

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

<link rel="stylesheet"
	href="resources/validacao-de-formularios-bootstrap-com-form-validation/css/bootstrap.css" />
<link rel="stylesheet"
	href="../validacao-de-formularios-bootstrap-com-form-validation/css/formValidation.css" />

<script type="text/javascript"
	src="resources/validacao-de-formularios-bootstrap-com-form-validation/js/jquery.min.js"></script>
<script type="text/javascript"
	src="resources/validacao-de-formularios-bootstrap-com-form-validation/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="resources/validacao-de-formularios-bootstrap-com-form-validation/js/formValidation.js"></script>
<script type="text/javascript"
	src="resources/validacao-de-formularios-bootstrap-com-form-validation/js/bootstrap.js"></script>

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
                         Multa
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="adm">Inicial</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-automobile"></i> Multa
                        </ol>
                    </div>
                </div>
					<form name="form1" class="form-horizontal" action="adicionaMulta"
						method="post">

						<div class="form-group">
							<label class="col-lg-3 control-label">Data</label>
							<div class="col-lg-5">
								<input class="form-control" id="data" name="data" required="required" type="date" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-lg-3 control-label">Placa</label>
							<div class="col-lg-5">
								<select class="form-control"  required="required" class="exemplar" name="exemplar">
									<option disabled="disabled" selected="selected">Selecione</option>
									<c:forEach items="${exemplar}" var="exemplar">
									
										<option value="${exemplar.id}">${exemplar.placa}</option>
									</c:forEach>
								</select>

							</div>
						</div>

						<div class="form-group">
							<label class="col-lg-3 control-label">Infração</label>
							<div class="col-lg-5">
								<select class="form-control"  required="required" class="infracao" name="infracao">
								<option  required="required" disabled="disabled" selected="selected">Selecione</option>
									<c:forEach items="${infracao}" var="infracao">
										
										<option value="${infracao.id}">${infracao.descricao}</option>
									</c:forEach>
								</select>

							</div>
						</div>

						<div class="form-group">
							<div class="col-lg-offset-3 col-lg-3">
								<button type="submit" class="btn btn-primary" value="Enviar">Enviar</button>
								<div id="resposta"></div>
							</div>
						</div>
					</form>
				</div>
				</section>
			</div>
		</div>
	</div>

</body>
</html>