<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>Karozza rent a car</title>

<link rel="icon" type="image/jpg" href="resources/icon.png" />


<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet"
	href="resources/assets/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="resources/assets/style.css" />
<script src="resources/code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="resources/assets/bootstrap/js/bootstrap.js"></script>
<script src="resources/assets/script.js"></script>



<!-- Owl stylesheet -->
<link rel="stylesheet"
	href="resources/assets/owl-carousel/owl.carousel.css">
<link rel="stylesheet"
	href="resources/assets/owl-carousel/owl.theme.css">
<script src="resources/assets/owl-carousel/owl.carousel.js"></script>
<!-- Owl stylesheet -->


<!-- slitslider -->
<link rel="stylesheet" type="text/css"
	href="resources/assets/slitslider/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="resources/assets/slitslider/css/custom.css" />
<script type="text/javascript"
	src="resources/assets/slitslider/js/modernizr.custom.79639.js"></script>
<script type="text/javascript"
	src="resources/assets/slitslider/js/jquery.ba-cond.min.js"></script>
<script type="text/javascript"
	src="resources/assets/slitslider/js/jquery.slitslider.js"></script>
<!-- slitslider -->

<script src="resources/assets/slitslider/js/google_analytics_auto.js"></script>
</head>


<script>
function checa(){    
	if (this.form1.cpf.value!=""){         
		this.form1.submit();   
		}else{        
			alert("o campo CPF não pode ficar vazio");}
	
	}if(this.form1.id.value!=""){         
		this.form1.submit();   
	}else{        
		alert("o campo id não pode ficar vazio");}


	
			</script>
			
