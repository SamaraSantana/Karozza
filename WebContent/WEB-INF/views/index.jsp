<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="pt-br">
<link rel="icon" type="image/jpg" href="resources/icon.png" />

<head>
<meta name="description" content="relatorio" />

<script type="text/javascript">
        var randomnb = function(){ return Math.round(Math.random()*300)};
    </script>
    
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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

   <title>Karroza rent a car - System</title>
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

<body>

      <div id="wrapper">
   <c:import url="cabecalho_funcionario.jsp"></c:import>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Inicial <small>Resumo do sistema</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> Inicial
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

              

                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-tags fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">${ exemplaresAlugados}</div>
                                        <div>Alugados!</div>
                                    </div>
                                </div>
                            </div>
                            
                                <div class="panel-footer">
                                   
                                    <div class="clearfix"></div>
                                </div>
                       
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-wrench	fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">${ exemplaresManutencao}</div>
                                        <div>Manutenção!</div>
                                    </div>
                                </div>
                            </div>
                            
                                <div class="panel-footer">
                                   
                                    <div class="clearfix"></div>
                                </div>
                            
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-automobile fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge"> ${exemplaresDisponiveis}</div>
                                        <div>Disponíveis!</div>
                                    </div>
                                </div>
                            </div>
                            
                                <div class="panel-footer">
                                    
                                    <div class="clearfix"></div>
                                </div>
                         
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-red">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-calendar fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">${ locacoesHoje}</div>
                                        <div>Reservas pra hoje!</div>
                                    </div>
                                </div>
                            </div>
                           
                                <div class="panel-footer">
                                    
                                    <div class="clearfix"></div>
                                </div>
                           
                        </div>
                    </div>
                </div>
                <!-- /.row -->

              

    <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> Relatório por mês</h3>
                            </div>
                            <div class="panel-body">
                            
    <div class="box">

        <h1>Quantidade de Locações feitas por mês</h1>

        <div class="box-chart">
                               <canvas id="GraficoBarra" style="width:100%;"></canvas>
                               </div>
                               </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-long-arrow-right fa-fw"></i> Ranking de Uso</h3>
                            </div>
                            <div class="panel-body">
                               
                               
                               
                               <div class="box" >

		<h1>Ranking de Uso</h1>
		<small>Veiculo mais usado (Matriz): ${veiculoMatriz}</small></br>
		<small>Veiculo mais usado (Filial): ${veiculoFilial}</small>

		<div class="box-chart">

			<canvas id="GraficoPizza" style="width:10%;"></canvas>

	

		</div>

	</div>
	
                              
                            </div>
                        </div>
                    </div>
                    
                  
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="resources/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resources/js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="resources/js/plugins/morris/raphael.min.js"></script>
    <script src="resources/js/plugins/morris/morris.min.js"></script>
    <script src="resources/js/plugins/morris/morris-data.js"></script>



<script type="text/javascript">                                        

                var options = {
                    responsive:true
                };

                var data = {
                    labels: ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"],
                    datasets: [
                        {
                            label: "Dados primários",
                            fillColor: "#FF4500",
                            strokeColor: "##FF4500",
                            highlightFill: "##FF4500",
                            highlightStroke: "#FF4500",
                            data: ['${janeiro}', '${fevereiro}', '${marco}', '${abril}', '${maio}', '${junho}', '${julho}', '${agosto}', '${setembro}', '${outubro}', '${novembro}', '${dezembro}']
                        }
                    ]
                };   
                
                var options2 = {
                        responsive:true
                    };

                    var data2 = [
                        {
                            value: ${usoVeiculoMatriz},
                            color:"#F7464A",
                            highlight: "#FF5A5E",
                            label: "Quantidade de Veiculo mais usado na Matriz"
                        },
                        
                        {
                            value: ${usoVeiculoFilial},
                            color:"#46BFBD",
                            highlight: "#5AD3D1",
                            label: "Quantidade de Veiculo mais usado na Filial"
                        }
                    ];
                    

                window.onload = function(){
                    var ctx = document.getElementById("GraficoBarra").getContext("2d");
                    var BarChart = new Chart(ctx).Bar(data, options);
                    
                    var ctx2 = document.getElementById("GraficoPizza").getContext("2d");
                    var PizzaChart = new Chart(ctx2).Pie(data2, options2);
                }           
            </script>



        
    
</body>

</html>