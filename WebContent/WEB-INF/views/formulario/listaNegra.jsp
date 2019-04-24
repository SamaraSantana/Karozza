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
<title>Lista Negra</title>

<link rel="icon" type="image/jpg" href="resources/icon.png" />
    <!-- Bootstrap Core CSS -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="resources/css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="resources/css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
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
Lista negra                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="adm">Inicial</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-automobile "></i> Lista negra
                        </ol>
                    </div>
                </div>
<form name="form1" class="form-horizontal"  action="adicionaNaListaNegra" method="get">


      
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Motivo</label>
                        <div class="col-lg-5">
                            <input class="form-control" id="motivo" name="motivo" type="text" />
                        </div>
                    </div>    
       
                     
      <div class="form-group">
                        <label class="col-lg-3 control-label">Loja</label>
                        <div class="col-lg-5">
       
		<select class="form-control" class="loja" name="loja">
		<c:forEach items="${loja}" var="loja">
		<option value="${loja.id}">${loja.bairro}</option>
		</c:forEach>
		</select>
		
		<input type="hidden" name="cliente" id="cliente" value="${cliente.id}">
		
</div>
</div>
      
 
 
<div class="form-group">
                        <div class="col-lg-offset-3 col-lg-3">
                            <button type="submit" class="btn btn-primary" value="Enviar" >Enviar</button>
                            <div id="resposta"> </div>
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