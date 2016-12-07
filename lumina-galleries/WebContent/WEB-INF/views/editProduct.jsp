<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="/WEB-INF/views/template/header.jsp"%>

<div class="container-wrapper">
	<div class="container">
		<div class="page-header">
			<h1>Edit Product</h1>


			<p class="lead">Update product information:</p>
		</div>

		<!-- 		Spring form commandName  = model name to bind to-->
		<!-- 		enctype is for file upload property -->
		<form:form
			action="${pageContext.request.contextPath}/admin/product/editProduct"
			method="post" commandName="product" enctype="multipart/form-data">
			<div class="form-group">
				<!-- 			carry the id -->
				<form:hidden path="productId" value="${product.productId}"/>
				<label for="name">Name</label><form:errors path="productName" cssStyle="color:#ff0000"/>
				<!-- 			this is how you bind to product.productName on form submission -->
				<form:input class="form-control" path="productName" id="name" value="${product.productName}"/>
			</div>
			<div class="form-group">
				<label for="category">Category</label> <label
					class="checkbox-inline"><form:radiobutton
						path="productCategory" id="category" value="table lamp" />Table
					Lamp</label> <label class="checkbox-inline"><form:radiobutton
						path="productCategory" id="category" value="floor lamp" />Floor
					Lamp</label> <label class="checkbox-inline"><form:radiobutton
						path="productCategory" id="category" value="pendant" />Pendant</label>
			</div>
			<div class="form-group">
				<label for="description">Description</label>
				<form:textarea class="form-control" path="productDescription"
					id="description" value="${productDescription}"/>
			</div>
			<div class="form-group">
				<label for="price">Price</label><form:errors path="productPrice" cssStyle="color:#ff0000"/>
				<form:input class="form-control" path="productPrice" id="price" value="${product.productPrice}"/>
			</div>
			<div class="form-group">
				<label for="condition">Condition</label> <label
					class="checkbox-inline"><form:radiobutton
						path="productCondition" id="condition" value="new" />New</label> <label
					class="checkbox-inline"><form:radiobutton
						path="productCondition" id="condition" value="consignment" />Consignment</label>
				<label class="checkbox-inline"><form:radiobutton
						path="productCondition" id="condition" value="used" />Used</label>
			</div>
			<div class="form-group">
				<label for="manufacturer">Manufacturer</label>
				<form:input class="form-control" path="productManufacturer"
					id="manufacturer" value="${product.productManufacturer}"/>
			</div>
			<div class="form-group">
				<label for="unitsInStock">Units In Stock</label><form:errors path="stock" cssStyle="color:#ff0000"/>
				<form:input class="form-control" path="stock" id="unitsInStock" value="${product.stock}"/>
			</div>
			<div class="form-group">
				<label for="status">Status</label> <label class="checkbox-inline"><form:radiobutton
						path="productStatus" id="status" value="in stock" />In stock</label> <label
					class="checkbox-inline"><form:radiobutton
						path="productStatus" id="status" value="out of stock" />Out of
					stock</label> <label class="checkbox-inline"><form:radiobutton
						path="productStatus" id="status" value="obsolete" />Obsolete</label>
			</div>

			<div class="form-group">
				<label class="control-label" for="productImage">Upload
					Picture</label>
				<form:input class="form:input-large" path="productImage" type="file"
					id="productImage" />
			</div>
			
			<br />
			<input class="btn btn-default" type="submit" value="Submit">
			<a class="btn btn-default"
				href="<c:url value="/admin/productInventory"/>">Cancel</a>
		</form:form>



		<%@include file="/WEB-INF/views/template/footer.jsp"%>