<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<!--Importante cambiar de xml a html-->
	<!--Ctrl + k + d para identar automaticamente-->
	<xsl:output method="html" indent="yes"/>
	<xsl:param name="TipoMenu" select="TipoMenu"></xsl:param>

	<xsl:template match="Menu">
		<html lang="en">
			<head>
				<meta charset="utf-8"/>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<meta name="viewport" content="width=device-width, initial-scale=1"/>
				<title>Cafe House Template</title>
				<!-- 
Cafe House Template
http://www.templatemo.com/tm-466-cafe-house
-->
				<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,700' rel='stylesheet' type='text/css'/>
				<link href='http://fonts.googleapis.com/css?family=Damion' rel='stylesheet' type='text/css'/>
				<link href="css/bootstrap.min.css" rel="stylesheet"/>
				<link href="css/font-awesome.min.css" rel="stylesheet"/>
				<link href="css/templatemo-style.css" rel="stylesheet"/>
				<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />

				<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
				<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
				<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
				<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
			</head>

			<body>
				<div id="loader-wrapper">
					<div id="loader"></div>
					<div class="loader-section section-left"></div>
					<div class="loader-section section-right"></div>
				</div>
			
				<!--navbar-->
				<div class="tm-top-header">
					<div class="container">
						<div class="row">
							<div class="tm-top-header-inner">
								<div class="tm-logo-container">
									<img src="img/logo.png" alt="Logo" class="tm-site-logo"/>
									<h1 class="tm-site-name tm-handwriting-font">
										<xsl:value-of select="Datos/NombreRestaurant"/>
									</h1>
								</div>
								<div class="mobile-menu-icon">
									<i class="fa fa-bars"></i>
								</div>
								<nav class="tm-nav">
									<ul>
										<xsl:for-each select="Opciones/Opcion">
											<li>
												<!--equivalente SWITCH-->
												<xsl:choose>
													<!--equivalente IF-->
													<xsl:when test="$TipoMenu=@Id">
														<a href="{@Url}" class="active">
															<xsl:value-of select="@Texto"/>
														</a>
													</xsl:when>
													<!--equivalente a ELSE-->
													<xsl:otherwise>
														<a href="{@Url}">
															<xsl:value-of select="@Texto"/>
														</a>
													</xsl:otherwise>
												</xsl:choose>
											</li>
										</xsl:for-each>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>

				<!-- Choose para mostrar dinámicamente el contenido de cada opcion del menú-->
				<xsl:choose>
					<xsl:when test="$TipoMenu=1">

						<xsl:call-template name="Carta"/>

					</xsl:when>

					<xsl:when test="$TipoMenu=2">
						<xsl:call-template name="Contacto"/>
					</xsl:when>

					<xsl:when test="$TipoMenu=3">
						<h1>Mostrar contenido de Play Room</h1>
					</xsl:when>

					<xsl:otherwise>
						<xsl:call-template name="Home"/>
					</xsl:otherwise>

				</xsl:choose>

				<footer>
					<div class="tm-black-bg">
						<div class="container">
							<div class="row margin-bottom-60">
								<nav class="col-lg-3 col-md-3 tm-footer-nav tm-footer-div">
									<h3 class="tm-footer-div-title">Main Menu</h3>
									<ul>
										<li>
											<a href="#">Home</a>
										</li>
										<li>
											<a href="#">About Us</a>
										</li>
										<li>
											<a href="#">Directory</a>
										</li>
										<li>
											<a href="#">Blog</a>
										</li>
										<li>
											<a href="#">Our Services</a>
										</li>
									</ul>
								</nav>
								<div class="col-lg-5 col-md-5 tm-footer-div">
									<h3 class="tm-footer-div-title">About Us</h3>
									<p class="margin-top-15">Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.</p>
									<p class="margin-top-15">Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus.</p>
								</div>
								<div class="col-lg-4 col-md-4 tm-footer-div">
									<h3 class="tm-footer-div-title">Get Social</h3>
									<p>Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante.</p>
									<div class="tm-social-icons-container">
										<a href="#" class="tm-social-icon">
											<i class="fa fa-facebook"></i>
										</a>
										<a href="#" class="tm-social-icon">
											<i class="fa fa-twitter"></i>
										</a>
										<a href="#" class="tm-social-icon">
											<i class="fa fa-linkedin"></i>
										</a>
										<a href="#" class="tm-social-icon">
											<i class="fa fa-youtube"></i>
										</a>
										<a href="#" class="tm-social-icon">
											<i class="fa fa-behance"></i>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div>
						<div class="container">
							<div class="row tm-copyright">
								<p class="col-lg-12 small copyright-text text-center">Copyright 2084 Your Cafe House</p>
							</div>
						</div>
					</div>
				</footer>
				<!-- Footer content-->

				<!-- JS -->

				<!-- jQuery -->
				<script type="text/javascript" src="js/templatemo-script.js"></script>
				<!-- Templatemo Script -->
			</body>

		</html>
	</xsl:template>

	<xsl:template name="Home">
		<section class="tm-welcome-section">
			<div class="container tm-position-relative">
				<div class="tm-lights-container">
					<img src="img/light.png" alt="Light" class="light light-1"/>
					<img src="img/light.png" alt="Light" class="light light-2"/>
					<img src="img/light.png" alt="Light" class="light light-3"/>
				</div>
				<div class="row tm-welcome-content">
					<h2 class="white-text tm-handwriting-font tm-welcome-header">
						<img src="img/header-line.png" alt="Line" class="tm-header-line" />
						Bienvenido a<img src="img/header-line.png" alt="Line" class="tm-header-line"/>
					</h2>
					<h2 class="gold-text tm-welcome-header-2">
						<xsl:value-of select="Datos/NombreRestaurant"/>
					</h2>
					<p class="gray-text tm-welcome-description">
						<xsl:value-of select="Datos/Descripcion"/>
					</p>
					<a href="#main" class="tm-more-button tm-more-button-welcome">Ir a la carta</a>
				</div>
				<img src="img/table-set.png" alt="Table Set" class="tm-table-set img-responsive"/>
			</div>
		</section>

		<div class="tm-main-section light-gray-bg">
			<div class="container" id="main">
				<section class="tm-section row">
					<div class="col-lg-9 col-md-9 col-sm-8">
						<h2 class="tm-section-header gold-text tm-handwriting-font">Visítanos en</h2>
						<h2>
							<xsl:value-of select="Datos/NombreRestaurant"/>
						</h2>
						<p class="tm-welcome-description">
							<xsl:value-of select="concat(Datos/Direccion, ' Tel: ' ,Datos/Telefono)"/>
						</p>
						<a href="#" class="tm-more-button margin-top-30">Leer Más</a>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-4 tm-welcome-img-container">
						<div class="inline-block shadow-img">
							<img src="{Datos/Imagen}" alt="Image" class="img-circle img-thumbnail"/>
						</div>
					</div>
				</section>
				<section class="tm-section tm-section-margin-bottom-0 row">
					<div class="col-lg-12 tm-section-header-container">
						<h2 class="tm-section-header gold-text tm-handwriting-font">
							<img src="img/logo.png" alt="Logo" class="tm-site-logo"/>Especialidades
						</h2>
						<div class="tm-hr-container">
							<hr class="tm-hr"/>
						</div>
					</div>
					<div class="col-lg-12 tm-popular-items-container">
						<xsl:for-each select="Platillos/Tipo[@Nombre != 'Bebidas']/Platillo[@Orden=1]">
							<div class="tm-popular-item">
								<img src="{Imagen}" alt="Popular" class="tm-popular-item-img"/>
								<div class="tm-popular-item-description">
									<h3 class="tm-handwriting-font tm-popular-item-title">
										<span class="tm-handwriting-font bigger-first-letter">
											<xsl:value-of select="substring(@Nombre,1,1)"/>
										</span>
										<xsl:value-of select="substring(@Nombre,2,string-length())"/>
									</h3>
									<hr class="tm-popular-item-hr"/>
									<p>
										<xsl:value-of select="Descripcion"/>
									</p>
									<div class="order-now-container">
										<a href="#" class="order-now-link tm-handwriting-font">
											<xsl:value-of select="Precio"/>
										</a>
									</div>
								</div>
							</div>
						</xsl:for-each>


					</div>
				</section>
				<section class="tm-section row">
					<div class="col-lg-12 tm-section-header-container">
						<h2 class="tm-section-header gold-text tm-handwriting-font">
							<img src="img/logo.png" alt="Logo" class="tm-site-logo"/> Comida Especial
						</h2>
						<div class="tm-hr-container">
							<hr class="tm-hr"/>
						</div>
					</div>
					<div class="col-lg-12 tm-special-container margin-top-60">
						<div class="tm-special-container-left">
							<!-- left -->
							<xsl:for-each select="Platillos/Tipo[@Nombre = 'Comidas']/Platillo[@Especialidad = 'SI']">
								<div class="tm-special-item">
									<div class="tm-special-img-container">
										<img src="{Imagen[position()=1]}" alt="Special" class="tm-special-img img-responsive"/>
										<a href="#">
											<div class="tm-special-description">
												<h3 class="tm-special-title">
													<xsl:value-of select="@Nombre"/>
												</h3>
												<p>
													<xsl:value-of select="TextoEspecial"/>
												</p>
											</div>
										</a>
									</div>
								</div>

							</xsl:for-each>
						</div>
						<div class="tm-special-container-right">
							<!-- right -->
							<div>
								<xsl:for-each select="Platillos/Tipo[@Nombre = 'Comidas']/Platillo[@Especialidad = 'SI']">
									<div class="tm-special-item">
										<div class="tm-special-img-container">
											<img src="{Imagen[position()=2]}" alt="Special" class="img-responsive"/>
											<a href="#">
												<div class="tm-special-description">
													<h3 class="tm-special-title">
														<xsl:value-of select="Ingredientes/Ingrediente[position()=1]/@Nombre"/>
													</h3>
													<p>
														<xsl:value-of select="Ingredientes/Ingrediente[position()=1]"/>
													</p>
												</div>
											</a>
										</div>
									</div>

								</xsl:for-each>
							</div>
							<div class="tm-special-container-lower">
								<xsl:for-each select="Platillos/Tipo[@Nombre = 'Comidas']/Platillo[@Especialidad = 'SI']/Ingredientes/Ingrediente[position()>1]">
									<div class="tm-special-item">
										<div class="tm-special-img-container">
											<img src="{@Imagen}" alt="Special" class="img-responsive"/>
											<a href="#">
												<div class="tm-special-description">
													<p>
														<xsl:value-of select="@Nombre"/>
													</p>
												</div>
											</a>
										</div>
									</div>
								</xsl:for-each>
							</div>
						</div>
					</div>
				</section>
				<section class="tm-section">
					<div class="row">
						<div class="col-lg-12 tm-section-header-container">
							<h2 class="tm-section-header gold-text tm-handwriting-font">
								<img src="img/logo.png" alt="Logo" class="tm-site-logo"/> Daily Menu
							</h2>
							<div class="tm-hr-container">
								<hr class="tm-hr"/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="tm-daily-menu-container margin-top-60">
							<div class="col-lg-4 col-md-4">
								<img src="img/menu-board.png" alt="Menu board" class="tm-daily-menu-img"/>
							</div>
							<div class="col-lg-8 col-md-8">
								<p>Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus.</p>
								<ol class="margin-top-30">
									<li>Tellus eget condimentum rhoncus.</li>
									<li>Sem quam semper libero.</li>
									<li>Sit amet adipiscing sem neque sed ipsum.</li>
									<li>Nam quam nunc, blandit vel, luctus pulvinar.</li>
									<li>Maecenas nec odio et ante tincidunt tempus.</li>
									<li>Donec vitae sapien ut libero ventenatis faucibus.</li>
								</ol>
								<a href="#" class="tm-more-button margin-top-30">Read More</a>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</xsl:template>

	<xsl:template name="Carta">
		<section class="tm-welcome-section">
			<div class="container tm-position-relative">
				<div class="tm-lights-container">
					<img src="img/light.png" alt="Light" class="light light-1"/>
					<img src="img/light.png" alt="Light" class="light light-2"/>
					<img src="img/light.png" alt="Light" class="light light-3"/>
				</div>
				<div class="row tm-welcome-content">
					<h2 class="white-text tm-handwriting-font tm-welcome-header">
						<img src="img/header-line.png" alt="Line" class="tm-header-line"/>Nuestro menú<img src="img/header-line.png" alt="Line" class="tm-header-line"/>
					</h2>
					<h2 class="gold-text tm-welcome-header-2">
						<xsl:value-of select="Datos/NombreRestaurant"/>
					</h2>
					<p class="gray-text tm-welcome-description">
						<xsl:value-of select="Datos/Descripcion"/>
					</p>
					<a href="#main" class="tm-more-button tm-more-button-welcome">Ir a la Carta</a>
				</div>
				<img src="img/table-set.png" alt="Table Set" class="tm-table-set img-responsive"/>
			</div>
		</section>
		<div class="tm-main-section light-gray-bg">
			<div class="container" id="main">
				<section class="tm-section row">
					<div class="col-lg-12 tm-section-header-container margin-bottom-30">
						<h2 class="tm-section-header gold-text tm-handwriting-font">
							<img src="img/logo.png" alt="Logo" class="tm-site-logo"/> Nuestros menús
						</h2>
						<div class="tm-hr-container">
							<hr class="tm-hr"/>
						</div>
					</div>
					<div>
						<div class="col-lg-3 col-md-3">
							<div class="tm-position-relative margin-bottom-30">
								<nav class="tm-side-menu">
									<ul>
										<xsl:for-each select="Platillos/Tipo">
											<li>
												<a class="tipomenu active" style="cursor:pointer;" id="li{@Nombre}" data-identificador="{@Nombre}">
													<xsl:value-of select="@Nombre"/>
												</a>
											</li>
										</xsl:for-each>
									</ul>
								</nav>
								<img src="img/vertical-menu-bg.png" alt="Menu bg" class="tm-side-menu-bg"/>
							</div>
						</div>

						<xsl:for-each select="Platillos/Tipo">
							<div class="tm-menu-product-content col-lg-9 col-md-9 contenedores" id="{@Nombre}">
								<!-- menu content -->

								<xsl:for-each select="Platillo">
									<div class="tm-product">
										<img src="{Imagen}" alt="Product" class="imagenPlatillo"/>
										<div class="tm-product-text">
											<h3 class="tm-product-title">
												<xsl:value-of select="@Nombre"/>
											</h3>
											<p class="tm-product-description">
												<xsl:value-of select="Descripcion"/>
											</p>
										</div>
										<div class="tm-product-price">
											<a href="#" class="tm-product-price-link tm-handwriting-font">
												<span class="tm-product-price-currency"></span>
												<xsl:value-of select="Precio"/>
											</a>
										</div>
									</div>

								</xsl:for-each>

							</div>
						</xsl:for-each>

					</div>
				</section>
			</div>
		</div>

		<script>
			$(document).ready(function(){
			$("#liDesayunos").addClass("active");
			$(".contenedores").hide();
			$("#Desayunos").show();
			$(".tipomenu").click(function(){
			$(".contenedores").hide();
			var nombre = $(this).data("identificador");
			$(".tipomenu").removeClass("active");
			$(this).addClass("active");
			$("#" + nombre).show();
			});
			});

		</script>

	</xsl:template>

	<xsl:template name="Contacto">
		<!--Ctrl + K + C para agregar comentario-->
		<!--agregar referencia a la api de google-->
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCWeeateTaYGqsHhNcmoDfT7Us-vLDZVPs&amp;sensor=false&amp;language=en"></script>
		
		<script src="js/geolocalizacion.js"></script>
			
		<section class="tm-welcome-section">
			<div class="container tm-position-relative">
				<div class="tm-lights-container">
					<img src="img/light.png" alt="Light" class="light light-1"/>
					<img src="img/light.png" alt="Light" class="light light-2"/>
					<img src="img/light.png" alt="Light" class="light light-3"/>
				</div>
				<div class="row tm-welcome-content">
					<h2 class="white-text tm-handwriting-font tm-welcome-header">
						<img src="img/header-line.png" alt="Line" class="tm-header-line"/>Contáctanos<img src="img/header-line.png" alt="Line" class="tm-header-line"/>
					</h2>
					<h2 class="gold-text tm-welcome-header-2">
						<xsl:value-of select="Datos/NombreRestaurant"/>
					</h2>
					<p class="gray-text tm-welcome-description">
						<text id="direccion" class="gold-text">
						</text>
						<div id="street">
						</div>
					</p>
					<a href="#main" class="tm-more-button tm-more-button-welcome">Escríbenos</a>
				</div>
				<img src="img/table-set.png" alt="Table Set" class="tm-table-set img-responsive"/>
			</div>
		</section>
		<div class="tm-main-section light-gray-bg">
			<div class="container" id="main">
				<section class="tm-section row">
					<h2 class="col-lg-12 margin-bottom-30">Formulario de reservación</h2>
					<form action="contacto.aspx" method="post" class="tm-contact-form" oninput="Total.value=contact_personas.valueAsNumber + contact_adicionales.valueAsNumber">
						<div class="col-lg-6 col-md-6">
							<div class="form-group">
								<label class="form-label">Nombre</label>
								<input type="text" id="contact_name" name="contact_name" class="form-control" placeholder="Nombre completo" required="true" />
							</div>
							<div class="form-group">
								<label class="form-label">Correo</label>
								<input type="email" id="contact_email" name="contact_email" class="form-control" placeholder="Correo electrónico" required="true" />
							</div>
							<div class="form-group">
								<label class="form-label">Número de personas</label>
								<input type="number" id="contact_personas" name="contact_personas" class="form-control" required="true" min="1" max="8" value="1"/>
							</div>
							<div class="form-group">
								<label class="form-label">Personas adicionales</label>
								<input type="number" id="contact_adicionales" name="contact_adicionales" class="form-control" min="0" max="4" value="0"/>
							</div>
							<div class="form-group">
								<label class="form-label">Fecha reservación</label>
								<input type="date" id="contact_fecha" name="contact_fecha" class="form-control" required="true" />
							</div>
							<div class="form-group">
								<label class="form-label">Hora</label>
								<input type="time" id="contact_hora" name="contact_hora" class="form-control" required="true" min="08:00:00" max="19:00:00"/>
							</div>
							<div class="form-group">
								<label class="form-label">Total de personas</label>
								<output id="Total" class="form-control">1</output>
							</div>
							<div class="form-group">
								<button class="tm-more-button" type="submit" name="submit">Reservar</button>
							</div>
						</div>
						<div class="col-lg-6 col-md-6">
							<div id="google-map">
								<div id="mapa">
								</div>

							</div>
						</div>
					</form>
				</section>
			</div>
		</div>
		<script>
			<!--el mes comienza en 0, por tal motivo en la funcion getMonth() se le suma 1-->
			<![CDATA[$(document).ready(function(){
    var timeControl = document.getElementById("contact_hora");
    var now = new Date(Date.now());
    var horas = now.getHours();
    var minutos = now.getMinutes();

    if(horas < 10){
        horas = "0" + horas;
    }

    if(minutos < 10){
        minutos = "0" + horas;
    }

    var formatted = horas + ":" + minutos;
    //timeControl.value = formatted
    //$("#contact_hora").val(formatted);
    $("#contact_hora").attr("value",formatted);
    $("#contact_hora").attr("min",formatted);
    var dd = now.getDate();
    var mm = now.getMonth()+1; 
    var yyyy = now.getFullYear();
    if(dd<10){dd='0'+dd;}
    if(mm<10){mm='0'+mm;}
    
    var today = yyyy + '-' + mm + '-' + dd;
    $("#contact_fecha").attr("min", today);
    $("#contact_fecha").val(today);
    getGeo();
    dibujaMapa(19.0610357, -98.3038035);
});
]]>

		</script>
	</xsl:template>
</xsl:stylesheet>
