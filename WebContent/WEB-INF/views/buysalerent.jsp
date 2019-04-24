<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Karozza rent a car</title>
<meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<link rel="icon" type="image/jpg" href="resources/icon.png" />
 	<link rel="stylesheet" href="resources/assets/bootstrap/css/bootstrap.css" />
  <link rel="stylesheet" href="resources/assets/style.css"/>
  <script src="resources//jquery-1.9.1.min.js"></script>
	<script src="resources/assets/bootstrap/js/bootstrap.js"></script>
  <script src="resources/assets/script.js"></script>



<!-- Owl stylesheet -->
<link rel="stylesheet" href="resources/assets/owl-carousel/owl.carousel.css">
<link rel="stylesheet" href="resources/assets/owl-carousel/owl.theme.css">
<script src="resources/assets/owl-carousel/owl.carousel.js"></script>
<!-- Owl stylesheet -->


<!-- slitslider -->
    <link rel="stylesheet" type="text/css" href="resources/assets/slitslider/css/style.css" />
    <link rel="stylesheet" type="text/css" href="resources/assets/slitslider/css/custom.css" />
    <script type="text/javascript" src="resources/assets/slitslider/js/modernizr.custom.79639.js"></script>
    <script type="text/javascript" src="resources/assets/slitslider/js/jquery.ba-cond.min.js"></script>
    <script type="text/javascript" src="resources/assets/slitslider/js/jquery.slitslider.js"></script>
<!-- slitslider -->

<script src="resources/assets/slitslider/js/google_analytics_auto.js"></script></head>

<body>


<c:import url="cabecalho.jsp"></c:import>
<div class="inside-banner">
  <div class="container"> 
    <span class="pull-right"><a href="teste">Home</a> / Reserva</span>
    <h2>Reserva</h2>
</div>
</div>

<!-- banner -->

<div class="container">
<div class="properties-listing spacer">

<c:import url="formulario/cadastraLocacao.jsp"></c:import>


</div>
</div>




<c:import url="rodape.jsp"></c:import>


</body>
</html>



