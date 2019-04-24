<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Validar CNPJ - Validador de CNPJ Online</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description"
	content="Acesse este validador de CNPJ online que permite a você validar CNPJ 's em poucos segundos." />
<meta name="language" content="PT-BR" />
<link rel="canonical" href="http://www.geradorcnpj.com/validar-cnpj.htm" />
<link rel="stylesheet" href="http://www.geradorcnpj.com/estilo.css" />
<script src="http://www.geradorcnpj.com/scripts.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="http://www.geradorcnpj.com/jquery-1.2.6.pack.js"></script>
<script type="text/javascript"
	src="http://www.geradorcnpj.com/jquery.maskedinput-1.1.4.pack.js" /></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#cnpj").mask("99.999.999/9999-99");
						$("#botaoValidarCNPJ")
								.click(
										function() {
											if ($("#cnpj").val() == '') {
												$("#saida").html(
														"Informe um CNPJ");
												return false;
											}
											if (validarCNPJ($("#cnpj").val())) {
												$("#saida")
														.html(
																"<span style='color: green'>CNPJ Válido!</span>");
											} else {
												$("#saida")
														.html(
																"<span style='color: red'>CNPJ Inválido!</span>");
											}
										});
					});
</script>
</head>
<body>
	<script>
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})(window, document, 'script',
				'//www.google-analytics.com/analytics.js', 'ga');

		ga('create', 'UA-17536895-19', 'auto');
		ga('send', 'pageview');
	</script>
	<div id="fb-root"></div>
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/pt_BR/all.js#xfbml=1";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>
	<table width="931" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td width="320" height="270" valign="top">
				<div align="left">
					<br />
					<script async
						src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
					<!-- Gerador-CNPJ-300x600 (1) -->
					<ins class="adsbygoogle"
						style="display: inline-block; width: 300px; height: 600px"
						data-ad-client="ca-pub-9618177229895113" data-ad-slot="4598486312"></ins>
					<script>
						(adsbygoogle = window.adsbygoogle || []).push({});
					</script>
				</div>
			</td>
			<td width="571" valign="top"><table width="100%" border="0"
					cellspacing="0" cellpadding="0">
					<tr>
						<td height="270" valign="top"
							background="http://www.geradorcnpj.com/img/janela_topo.gif"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="4%" height="33"></td>
									<td width="86%"></td>
									<td width="10%"></td>
								</tr>
								<tr>
									<td height="63"></td>
									<td><h1>Validar CNPJ</h1></td>
									<td></td>
								</tr>
								<tr>
									<td height="51"></td>
									<td>Digite o CNPJ que você precisa conferir na caixa
										abaixo e<br />clique sobre o botão "Validar CNPJ".
									</td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td valign="top"><form id="form1" name="form1"
											method="post" action="">
											<div align="center">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td height="40"><div align="center">
																<input name="cnpj" type="text" class="saida" id="cnpj" />
															</div></td>
													</tr>
													<tr>
														<td><div align="center">
																<input style="font-size: 15px; cursor: pointer"
																	type="button" name="botaoValidarCNPJ"
																	id="botaoValidarCNPJ" value="Validar CNPJ" />
															</div>
															<div align="center" id="saida" class="style7"></div></td>
													</tr>
												</table>
											</div>
										</form></td>
									<td></td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td><br />
							<div align="center">
								<script async
									src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
								<!-- Gerador-CNPJ-336-280 (3) -->
								<ins class="adsbygoogle"
									style="display: inline-block; width: 336px; height: 280px"
									data-ad-client="ca-pub-9618177229895113"
									data-ad-slot="1505419114"></ins>
								<script>
									(adsbygoogle = window.adsbygoogle || [])
											.push({});
								</script>
							</div> <br />
							<div align="center" style="margin-top: 4px; margin-bottom: 14px;">
								<strong style='font-size: 15px;'>Gostou desta
									ferramenta? Então compartilhe!</strong>
							</div>
							<div align="center" style="width: 30%; margin: auto">
								<div align="center" style="width: 50%; float: left">
									<div class="fb-like"
										data-href="http://www.geradorcnpj.com/validar-cnpj.htm"
										data-send="false" data-layout="box_count" data-width="60"
										data-show-faces="true"></div>
								</div>
								<div align="center" style="width: 50%; float: left">
									<div class="g-plusone" data-size="tall"></div>
									<script type="text/javascript">
										(function() {
											var po = document
													.createElement('script');
											po.type = 'text/javascript';
											po.async = true;
											po.src = 'https://apis.google.com/js/plusone.js';
											var s = document
													.getElementsByTagName('script')[0];
											s.parentNode.insertBefore(po, s);
										})();
									</script>
								</div>
							</div> <br style="clear: both">
						<div align="center" style="margin-bottom: 14px;"></div></td>
					</tr>
					<tr>
						<td height="89" valign="top"
							background="http://www.geradorcnpj.com/img/janela_baixo_topo.gif"><br />
						<h2 align="center">Limitações do Validador de CNPJ Online</h2></td>
					</tr>
					<tr>
						<td
							background="http://www.geradorcnpj.com/img/janela_baixo_meio.gif"><table
								width="95%" border="0" cellspacing="3" cellpadding="5">
								<tr>
									<td width="2%"></td>
									<td width="98%"><table width="100%" border="0"
											align="center" cellpadding="5" cellspacing="0"
											style="border-collapse: collapse">
											<tr>
												<td><img src="http://www.geradorcnpj.com/img/mais.gif"
													alt="Mais sobre - Gerador de CNPJ" width="9" height="9" />
													<strong>Até onde vai o validador de CNPJ</strong>
												<div class="normal">
														<p>Esse utilitário foi criado para ajudar
															desenvolvedores e analistas de sistema em testes de
															softwares em produção.</p>
														<p>A validação de CNPJ é realizada de acordo com os
															dígitos verificadores esperados pelo algoritmo do CNPJ.
															Portanto, um CNPJ considerado como válido pelo
															verificador significa que o número atende aos requisitos
															do algoritmo mas não significa que ele exista no Cadastro
															Nacional de Pessoas Jurídicas da Receita Federal.</p>
														<p>
															Para conferir se um CNPJ existe no cadastro nacional e a
															situação cadastral da respectiva empresa, consulte o site
															oficial da <a
																href="http://www.receita.fazenda.gov.br/pessoajuridica/cnpj/cnpjreva/cnpjreva_solicitacao.asp">Secretaria
																da Receita Federal do Brasil</a>.
														</p>
														<p>Esse site não tem qualquer vínculo com o site
															oficial da Receita Federal. A má utilização das
															informações dessa página é de total responsabilidade do
															visitante.</p>
														<table width="100%" border="0" cellspacing="0"
															cellpadding="0">
															<tr>
																<td width="10%"><img
																	src="http://www.geradorcnpj.com/img/lampada.gif"
																	width="40" height="50" border="0" alt="Lâmpada" /></td>
																<td width="90%">Para gerar números de CNPJ válidos
																	para testes de software, utilize nosso <a
																	href="http://www.geradorcnpj.com">gerador de cnpj</a>
																	on-line.
																</td>
															</tr>
														</table>
														<br />
														<img src="http://www.geradorcnpj.com/img/mais.gif"
															alt="Mais" width="9" height="9" /> <strong>Implementação
															em algumas linguagens da validação do CNPJ</strong><br />
														<br />- <a
															href="http://www.geradorcnpj.com/javascript-validar-cnpj.htm">Javascript
															para Validar CNPJ</a><br />
														<br />
														<br />
														<img src="http://www.geradorcnpj.com/img/mais.gif"
															alt="Mais" width="9" height="9" /> <strong>Artigos
															relacionados a CNPJ</strong><br />
														<br />- <a
															href="http://www.geradorcnpj.com/nao-coloque-cnpj-das-empresas-no-curriculo.htm">Não
															coloque CNPJ das empresas no curriculo</a><br />
														<br />
													</div></td>
											</tr>
										</table></td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td><img
							src="http://www.geradorcnpj.com/img/janela_baixo_inferior.gif"
							width="573" height="35" alt="Rodapé da Janela Inferior" /></td>
					</tr>
					<tr>
						<td><div align="center">
								<br />Copyright - 2007-2015 - Gerador de CNPJ - Como Gerar CNPJ
								's Válidos <br />
							</div></td>
					</tr>
				</table></td>
			<td width="320" align="center" valign="top"><br /> <script async
					src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
				<!-- Gerador-CNPJ-300x600 (1) --> <ins class="adsbygoogle"
					style="display: inline-block; width: 300px; height: 600px"
					data-ad-client="ca-pub-9618177229895113" data-ad-slot="4598486312"></ins>
				<script>
					(adsbygoogle = window.adsbygoogle || []).push({});
				</script></td>
		</tr>
	</table>
</body>
</html>