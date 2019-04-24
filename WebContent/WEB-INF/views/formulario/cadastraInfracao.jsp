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
<title>Infracao</title>

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
Infração
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="adm">Inicial</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-automobile "></i> Infração
                        </ol>
                    </div>
                </div>

					<form name="form1" class="form-horizontal"
						action="adicionaInfracao" method="post">

						<div class="form-group">
							<label class="col-lg-3 control-label">Descrição</label>
							<div class="col-lg-5">
								<input class="form-control" id="descricao" require="required" name="descricao" type="text" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-lg-3 control-label">Gravidade</label>
							<div class="col-lg-5">
								<input class="form-control" id="gravidade" require="required" name="gravidade"
									type="text" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-lg-3 control-label">Código</label>
							<div class="col-lg-5">
								<input class="form-control"  require="required" id="codigo" name="codigo"
									type="text" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-lg-3 control-label">Pontos</label>
							<div class="col-lg-5">
								<input class="form-control" require="required" id="pontos" name="pontos"
									type="text" />
							</div>
						</div>


						<div class="form-group">
							<label class="col-lg-3 control-label">Preço</label>
							<div class="col-lg-5">
								<input class="form-control" require="required" id="preco" name="preco" type="text" />
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