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
<title>Opcional</title>

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



<script type="text/javascript">
	$(document).ready(function() {
		$('.form-horizontal').formValidation({
			icon : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			err : {
				container : 'tooltip'
			},

			fields : {
				'nome' : {
					validators : {
						notEmpty : {
							message : 'Este campo é necessário.'
						}
					}
				},

				'preco' : {
					validators : {
						notEmpty : {
							message : 'Este campo é necessário.'
						}
					}
				},
				'arquivo' : {
					validators : {
						notEmpty : {
							message : 'Este campo é necessário.'
						}
					}
				},

			}
		})

	});
</script>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		$('.form-horizontal').formValidation({
			icon : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			err : {
				container : 'tooltip'
			},

			fields : {
				'nome' : {
					validators : {
						notEmpty : {
							message : 'Este campo é necessário.'
						}
					}
				},

				'preco' : {
					validators : {
						notEmpty : {
							message : 'Este campo é necessário.'
						}
					}
				},
				'arquivo' : {
					validators : {
						notEmpty : {
							message : 'Este campo é necessário.'
						}
					}
				},

			}
		})

	});
</script>
<script language='JavaScript'>
	function SomenteNumero(e) {
		var tecla = (window.event) ? event.keyCode : e.which;
		if ((tecla > 47 && tecla < 58))
			return true;
		else {
			if (tecla == 8 || tecla == 0)
				return true;
			else
				return false;
		}
	}
</script>

<body>

	<div id="page-wrapper">
		<c:import url="../cabecalho_funcionario.jsp"></c:import>
		<div class="container">
			<div class="row">
				<section>
				<div class="col-lg-8 col-lg-offset-2">
					<div class="page-header">
						<h2>Opcional</h2>
					</div>


					<form name="form1" class="form-horizontal" action="alterarOpcional"
						method="post">

						<input type="hidden" name="id" id="id" value="${opcional.id}">
						<div class="form-group">
							<label class="col-lg-3 control-label">Nome</label>
							<div class="col-lg-8">
								<input class="form-control" id="nome" name="nome" type="text"
									value="${opcional.nome}" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-lg-3 control-label">Preço</label>
							<div class="col-lg-8">
								<input class="form-control"
									onkeypress='return SomenteNumero(event)' id="preco"
									name="preco" type="text" value="${opcional.preco}" />
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