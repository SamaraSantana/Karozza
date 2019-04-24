<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

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

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="adm">Karozza rent a car</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
               
                       
                
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${funcionarioLogado.nome } <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                       
                        
                        <li>
                            <a href="sair"><i class="fa fa-fw fa-power-off"></i> Sair</a>
                        </li>
                    </ul>
                </li>
            </ul>
            
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active">
                        <a href="adm"><i class="fa fa-fw fa-dashboard"></i> Inicial</a>
                    </li>
                   
               
                 
                    
                    
                    <c:if test="${funcionarioLogado.tipo == 'administradorMatriz' }">
                    <!-- Cadastros -->
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-edit"></i> Cadastros<i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                <a href="novoAutomovel">Cadastro de Automóvel</a>
                            </li>
                            <li>
                                <a href="novoExemplar">Cadastro de Exemplar</a>
                            </li>
                            <li>
                                <a href="novoFuncionario">Cadastro de Funcionário</a>
                            </li>
                             <li>
                                <a href="novoGrupo"> Cadastro de Grupo</a>
                            </li>
                             <li>
                                <a href="novaInfracao">Cadastro de Infração</a>
                            </li>
                             <li>
                                <a href="novaMulta"> Cadastro de Multa</a>
                            </li>
                            <li>
                                <a href="novaLoja"> Cadastro de Loja</a>
                            </li>
                            <li>
                                <a href="novaProtecao"> Cadastro de Proteção</a>
                            </li>
                            <li>
                                <a href="novoOpcional"> Cadastro de Opcional</a>
                            </li>
                           
                        </ul>
                    </li>
                    </c:if>
                    
                    <c:if test="${funcionarioLogado.tipo == 'administradorFilial' or funcionarioLogado.tipo == 'atendente'  }">
                    <!-- Listas -->
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#listas"><i class="fa fa-fw fa-table"></i> Listas <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="listas" class="collapse">
                            
                          
                            <li>
                                <a href="listaCliente">Lista de Clientes</a>
                            </li>
          
                            <li>
                                <a href="listaLocacao2">Lista de Locações</a>
                            </li>
          
                    </ul>
                    </li>
                    </c:if>
                    
                    <c:if test="${funcionarioLogado.tipo == 'administradorMatriz' }">
                    <!-- Listas -->
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#listas"><i class="fa fa-fw fa-table"></i> Listas <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="listas" class="collapse">
                            
                            <li>
                                <a href="listaExemplar">Lista de Exemplares</a>
                            </li>
                            <li>
                                <a href="listaCliente">Lista de Clientes</a>
                            </li>
          
                            <li>
                                <a href="listaLocacao2">Lista de Locações</a>
                            </li>
                            <li>
                                <a href="listaFuncionario">Lista de Funcionários</a>
                            </li>
                    
                            <li>
                                <a href="listaGrupo">Lista de Grupos</a>
                            </li>
                     
                            <li>
                                <a href="listaInfracao">Lista de Infrações</a>
                        
                            <li>
                                <a href="listaMulta">Lista de Multas</a>
                            </li>
                      
                            <li>
                                <a href="listaLoja">Lista de Lojas</a>
                            </li>
                   
                            <li>
                                <a href="listaOpcional">Lista de Opcionais</a>
                            </li>
                    
                            <li>
                                <a href="listaProtecao">Lista de Proteções</a>
                            </li>
                             <li>
                                <a href="listaAutomovel">Lista de Automóveis</a>
                            </li>
                             </ul>
                    </li>
                       
                       </c:if>
                       
                         <!-- ListaNegra -->
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#listaNegra"><i class="fa fa-fw fa-table"></i> Lista negra<i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="listaNegra" class="collapse">
                             
                    <li>
                        <a href="listarListaNegra"><i class="fa fa-fw fa-table"></i> Lista Negra</a>
                    </li>
                    </ul>
                    </li>
                    
                    <c:if test="${funcionarioLogado.tipo == 'atendente' or funcionarioLogado.tipo == 'administradorFilial' }">
                    
                          <!-- Aluguel-->
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#aluguel"><i class="fa fa-fw fa-edit"></i> Aluguel<i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="aluguel" class="collapse">
                             
                    <li>
                        <a href="aluguel"><i class="fa fa-fw fa-edit"></i> Aluguel</a>
                    </li>
                    </ul>
                    </li>
                    </c:if>
                    
                          <!-- Relatorios-->
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#chart1"><i class="fa fa-fw fa-bar-chart-o"></i> Relatórios<i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="chart1" class="collapse">
                             
                    <li>
                        <a href="chart1"><i class="fa fa-fw fa-bar-chart-o"></i> Locações feitas</a>
                    </li>
                    <li>
                        <a href="chart2"><i class="fa fa-fw fa-bar-chart-o"></i> Locaçoes info</a>
                    </li>
                    <li>
                        <a href="chart3"><i class="fa fa-fw fa-bar-chart-o"></i> Veiculos</a>
                    </li>
                    <li>
                        <a href="chart4"><i class="fa fa-fw fa-bar-chart-o"></i> Quantidade de locações por Matriz e Filial</a>
                    </li>
                    <li>
                        <a href="chart5"><i class="fa fa-fw fa-bar-chart-o"></i> Ranking de uso</a>
                    </li>
                    </ul>
                    </li>
                 
               </ul>
               </div>
               
            <!-- /.navbar-collapse -->
        </nav>
        </div>
        
</body>
</html>