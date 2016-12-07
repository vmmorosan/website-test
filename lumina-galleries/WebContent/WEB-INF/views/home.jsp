<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="/WEB-INF/views/template/header.jsp"%>


	<!-- Carousel
    ================================================== -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img class="first-slide home-image"
					src="<c:url value="/resources/images/back1.jpg"/>"
					alt="First slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>Welcome to Lumina Store.</h1>
						<p>
							One of the finest lighting collection on the world, encompassing Murano Glass and 
							super tech solutions.
						</p>
						
					</div>
				</div>
			</div>
			<div class="item">
				<img class="second-slide home-image"
					src="<c:url value="/resources/images/back2.jpg"/>"
					alt="Second slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>Great deals for state of the art designs.</h1>
						<p>Check our collection and take advantage of the best deals you can get online</p>
						
					</div>
				</div>
			</div>
			<div class="item">
				<img class="third-slide home-image"
					src="<c:url value="/resources/images/back3.jpg"/>"
					alt="Third slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>Energy efficient solutions.</h1>
						<p>Save money on energy consumption. We got the best deals on LED lamps.</p>
						
					</div>
				</div>
			</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<!-- /.carousel -->


	<!-- Marketing messaging and featurettes
    ================================================== -->
	<!-- Wrap the rest of the page in another container to center all the content. -->

	<div class="container marketing">

		<!-- Three columns of text below the carousel -->
		<div class="row">
			<div class="col-lg-4">
				<a class="btn btn-default" href="<c:url value="/product/productList/category?searchCondition=table%20lamp"/>" role="button">
					<img class="img-circle"	src="<c:url value="/resources/images/table.jpg"/>" alt="Table Lamp Image" width="140" height="140">
				</a>
				
				<h2>Table Lamps</h2>
				<p>Best collection of modern table lamps</p>
			</div>
			<div class="col-lg-4">
				<a class="btn btn-default" href="<c:url value="/product/productList/category?searchCondition=floor%20lamp"/>" role="button">
					<img class="img-circle"	src="<c:url value="/resources/images/floor.jpg"/>" alt="Floor Lamp Image" width="140" height="140">
				</a>
				
				<h2>Floor Lamps</h2>
				<p>Unique designs from arround the worls</p>
			</div>
			<div class="col-lg-4">
				<a class="btn btn-default" href="<c:url value="/product/productList/category?searchCondition=pendant"/>" role="button">
					<img class="img-circle"	src="<c:url value="/resources/images/pendant.jpg"/>" alt="Pendant Image" width="140" height="140">
				</a>
				
				<h2>Pendant Lighting</h2>
				<p>Best way to decorate your home</p>
			</div>
		
		</div>
		<!-- /.row -->



<%@include file="/WEB-INF/views/template/footer.jsp"%>