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
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <title>Karozza rent a car</title>
     <link href="resources/geral.css" rel="stylesheet">

    <script src="resources/chart/Chart.min.js"></script>

    <style type="text/css">
 *{
          
    }

    .box {
        margin: 0px auto;
        width: 70%;
    }

    .box-chart {
        width: 100%;
        margin: 0 auto;
        padding: 10px;
    }

    </style>  

    <script type="text/javascript">
        var randomnb = function(){ return Math.round(Math.random()*300)};
    </script>  

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
                        Relatórios
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="adm">Inicial</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-bar-chart-o"></i> Relatórios
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                
 
   
        
    <div class="box">

        <h1>Locacões</h1>

        <div class="box-chart">

            <canvas id="GraficoPizza" style="width:100%;"></canvas>

            <script type="text/javascript">

                var options = {
                    responsive:true
                };

                var data = [
                    {
                        value: ${naoEntregue},
                        color:"#F7464A",
                        highlight: "#FF5A5E",
                        label: "Veículos não Entregues na Data Prevista"
                    },
                    {
                        value: ${entregue},
                        color: "#46BFBD",
                        highlight: "#5AD3D1",
                        label: "Veículos Entregues na Data Prevista"
                    },
                    {
                        value: ${entregueHoje},
                        color: "#FDB45C",
                        highlight: "#FFC870",
                        label: "Veículos a serem Entregues na Data Atual"
                    }
                ]
                
                window.onload = function(){

                    var ctx = document.getElementById("GraficoPizza").getContext("2d");
                    var PizzaChart = new Chart(ctx).Pie(data, options);
                }  
            </script> 

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