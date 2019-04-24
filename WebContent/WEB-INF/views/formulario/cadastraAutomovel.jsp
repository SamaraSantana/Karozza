<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" />
<link rel="icon" type="image/jpg" href="resources/icon.png" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Automóvel</title>

 <!-- Bootstrap core CSS -->
    <link href="resources/bootstrap-3.3.6/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="resources/bootstrap-3.3.6/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

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
    
    <link rel="stylesheet" href="resources/validacao-de-formularios-bootstrap-com-form-validation/css/bootstrap.css"/>
    <link rel="stylesheet" href="../validacao-de-formularios-bootstrap-com-form-validation/css/formValidation.css"/>

    <script type="text/javascript" src="resources/validacao-de-formularios-bootstrap-com-form-validation/js/jquery.min.js"></script>
    <script type="text/javascript" src="resources/validacao-de-formularios-bootstrap-com-form-validation/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="resources/validacao-de-formularios-bootstrap-com-form-validation/js/formValidation.js"></script>
    <script type="text/javascript" src="resources/validacao-de-formularios-bootstrap-com-form-validation/js/bootstrap.js"></script>
  
<script type="text/javascript">
$(document).ready(function() {
    $('.form-horizontal').formValidation({
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        err: {
            container: 'tooltip'
        },
		
        fields: {
            'marca': {
                validators: {
                    notEmpty: {
                        message: 'Este campo é necessário.'
                    }
                }
            },
            'modelo': {
                validators: {
                   notEmpty: {
                        message: 'Este campo é necessário.'
                    }
                }
            },
            'ano': {
                validators: {
                    notEmpty: {
                        message: 'Este campo é necessário.'
                    }
                }
            },
            
            'motor': {
                validators: {
                    notEmpty: {
                        message: 'Este campo é necessário.'
                    }
                }
            },
            'transmissao': {
                validators: {
                    notEmpty: {
                        message: 'Este campo é necessário.'
                    }
                }
            },
            'bombaCombustivel': {
                validators: {
                    notEmpty: {
                        message: 'Este campo é necessário.'
                    }
                }
            },
            'grupo': {
                validators: {
                    notEmpty: {
                        message: 'Este campo é necessário.'
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
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        err: {
            container: 'tooltip'
        },
		
        fields: {
            'marca': {
                validators: {
                    notEmpty: {
                        message: 'Este campo é necessário.'
                    }
                }
            },
            'modelo': {
                validators: {
                    notEmpty: {
                        message: 'Este campo é necessário.'
                    }
                }
            },
            'ano': {
                validators: {
                    notEmpty: {
                        message: 'Este campo é necessário.'
                    }
                }
            },		
            'motor': {
                validators: {
                    notEmpty: {
                        message: 'Este campo é necessário.'
                    }
                }
            },
            'transmissao': {
                validators: {
                    notEmpty: {
                        message: 'Este campo é necessário.'
                    }
                }
            },
            'bombaCombustivel': {
                validators: {
                    notEmpty: {
                        message: 'Este campo é necessário.'
                    }
                }
            },
            'grupo': {
                validators: {
                    notEmpty: {
                        message: 'Este campo é necessário.'
                    }
                }
            },
        }
})
       
});
</script>

 <script language='JavaScript'>
function SomenteNumero(e){
    var tecla=(window.event)?event.keyCode:e.which;   
    if((tecla>47 && tecla<58)) return true;
    else{
    	if (tecla==8 || tecla==0) return true;
	else  return false;
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
                        <h1 class="page-header">
                           Automovel
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="adm">Inicial</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-automobile "></i> Automoveis
                        </ol>
                    </div>
                </div>
<div class="container">
    <div class="row">
        <section>
 
<form name="form1"  class="form-horizontal"  action="adicionaAutomovel" method="post"  >

   <div class="form-group">
                        <label class="col-lg-3 control-label">Marca</label>
                        <div class="col-lg-6">
                            <input class="form-control" id="marca" name="marca" type="text" />
                        </div>
                    </div>    
       
     
         <div class="form-group">
                        <label class="col-lg-3 control-label">Modelo</label>
                        <div class="col-lg-6">
                            <input class="form-control" id="modelo" name="modelo" type="text" />
                        </div>
                    </div>    
       
     

         <div class="form-group">
                        <label class="col-lg-3 control-label">Ano</label>
                        <div class="col-lg-6">
                            <input class="form-control" onkeypress='return SomenteNumero(event)' id="ano" name="ano" type="text" />
                        </div>
                    </div>    
        
         <div class="form-group">
                        <label class="col-lg-3 control-label">Motor</label>
                        <div class="col-lg-6">
                            <input class="form-control" onkeypress='return SomenteNumero(event)' id="motor" name="motor" type="text" />
                        </div>
                    </div>    
       
     
         <div class="form-group">
                        <label class="col-lg-3 control-label">Tranasmissão</label>
                        <div class="col-lg-6">
                            <input class="form-control" id="transmissao" name="transmissao" type="text" />
                        </div>
                    </div>    
       
     
        
         <div class="form-group">
                        <label class="col-lg-3 control-label">Bomba de combustivel</label>
                        <div class="col-lg-6">
                            <input class="form-control" id="bombaCombustivel" name="bombaCombustivel" type="text" />
                        </div>
                    </div>    
       
     

        <div class="form-group">
                        <label class="col-lg-3 control-label">Grupo</label>
                        <div class="col-lg-6">
		<select class="form-control" class="grupo" name="grupo">
		<option disabled="disabled" selected="selected">Selecione</option>
		<c:forEach items="${grupo}" var="grupo">
		<option value="${grupo.id}">${grupo.nome}</option>
		
		</c:forEach>
		</select>

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
</div>

</div>


</body>
</html>