<body>


	<c:import url="cabecalho.jsp"></c:import>
	<div class="">


		<div id="slider" class="sl-slider-wrapper">

			<div class="sl-slider">

				<div class="sl-slide" data-orientation="horizontal"
					data-slice1-rotation="-25" data-slice2-rotation="-25"
					data-slice1-scale="2" data-slice2-scale="2">
					<div class="sl-slide-inner">
						<div class="bg-img bg-img-1"></div>
						<h2>
							<a href="carrosKarozza">Carros de luxo - Audi e BMW</a>
						</h2>
						<blockquote>
							<p class="location">
								<span class="glyphicon glyphicon-map-marker"></span>  Karozza rent a car
							</p>
							<p>A partir de:</p>
							<cite>R$ 400,00</cite>
						</blockquote>
					</div>
				</div>

				<div class="sl-slide" data-orientation="vertical"
					data-slice1-rotation="10" data-slice2-rotation="-15"
					data-slice1-scale="1.5" data-slice2-scale="1.5">
					<div class="sl-slide-inner">
						<div class="bg-img bg-img-2"></div>
						<h2>
							<a href="carrosKarozza">Carros com freio ABS, direção Hidraulíca </a>
						</h2>
						<blockquote>
							<p class="location">
								<span class="glyphicon glyphicon-map-marker"></span> Karozza rent a car
							</p>
						<p>Faça sua reserva por apenas:</p>
							<cite>R$ 69,90</cite>
						</blockquote>
					</div>
				</div>

				<div class="sl-slide" data-orientation="horizontal"
					data-slice1-rotation="3" data-slice2-rotation="3"
					data-slice1-scale="2" data-slice2-scale="1">
					<div class="sl-slide-inner">
						<div class="bg-img bg-img-3"></div>
						<h2>
							<a href="carrosKarozza">Carros para todos os gostos e estilo</a>
						</h2>
						<blockquote>
							<p class="location">
								<span class="glyphicon glyphicon-map-marker"></span>  Karozza rent a car
							</p>
							<p>Faça umar reserva a partir de:</p>
							<cite>R$ 69,90</cite>
						</blockquote>
					</div>
				</div>

				<div class="sl-slide" data-orientation="vertical"
					data-slice1-rotation="-5" data-slice2-rotation="25"
					data-slice1-scale="2" data-slice2-scale="1">
					<div class="sl-slide-inner">
						<div class="bg-img bg-img-4"></div>
						<h2>
							<a href="carrosKarozza">Grupo A - Econômico </a>
						</h2>
						<blockquote>
							<p class="location">
								<span class="glyphicon glyphicon-map-marker"></span>  Karozza rent a car
							</p>
							<p>Arraial de promoção por apenas:</p>
							<cite>R$ 69,90</cite>
						</blockquote>
					</div>
				</div>

				
			</div>
			<!-- /sl-slider -->



			<nav id="nav-dots" class="nav-dots">
				<span class="nav-dot-current"></span> <span></span> <span></span> <span></span>
				<span></span>
			</nav>

		</div>
		<!-- /slider-wrapper -->
	</div>



	<div class="banner-search">
		<c:import url="calendario.jsp"></c:import>
	</div>
	<!-- banner -->
	<div class="container">
	
		<div class="properties-listing spacer">
			<a href="carrosKarozza" class="pull-right viewall">
				Ver todos</a>
			<h2>Modelos de carros</h2>
			<div id="owl-example" class="owl-carousel">
				<div class="properties">
					<div class="image-holder">
						<img src="resources/images/properties/grupo-a.jpg"
							class="img-responsive" alt="properties" />
						<div class="status new">Promoção</div>

					</div>
					<h4>
						<a href="carrosKarozza">Grupo A - Econômico</a>
					</h4>
					<br>
					<p class="price">Preço: R$69,90</p>
					<br>
					<a class="btn btn-primary" href="carrosKarozza">Ver
						detalhes</a>
				</div>
				<div class="properties">
					<div class="image-holder">
						<img src="resources/images/properties/grupo-b.jpg"
							class="img-responsive" alt="properties" />

					</div>
					<h4>
						<a href="carrosKarozza">Grupo B - Econômico com ar </a>
					</h4>
					
					<p class="price">Preço: R$80,00</p>
					<br>
					<a class="btn btn-primary" href="carrosKarozza">Ver
						detalhes</a>
				</div>
				<div class="properties">
					<div class="image-holder">
						<img src="resources/images/properties/grupo-bx.jpg"
							class="img-responsive" alt="properties" />
						<div class="status sold">Novo</div>
					</div>
					<h4>
						<a href="carrosKarozza">Grupo BX - Econômico plus com ar</a>
					</h4>
					<p class="price">Preço: R$90,00</p>
					<br>
					<a class="btn btn-primary" href="carrosKarozza">Ver
						detalhes</a>
				</div>
				<div class="properties">
					<div class="image-holder">
						<img src="resources/images/properties/grupo-c.jpg"
							class="img-responsive" alt="properties" />
					</div>
					<h4>
						<a href="carrosKarozza">Grupo C - Compact</a>
					</h4>
					<br>
					<p class="price">Preço: R$100,90</p>
					<br>
					<a class="btn btn-primary" href="carrosKarozza">Ver
						detalhes</a>
				</div>
				<div class="properties">
					<div class="image-holder">
						<img src="resources/images/properties/grupo-f.jpg"
							class="img-responsive" alt="properties" />
					</div>
					<h4>
						<a href="carrosKarozza">Grupo F - Sedan Compacto S</a>
					</h4>
					<p class="price">Preço: R$110,00</p>
					<br>
					<a class="btn btn-primary" href="carrosKarozza">Ver
						detalhes</a>
				</div>
				<div class="properties">
					<div class="image-holder">
						<img src="resources/images/properties/grupo-fx.jpg"
							class="img-responsive" alt="properties" />
						<div class="status sold">Novo</div>
					</div>
					<h4>
						<a href="carrosKarozza">Grupo FX - Sedan automático</a>
					</h4>
					<p class="price">Preço: R$130,27</p>
					<br>
					<a class="btn btn-primary" href="carrosKarozza">Ver
						detalhes</a>
				</div>
				<div class="properties">
					<div class="image-holder">
						<img src="resources/images/properties/grupo-g.jpg"
							class="img-responsive" alt="properties" />
						<div class="status sold">Novo</div>
					</div>
					<h4>
						<a href="carrosKarozza">Grupo G - Suv manual</a>
					</h4>
					<br>
					<p class="price">Preço: R$205,90</p>
					<br>
					<a class="btn btn-primary" href="carrosKarozza">Ver
						detalhes</a>
				</div>
				<div class="properties">
					<div class="image-holder">
						<img src="resources/images/properties/grupo-h.jpg"
							class="img-responsive" alt="properties" />
					</div>
					<h4>
						<a href="carrosKarozza">Grupo H - Suv automática</a>
					</h4>
					<p class="price">Preço: R$215,90</p>
					<br>
					<a class="btn btn-primary" href="carrosKarozza">Ver
						detalhes</a>
				</div>
				<div class="properties">
					<div class="image-holder">
						<img src="resources/images/properties/grupo-j.jpg"
							class="img-responsive" alt="properties" />
					</div>
					<h4>
						<a href="carrosKarozza">Grupo J - Minivan</a>
					</h4>
					<br>
					<p class="price">Preço: R$218,90</p>
					<br>
					<a class="btn btn-primary" href="carrosKarozza">Ver
						detalhes</a>
				</div>
				<div class="properties">
					<div class="image-holder">
						<img src="resources/images/properties/grupo-k.jpg"
							class="img-responsive" alt="properties" />
						<div class="status sold">Novo</div>
					</div>
					<h4>
						<a href="carrosKarozza">Grupo K - Minivan automática</a>
					</h4>
					<p class="price">Preço: R$264,00</p>
					<br>
					<a class="btn btn-primary" href="carrosKarozza">Ver
						detalhes</a>
				</div>
				<div class="properties">
					<div class="image-holder">
						<img src="resources/images/properties/grupo-l.jpg"
							class="img-responsive" alt="properties" />
					</div>
					<h4>
						<a href="carrosKarozza">Grupo L - Mini PICK-UP</a>
					</h4>
			
					<p class="price">Preço: R$234,900</p>
					<br>
					<a class="btn btn-primary" href="carrosKarozza">Ver
						detalhes</a>
				</div>

				<div class="properties">
					<div class="image-holder">
						<img src="resources/images/properties/grupo-m.jpg"
							class="img-responsive" alt="properties" />
						<div class="status sold">Novo</div>
					</div>
					<h4>
						<a href="carrosKarozza">Grupo M - Furgão</a>
					</h4>
					<br>
					<p class="price">Preço: R$234,900</p>
					<br>
					<a class="btn btn-primary" href="carrosKarozza">Ver
						detalhes</a>
				</div>
				<div class="properties">
					<div class="image-holder">
						<img src="resources/images/properties/grupo-q.jpg"
							class="img-responsive" alt="properties" />
					</div>
					<h4>
						<a href="carrosKarozza">Grupo Q - Executivo automático</a>
					</h4>
					<p class="price">Preço: R$264,55</p>
					<br>
					<a class="btn btn-primary" href="carrosKarozza">Ver
						detalhes</a>
				</div>
				<div class="properties">
					<div class="image-holder">
						<img src="resources/images/properties/grupo-s.jpg"
							class="img-responsive" alt="properties" />
						<div class="status sold">Novo</div>
					</div>
					<h4>
						<a href="carrosKarozza">Grupo S - Caminhonete</a>
					</h4>
					<br>
					<p class="price">Preço: R$284,90</p>
					<br>
					<a class="btn btn-primary" href="carrosKarozza">Ver
						detalhes</a>
				</div>
				<div class="properties">
					<div class="image-holder">
						<img src="resources/images/properties/grupo-t.jpg"
							class="img-responsive" alt="properties" />
						<div class="status sold">Novo</div>
					</div>
					<h4>
						<a href="carrosKarozza">Grupo T - Luxo blindado</a>
					</h4>
				
					<p class="price">Preço: R400,00</p>
					<br>
					<a class="btn btn-primary" href="carrosKarozza">Ver
						detalhes</a>
				</div>
				<div class="properties">
					<div class="image-holder">
						<img src="resources/images/properties/grupo-v.jpg"
							class="img-responsive" alt="properties" />
					</div>
					<h4>
						<a href="carrosKarozza">Grupo V - Van luxo</a>
					</h4>
					<br>
					<p class="price">Preço: R$360,00</p>
					<br>
					<a class="btn btn-primary" href="carrosKarozza">Ver
						detalhes</a>
				</div>
				<div class="properties">
					<div class="image-holder">
						<img src="resources/images/properties/grupo-w.jpg"
							class="img-responsive" alt="properties" />
					</div>
					<h4>
						<a href="carrosKarozza">Grupo W - Luxo automático</a>
					</h4>
					<p class="price">Preço: R$379,90</p>
					<br>
					<a class="btn btn-primary" href="carrosKarozza">Ver
						detalhes</a>
				</div>
				<div class="properties">
					<div class="image-holder">
						<img src="resources/images/properties/grupo-z.jpg"
							class="img-responsive" alt="properties" />
					</div>
					<h4>
						<a href="carrosKarozza">Grupo Z - Karozza experience</a>
					</h4>
					<p class="price">Preço: R$480,50</p>
					<br>
					<a class="btn btn-primary" href="carrosKarozza">Ver
						detalhes</a>
				</div>
				<div class="properties">
					<div class="image-holder">
						<img src="resources/images/properties/grupo-zx.jpg"
							class="img-responsive" alt="properties" />
						<div class="status sold">Novo</div>
					</div>
					<h4>
						<a href="carrosKarozza">Grupo ZX - Karozza experience</a>
					</h4>
					<p class="price">Preço: R$560,90</p>
					<br>
					<a class="btn btn-primary" href="carrosKarozza">Ver
						detalhes</a>
				</div>
			</div>
		</div>
		<div class="spacer">
			<div class="row">
				<div class="col-lg-6 col-sm-9 recent-view">
					<h3>Sobre nós</h3>
					<p>
						É possível alugar um carro através de nosso site que alia tecnologia de recursos
						 e um visual funcional para que sua navegação seja fácil e precisa. 
						 Esta eficiência se reflete em todo o processo, desde a coleta de informações até a emissão de reservas .<br>
						<a href="sobreNos">Ler mais</a>
					</p>

				</div>
				<div class="col-lg-5 col-lg-offset-1 col-sm-3 recommended">
					<h3>Grupos na promoção</h3>
					<div id="myCarousel" class="carousel slide">
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1" class=""></li>
							<li data-target="#myCarousel" data-slide-to="2" class=""></li>
							<li data-target="#myCarousel" data-slide-to="3" class=""></li>
						</ol>
						<!-- Carousel items -->
						<div class="carousel-inner">
							<div class="item active">
								<div class="row">
									<div class="col-lg-4">
										<img src="resources/images/properties/grupo-a.jpg"
											class="img-responsive" alt="properties" />
									</div>
									<div class="col-lg-8">
										<h5>
											<a href="carrosKarozza">Grupo A - Econômico</a>
										</h5>
										<p class="price">R$69,90</p>
										<a href="carrosKarozza" class="more">Mais detalhes</a>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="row">
									<div class="col-lg-4">
										<img src="resources/images/properties/grupo-t.jpg"
											class="img-responsive" alt="properties" />
									</div>
									<div class="col-lg-8">
										<h5>
											<a href="carrosKarozza">Grupo T</a>
										</h5>
										<p class="price">Preço: R400,00</p>
										<a href="carrosKarozza" class="more">Mais detalhes</a>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="row">
									<div class="col-lg-4">
										<img src="resources/images/properties/grupo-z.jpg"
											class="img-responsive" alt="properties" />
									</div>
									<div class="col-lg-8">
										<h5>
											<a href="carrosKarozza">Grupo Z</a>
										</h5>
										<p class="price">R$480,50</p>
										<a href="carrosKarozza" class="more">Mais detalhes</a>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="row">
									<div class="col-lg-4">
										<img src="resources/images/properties/grupo-zx.jpg"
											class="img-responsive" alt="properties" />
									</div>
									<div class="col-lg-8">
										<h5>
											<a href="carrosKarozza">Grupo ZX</a>
										</h5>
										<p class="price">Preço: R$560,90</p>
										<a href="carrosKarozza" class="more">Mais detalhes</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


<c:import url="rodape.jsp"></c:import>
	

	<!-- Modal -->
	<div id="loginpop" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="row">
					<div class="col-sm-6 login">
						<h4>Consultar Reserva</h4>
						<form name="form1"  action="efetuaLogin" method="post">
							
							<div class="form-group">
								<label class="sr-only" for="reserva">Código da Reserva</label>
								<input type="text" class="form-control"
									id="id" name="id" placeholder="Cód" required="required">
							</div>
							
							<div class="form-group">
								<label class="sr-only" for="cpf">CPF</label>
								<input type="password" class="form-control"
									id="cpf" name="cpf" placeholder="Cpf" required="required">
							</div>
							<div class="checkbox">
								<label> <input type="checkbox"> Lembrar-me
								</label>
							</div>
							<button type="submit" class="btn btn-success" >Logar</button>
						</form>
					</div>
					<div class="col-sm-6">
						<img src="resources/menor_logo2.png"    style="margin-top: 50px;margin-left: 20px;"         class="img-responsive" alt="properties" >
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- /.modal -->
</body>
</html>



