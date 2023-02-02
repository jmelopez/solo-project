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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="UTF-8">
<title>Dashboard</title>

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
            <a class="navbar-brand fs-1">Site Name</a>
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
            <div class="collapse navbar-collapse" id="navbarNav">
	                <ul class="navbar-nav justify-content-end">
	                    <li class="nav-item">
	                        <a class="nav-link" href="/dashboard">Dashboard</a>
	                    </li>
	                    <li class="nav-item">
	                        <a class="nav-link" href="/listings">Search</a>
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
    <div class="container text-capitalize">
    	<div class="header">
    		<h2 class="mt-4"><c:out value="${listing.title}"/> </h2>
    		<div class="icon-div">
	    		<a href="#"  id="icon-star" class="icon-btn"><i class="fa fa-star"></i></a>
	    		
    		</div>
    	</div>
		<div class="content-left row">
			<div class="listing-info col-4">
				<ul class="list-group">
					<li class="list-group-item">
						<span class="form-titles">Address:</span> <c:out value="${listing.address}"/>
					</li>
					<li class="list-group-item">
						<span class="form-titles ">When: </span><c:out value="${date}"/>
					</li>
					<li class="list-group-item">
						<span class="form-titles">Event Start: </span><c:out value="${start}"/>
					</li>
					<li class="list-group-item">
						<span class="form-titles ">Event End: </span><c:out value="${end}"/>
					</li>
					<li class="list-group-item">
						<span class="form-titles">Description:</span> <c:out value="${listing.description}"/>
					</li>
					<div class="list-group-item">
						<span class="form-titles">Tags:</span>
						<c:forEach items="${listing.tags}" var="tag">
							<li class="tags">
								<c:out value="${tag}"/> |
							</li>
						</c:forEach>
					</div>
				</ul>
				<c:if test="${user == listing.user}">
					<div class="footer d-grid gap-2 d-md-flex justify-content-md-end">
						<a href="/listing/edit/${listing.id}"><button class="btn btn-primary">Edit</button></a>
			     	  	<div>
		        		<form action="listing/delete/${listing.id}" method="post">
					        <input type="hidden" name="_method" value="Delete">
					        <button class="btn btn-danger" type="submit">Delete</button>
				   		</form>
	        	</div> 	
					</div>
				</c:if>
			</div>
			 <div class="card-container col-8">
		    	<input type="hidden" id="lat" value="${listing.lat}">
				<input type="hidden" id="lng" value="${listing.lng}">
	    	<div id="map"></div>
    		</div>
		</div>
    
    </div>
        <script type="text/javascript" src="/js/script.js"></script> <!-- link javascript file -->
    	<script
	    	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAoGVzc5akCX1cuR-P4i4BWYhLaZV2hFdI&callback=initMap&v=weekly" defer>
		</script>
</body>
</html>