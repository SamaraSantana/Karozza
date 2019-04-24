<!DOCTYPE html>
<html>
<head>
<meta name="description" content="Como usar charset na <meta> tag">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="description" content="Símbolos de acentos em HTML">
    <title>nenhum</title>

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
</head>

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
            'nome': {
                validators: {
                    notEmpty: {
                        message: 'Este campo é necessário.'
                    }
                }
            },
            'email': {
                validators: {
                    emailAddress: {
                        message: 'Este endereço não é valido.'
                    }
                }
            },
            'sexo': {
                validators: {
                    notEmpty: {
                        message: 'Este campo é necessário.'
                    }
                }
            },
            'arquivo': {
                validators: {
                    notEmpty: {
                        message: 'Este campo é necessário.'
                    }
                }
            },		
            'browsers[]': {
                validators: {
                    notEmpty: {
                        message: 'Este campo é necessário.'
                    }
                }
            }
        }
})
        .on('success.form.fv', function(e) {
                    $.ajax({
                        type: "POST",
                        url: "salvar.php",
                        data: $('.form-horizontal').serialize(),
                        success: function (retorno) {							
                            //$("#resposta").html(retorno);							
                            alert(retorno);						
                        },
                        error: function (retorno) {
                            alert(retorno);
                            //$("#resposta").html(retorno);
                        }
                    });
        });
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
            'nome': {
                validators: {
                    notEmpty: {
                        message: 'Este campo é necessário.'
                    }
                }
            },
            'email': {
                validators: {
                    emailAddress: {
                        message: 'Este endereço não é valido.'
                    }
                }
            },
            'sexo': {
                validators: {
                    notEmpty: {
                        message: 'Este campo é necessário.'
                    }
                }
            },
            'arquivo': {
                validators: {
                    notEmpty: {
                        message: 'Este campo é necessário.'
                    }
                }
            },		
            'browsers[]': {
                validators: {
                    notEmpty: {
                        message: 'Este campo é necessário.'
                    }
                }
            }
        }
})
        .on('success.form.fv', function(e) {
                    $.ajax({
                        type: "POST",
                        url: "salvar.php",
                        data: $('.form-horizontal').serialize(),
                        success: function (retorno) {							
                            //$("#resposta").html(retorno);							
                            alert(retorno);						
                        },
                        error: function (retorno) {
                            alert(retorno);
                            //$("#resposta").html(retorno);
                        }
                    });
        });
});
</script>
<body>
<div class="container">
    <div class="row">
        <section>
            <div class="col-lg-8 col-lg-offset-2">
                <div class="page-header">
                    <h2>Validando com FormValidation</h2>
                </div>
 
                <form id="defaultForm" method="post" class="form-horizontal">
                
                
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Nome</label>
                        <div class="col-lg-8">
                            <input class="form-control" name="nome" type="text" />
                        </div>
                    </div>    
                    
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Email</label>
                        <div class="col-lg-5">
                            <input class="form-control" name="email" type="email" />
                        </div>
                    </div>                    
                                     
                
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Sexo</label>
                        <div class="col-lg-5">
                            <div class="radio">
                                <label>
                                    <input type="radio" name="sexo" value="male" /> Masculino
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="sexo" value="female" /> Feminino
                                </label>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-lg-3 control-label">File</label>
                        <div class="col-lg-7">
                            <input type="file" class="form-control" name="arquivo" />
                            <span class="help-block">Choose a pdf file.</span>
                        </div>
                    </div>                   
 
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Browser</label>
                        <div class="col-lg-5">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="browsers[]" value="chrome" /> Google Chrome
                                </label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="browsers[]" value="firefox" /> Firefox
                                </label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="browsers[]" value="ie" /> IE
                                </label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="browsers[]" value="safari" /> Safari
                                </label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="browsers[]" value="opera" /> Opera
                                </label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="browsers[]" value="other" /> Other
                                </label>
                            </div>
                        </div>
                    </div>
 
 
                    <div class="form-group">
                        <div class="col-lg-offset-3 col-lg-3">
                            <button type="submit" class="btn btn-primary">Enviar</button>
                            <div id="resposta"> </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
    </div>
</div>
 
</body>
</html>




