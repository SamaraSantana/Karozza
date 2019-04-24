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

<link rel="stylesheet" href="resources/style.css">

  <link rel="stylesheet" href="resources/style.css">
  
<title>Aluguel</title>
</head>
<body>

	<script type="text/javascript">
		function tipoPessoaSel() {
			var pf = document.getElementById("opt-pf").checked;
			var pf2 = document.getElementById("opt-pf2").checked;
			var pf3 = document.getElementById("opt-pf3").checked;
			if (pf) {
				document.getElementById("p1").style.display = "block";
				document.getElementById("p2").style.display = "none";
				document.getElementById("p3").style.display = "none";
			}

			if (pf2) {
				document.getElementById("p1").style.display = "none";
				document.getElementById("p2").style.display = "block";
				document.getElementById("p3").style.display = "none";
			}

			if (pf3) {
				document.getElementById("p1").style.display = "none";
				document.getElementById("p2").style.display = "none";
				document.getElementById("p3").style.display = "block";
			}
		}
	</script>

	<div id="wrapper">
		<c:import url="../cabecalho_funcionario.jsp"></c:import>

		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Locação</h1>
						<ol class="breadcrumb">
							<li><i class="fa fa-dashboard"></i> <a href="adm">Inicial</a>
							</li>
							<li class="active"><i class="fa fa-bar-chart-o"></i> Locação
						</ol>
					</div>
				</div>
				<div>
					<label for="opt-pf">Reserva</label> 
					<input id="opt-pf"
						checked="checked" type="radio" name="pf"
						onclick="tipoPessoaSel();"  class="radio-custom"/>&nbsp; 
						 <label id="opt-pf"  for="opt-pf" class="radio-custom-label"></label>
						
						<label for="opt-pf2">Saída</label>
					<input id="opt-pf2" type="radio" name="pf"
						onclick="tipoPessoaSel();"  class="radio-custom"/>
						<label id="opt-pf2" for="opt-pf2" class="radio-custom-label"></label>
						
						 <label for="opt-pf3">Devolução</label>
					<input id="opt-pf3" type="radio" name="pf"
						onclick="tipoPessoaSel();"  class="radio-custom"/>
						<label id="opt-pf3" for="opt-pf3" class="radio-custom-label"></label>
				</div>
				<div id="p1">
					<div>
						<c:import url="cadastraLocacaoFuncionario.jsp"></c:import>
					</div>

				</div>

				<div id="p2" style="display: none;">

					<div id="page-wrapper">
						<div class="container-fluid">
							<div class="container">
								<div class="row">
									<section>
									<form action="buscaLocacao" method="get">

										<label for="id">Digite o Cod.Reserva:</label><br />
										<div class="col-lg-5">
											<input type="text" class="form-control" name="id" value="" />
										</div>

										<div class="form-group">

											<button type="submit" class="btn btn-primary" value="Enviar"
												style="background-color: #000; height: 30px;">
												<div class="glyphicon glyphicon-search"></div>
											</button>
											<div id="resposta"></div>
										</div>
									</form>
									</section>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div id="p3" style="display: none;">

				<div id="page-wrapper">
					<div class="container-fluid">
						<div class="container">
							<div class="row">
								<section>
								<form action="devolucao" method="get">
									<label for="id">Digite o Cod.Reserva:</label><br />
										<div class="col-lg-5">
											<input type="text" class="form-control" name="id" value="" />
										</div>

									<div class="form-group">

										<button type="submit" class="btn btn-primary" value="Enviar"
											style="background-color: #000; height: 30px;">
											<div class="glyphicon glyphicon-search"></div>
										</button>
										<div id="resposta"></div>
									</div>
								</form>
								</section>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
</body>
</html>