<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- form tag -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>  

<!-- Number format import-->
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create New Listing</title>

	<!-- for Bootstrap CSS -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<!-- YOUR own local CSS -->
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<!-- For any Bootstrap that uses JS or jQuery-->
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-lg bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand fs-1" href="/dashboard">Site</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
	            <div class="collapse navbar-collapse" id="navbarNav">
	                <ul class="navbar-nav justify-content-end">
	                    <li class="nav-item">
	                        <a class="nav-link" href="/dashboard">Dashboard</a>
	                    </li>
	                    <li class="nav-item">
	                        <a class="nav-link" href="/listing">Search</a>
	                    </li>
	                    <li class="nav-item">
	                        <a class="nav-link" href="/account">My Account</a>
	                    </li>
	                </ul>
	            </div>
                <a href="/logout">
                    <button class="btn btn-primary me-md-2" type="button">Logout</button>
                </a>
            </div>
        </div>
    </nav>
    <div class="container container-forms">
    <div class="header">
    	<h2>Create Listing</h2>
    </div>
        <div class="form">
            <form:form action="/listing/add" method="POST" modelAttribute="newListing" id="post-form" oninput="getFullAddress()">
                	<div class="errors">
	                	<p><form:errors path="title"/></p>
						<p><form:errors path="address"/></p>
						<p><form:errors path="city"/></p>
						<p><form:errors path="state"/></p>
						<p><form:errors path="zipcode"/></p>
						<p><form:errors path="date"/></p>
						<p><form:errors path="start"/></p>
						<p><form:errors path="end"/></p>
						<p><form:errors path="description"/></p>
						<p><form:errors path="tags"/></p>
                	</div>
                <div class="form_input row mb-3 gy-3">
                    <form:label  path="title" class="col-sm-1 col-form-label fw-bold">Title:</form:label>
                    <div class="col-sm-11">
                        <form:input path="title" class="form-control"/>
                    </div>
					
                    <form:label path="address" class="col-sm-1 col-form-label fw-bold">Address:</form:label>
                    <div class="col-sm-11">
                        <form:input id="address" type="text" path="address" class="form-control"/>
                    </div>
					
                    <form:label path="city" class="col-sm-1 col-form-label fw-bold">City:</form:label>
                    <div class="col-sm-4">
                        <form:input id="city" path="city" class="form-control"/>
                    </div>
					
                    <form:label path="state" class="col-sm-1 col-form-label fw-bold">State:</form:label>
                    <div class="col-sm-1">
                        <form:input id="state" path="state" class="form-control"/>
                    </div>
					
                    <form:label path="zipcode" class="col-sm-2 col-form-label fw-bold">Zip Code:</form:label>
                    <div class="col-sm-3">
                        <form:input id="zipcode" path="zipcode" class="form-control"/>
                    </div>					
					
                    <form:label path="date" class="col-sm-1 col-form-label fw-bold">When:</form:label>
                    <div class="col-sm-3">
                        <form:input path="date" type="date" class="form-control"/>
                    </div>
					
                    <form:label path="start" class="col-sm-2 col-form-label fw-bold">Start Time:</form:label>
                    <div class="col-sm-2">
                        <form:input path="start" type="time" class="form-control"/>
                    </div>

                    <form:label path="end" class="col-sm-2 col-form-label fw-bold">End Time:</form:label>
                    <div class="col-sm-2">
                        <form:input path="end" type="time" class="form-control"/>
                    </div>

                    <form:label path="description" class="col-sm-1 col-form-label fw-bold">Details:</form:label>
                    <div class="col-sm-11">
                        <form:textarea rows="2" class="form-control" path="description"/>
                    </div>
					
                    <form:label path="tags" class="col-sm-1 col-form-label mt-4 fw-bold">Tags:</form:label>
                    <div class="col-sm-11">
                    	<h6 class="tag-heads">Clothes:</h6>
                    	<hr>
                    	<div class="form-check form-check-inline">
                            <form:checkbox path="tags" value="Clothes - Kids" class="form-check-input"/>
                            Kids
                        </div>
                        <div class="form-check form-check-inline">
                            <form:checkbox path="tags" value="Clothes - Baby" class="form-check-input"/>
                            Baby
                    	</div>
                    	<div class="form-check form-check-inline">
                            <form:checkbox path="tags" value="Clothes - Women" class="form-check-input"/>
                            Women
                    	</div>
                    	<div class="form-check form-check-inline">
                            <form:checkbox path="tags" value="Clothes - Men" class="form-check-input"/>
                            Men
                    	</div>
                    	<h6 class="tag-heads">Furniture:</h6>
                    	<hr>
                    	<div class="form-check form-check-inline">
                            <form:checkbox path="tags" value="Furniture - Living Room" class="form-check-input"/>
                            Living Room
                        </div>
                        <div class="form-check form-check-inline">
                            <form:checkbox path="tags" value="Furniture - Bedroom" class="form-check-input"/>
                            Bedroom
                        </div>
                        <div class="form-check form-check-inline">
                            <form:checkbox path="tags" value="Furniture - Baby" class="form-check-input"/>
                            Baby
                        </div>
                        <div class="form-check form-check-inline">
                            <form:checkbox path="tags" value="Furniture - Patio" class="form-check-input"/>
                            Patio
                        </div>
                        <div class="form-check form-check-inline">
                            <form:checkbox path="tags" value="Furniture - Dining Room" class="form-check-input"/>
                            Dining Room
                        </div>
                        <h6 class="tag-heads">Appliances:</h6>
                        <hr>
                        <div class="form-check form-check-inline">
                            <form:checkbox path="tags" value="Appliances - Large Kitchen" class="form-check-input"/>
                            Large Kitchen
                        </div>
                        <div class="form-check form-check-inline">
                            <form:checkbox path="tags" value="Appliances - Small Kitchen" class="form-check-input"/>
                            Small Kitchen
                        </div>
                        <h6 class="tag-heads">Other:</h6>
                        <hr>
                        <div class="form-check form-check-inline">
                            <form:checkbox path="tags" value="Electronics" class="form-check-input"/>
                            Electronics
                        </div>
                        <div class="form-check form-check-inline">
                            <form:checkbox path="tags" value="Art/Decor" class="form-check-input"/>
                            Art/Decor
                        </div>
                        <div class="form-check form-check-inline">
                            <form:checkbox path="tags" value="Toys" class="form-check-input"/>
                            Toys
                        </div>
                        <div class="form-check form-check-inline">
                            <form:checkbox path="tags" value="Collectibles" class="form-check-input"/>
                            Collectibles
                        </div>
                        <div class="form-check form-check-inline">
                            <form:checkbox path="tags" value="Games" class="form-check-input"/>
                            Games
                        </div>
                        <div class="form-check form-check-inline">
                            <form:checkbox path="tags" value="Misc" class="form-check-input"/>
                            Misc
                        </div>
                        <div>
                        	<form:hidden path="lat" id="addressLat"/>
                        	<form:hidden path="lng" id="addressLng"/>
                        </div>
                    </div>
                    <div class="row mt-4">
                    	<div class="btn col-6 fs-5">
		                    <a href="/dashboard">Cancel</a>
                    	</div>
	                    <div class="btn-div d-grid gap-2 col-6">
	                        <button class="form-btn btn btn-primary" type="submit">Post</button>
	                    </div>                    
                    </div>
                    <div id="formatted-address"></div>
                    <div id="address-components"></div>
                    <div id="geometry"></div>
                </div>
            </form:form>
        </div>
    </div>  
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<script type="text/javascript" src="/js/script.js"></script> <!-- link javascript file -->
</body>
</html>