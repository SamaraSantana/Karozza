<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" type="image/jpg" href="resources/icon.png" />
<title>Exemplar</title>
<meta charset="UTF-8" />
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
</head>
<script type="text/javascript"
	src="resources/validacao-de-formularios-bootstrap-com-form-validation/js/jquery.min.js"></script>
<script type="text/javascript"
	src="resources/validacao-de-formularios-bootstrap-com-form-validation/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="resources/validacao-de-formularios-bootstrap-com-form-validation/js/formValidation.js"></script>
<script type="text/javascript"
	src="resources/validacao-de-formularios-bootstrap-com-form-validation/js/bootstrap.js"></script>



<script>
	function valida() {
		with (document.teste) {
			var erro = 0; //Erros	
			var msg = ""; //MSGs	
			var er = /[a-z]{3}?\d{4}/gim; //Expressão regular para 3 letras e 4 números	
			if (txtPlaca.value == "") {
				msg = msg + "Digite a placa de seu veículo.\n";
				erro = erro + 1;
			} else if (txtPlaca.value != "") {
				er.lastIndex = 0;
				pl = txtPlaca.value;
				if (!er.test(pl)) {
					msg = msg
							+ "Placa inválida. Uma placa válida deve contem 3 letras e 4 números.\n";
					erro = erro + 1;
				}
			}
			if (erro == 0) {
				submit();
			} else {
				alert(msg);
			}
		}
	}
