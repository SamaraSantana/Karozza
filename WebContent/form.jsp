<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>Insert title here</title>

<body>

<script type="text/javascript">
window.print() 
</script>
</head>

<div class="container">
  <h2>Horizontal form</h2>
  <form class="form-horizontal" role="form">
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">Email:</label>
      <div class="col-sm-10">
        <input type="email" class="form-control" id="email" placeholder="Enter email">
      </div>
    </div>
  
   <div class="form-group">
      <label class="control-label col-sm-2" for="email">Email:</label>
      <div class="col-sm-10">
        <input type="date" class="form-control" id="email" placeholder="Enter email">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <div class="checkbox">
          <label><input type="checkbox"> Remember me</label>
        </div>
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default">Submit</button>
      </div>
    </div>
    
    <!-- 
    <input type="button" name="imprimir" value="Imprimir" onclick="window.print();">
  	
 -->

  </form>
</div>

<ul class="nav nav-pills">
  <li class="ola"><a href="#ola" data-toggle="tab">Ola</a></li>
  <li><a href="#profile" data-toggle="tab">Profile</a></li>
  <li><a href="#messages" data-toggle="tab">Messages</a></li>
</ul>

<div id='content' class="tab-content">
    <div class="tab-pane active" id="ola">
        Nome: <input/><br/>
        	
        <button class="next">Próximo</button>
    </div>
    <div class="tab-pane" id="profile">
        CPF: <input/><br/>
        <button class="prev">Anterior</button>
        <button class="next">Próximo</button>
    </div>
    <div class="tab-pane" id="messages">
        <button class="prev">Anterior</button>
        <button class="save">Salvar</button>
    </div>
</div>

<script type="text/javascript">
$(document).ready(function() {
    /*disable non active tabs*/
    $('.nav li').not('.ola').addClass('disabled');
    $('.nav li').not('.ola').find('a').removeAttr("data-toggle");

    $('button.next').click(function(){
        /*enable next tab*/
        $('.nav li.ola').next('li').removeClass('disabled');
        $('.nav li.ola').next('li').find('a').attr("data-toggle","tab").trigger("click");
    });

    $('button.prev').click(function() {
        $('.nav li.ola').prev('li').find('a').trigger("click");
    });
});
</script>

</body>
</html>