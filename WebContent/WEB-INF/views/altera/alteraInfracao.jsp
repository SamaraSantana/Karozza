<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" type="image/jpg" href="resources/icon.png" />
<title>Infração</title>
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
                                <i class="fa fa-bar-chart-o"></i> Infração
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
					<form name="form1" class="form-horizontal"
						action="alterarInfracao" method="post">
						
						<input type="hidden" name="id" id="id" value="${infracao.id}">

						<div class="form-group">
							<label class="col-lg-3 control-label">Descrição</label>
							<div class="col-lg-8">
								<input class="form-control" id="descricao" name="descricao" type="text" value="${infracao.descricao }"/>
							</div>
						</div>


						<div class="form-group">
							<label class="col-lg-3 control-label">Gravidade</label>
							<div class="col-lg-8">
								<input class="form-control" id="gravidade" name="gravidade"
									type="text" value="${infracao.gravidade }"/>
							</div>
						</div>

						<div class="form-group">
							<label class="col-lg-3 control-label">Código</label>
							<div class="col-lg-8">
								<input class="form-control" id="codigo" name="codigo"
									type="text" value="${infracao.codigo }"/>
							</div>
						</div>

						<div class="form-group">
							<label class="col-lg-3 control-label">Pontos</label>
							<div class="col-lg-8">
								<input class="form-control" id="pontos" name="pontos"
									type="text" value="${infracao.pontos }"/>
							</div>
						</div>


						<div class="form-group">
							<label class="col-lg-3 control-label">Preço</label>
							<div class="col-lg-8">
								<input class="form-control" id="preco" name="preco" type="text" value="${infracao.preco }"/>
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