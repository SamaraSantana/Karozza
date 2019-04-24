<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Karozza rent a car</title>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>

<body>


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


	<!-- banner -->

	<div class="container">
		<div class="properties-listing spacer">

			<c:import url="alteraLocacaoFuncionario.jsp"></c:import>

		</div>
	</div>
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