</script>



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
				'placa' : {
					validators : {
						notEmpty : {
							message : 'Este campo é necessário.'
						}
					}
				},
				'renavam' : {
					validators : {
						notEmpty : {
							message : 'Este campo é necessário.'
						}
					}
				},
				'chassi' : {
					validators : {
						notEmpty : {
							message : 'Este campo é necessário.'
						}
					}
				},

				'odometro' : {
					validators : {
						notEmpty : {
							message : 'Este campo é necessário.'
						}
					}
				},
				'cor' : {
					validators : {
						notEmpty : {
							message : 'Este campo é necessário.'
						}
					}
				},
				'status' : {
					validators : {
						notEmpty : {
							message : 'Este campo é necessário.'
						}
					}
				},
				'loja' : {
					validators : {
						notEmpty : {
							message : 'Este campo é necessário.'
						}
					}
				},

				'automovel' : {
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
				'placa' : {
					validators : {
						notEmpty : {
							message : 'Este campo é necessário.'
						}
					}
				},
				'renavam' : {
					validators : {
						notEmpty : {
							message : 'Este campo é necessário.'
						}
					}
				},
				'chassi' : {
					validators : {
						notEmpty : {
							message : 'Este campo é necessário.'
						}
					}
				},
				'odometro' : {
					validators : {
						notEmpty : {
							message : 'Este campo é necessário.'
						}
					}
				},
				'cor' : {
					validators : {
						notEmpty : {
							message : 'Este campo é necessário.'
						}
					}
				},
				'status' : {
					validators : {
						notEmpty : {
							message : 'Este campo é necessário.'
						}
					}
				},
				'loja' : {
					validators : {
						notEmpty : {
							message : 'Este campo é necessário.'
						}
					}
				},
				'automovel' : {
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
				}
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


<script language="javascript">
	function testaPlaca(placa) {
		padrao = /^[a-zA-Z]{3}\d{4}$/
		OK = padrao.exec(placa);
		if (!OK) {
			window.alert("Placa no formato incorreto!");
			//faz alguma coisa
		}
	}
</script>



<script>
	function valida() {
		with (document.teste) {
			var erro = 0; //Erros	
			var msg = ""; //MSGs	
			var er = /[a-z]{3}?\d{4}/gim; //Expressão regular para 3 letras e 4 números	
			if (txtPlaca.value == "") {
				msg = msg + "Digite a placa de seu veículo.\n";
				erro = erro + 1;
			} else if (txtPlaca.value != "") {
				er.lastIndex = 0;
				pl = txtPlaca.value;
				if (!er.test(pl)) {
					msg = msg
							+ "Placa inválida. Uma placa válida deve contem 3 letras e 4 números.\n";
					erro = erro + 1;
				}
			}
			if (erro == 0) {
				submit();
			} else {
				alert(msg);
			}
		}
	}
</script>


<body>
	<div id="wrapper">
		<c:import url="../cabecalho_funcionario.jsp"></c:import>


		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Exemplares</h1>
						<ol class="breadcrumb">
							<li><i class="fa fa-dashboard"></i> <a href="adm">Inicial</a>
							</li>
							<li class="active"><i class="fa fa-automobile "></i>
								Exemplares
						</ol>
					</div>
				</div>
				<form name="form1" class="form-horizontal" action="alterarExemplar"
					method="post" enctype="multipart/form-data">

					<input type="hidden" name="id" id="id" value="${exemplar.id}">

					<div class="form-group">
						<label class="col-lg-3 control-label">Placa</label>
						<div class="col-lg-5">
							<input class="form-control" id="placa"
								onblur="testaPlaca(this.value)" name="placa" type="text"
								value="${exemplar.placa}" />
						</div>
					</div>



					<div class="form-group">
						<label class="col-lg-3 control-label">Renavam</label>
						<div class="col-lg-5">
							<input class="form-control" id="renavam"
								onkeypress='return SomenteNumero(event)' name="renavam"
								type="text" value="${exemplar.renavam}" />
						</div>
					</div>


					<div class="form-group">
						<label class="col-lg-3 control-label">Chassi</label>
						<div class="col-lg-5">
							<input class="form-control" id="chassi"
								onkeypress='return SomenteNumero(event)' name="chassi"
								type="text" value="${exemplar.chassi}" />
						</div>
					</div>



					<div class="form-group">
						<label class="col-lg-3 control-label">Odômetro</label>
						<div class="col-lg-5">
							<input class="form-control"
								onkeypress='return SomenteNumero(event)' id="odometro"
								name="odometro" type="text" value="${exemplar.odometro}" />
						</div>
					</div>



					<div class="form-group">
						<label class="col-lg-3 control-label">Cor</label>
						<div class="col-lg-5">
							<input class="form-control" id="cor" name="cor" type="text"
								value="${exemplar.cor}" />
						</div>
					</div>





					<div class="form-group">
						<label class="col-lg-3 control-label">Status</label>
						<div class="col-lg-5">
							<select class="form-control" class="status" name="status">
								
								<option value="Disponivel">Disponível</option>
								<option value="Alugado">Alugado</option>
								<option value="oficina">Oficina</option>
							</select>
						</div>
					</div>

					
					<div class="form-group">
									<label class="col-lg-3 control-label">Loja</label>
									<div class="col-lg-5">
										<select class="form-control" name="loja" id="exemplar.loja"
											class="loja">


											<c:forEach items="${loja}" var="loja">
												<c:if test="${exemplar.loja == loja.id}">
													<option value="${loja.id}" selected="selected">${loja.bairro}</option>

												</c:if>
											</c:forEach>


											<c:forEach items="${loja}" var="loja">
												<c:if test="${exemplar.loja != loja.id}">
													<option value="${loja.id}">${loja.bairro}</option>

												</c:if>
											</c:forEach>

										</select>

									</div>
								</div>


				

<div class="form-group">
									<label class="col-lg-3 control-label">Modelo</label>
									<div class="col-lg-5">
										<select class="form-control" name="automovel" id="exemplar.automovel"
											class="automovel">


											<c:forEach items="${automovel}" var="automovel">
												<c:if test="${exemplar.automovel == automovel.id}">
													<option value="${automovel.id}" selected="selected">${automovel.modelo}</option>

												</c:if>
											</c:forEach>


											<c:forEach items="${automovel}" var="automovel">
												<c:if test="${exemplar.automovel != automovel.id}">
													<option value="${automovel.id}" selected="selected">${automovel.modelo}</option>
											
												</c:if>
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