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
            	<a href="/logout">
                 <button class="btn btn-primary me-md-2" type="button">Logout</button>
            	</a>
            </div>
        </div>
    </nav>
    <div class="container">
        <div class="content row">
            <div class="content-left col-2">
                <ul class="nav flex-column list-group">
                    <li class="nav-item list-group-item menu">
                        <a class="nav-link active" aria-current="page" href="/account/${user.id}">My Account</a>
                    </li>
                    <li class="nav-item list-group-item menu">
                        <a class="nav-link" href="listing/upcoming">Upcoming Events</a>
                    </li>
                    <li class="nav-item list-group-item menu">
                        <a class="nav-link" href="/listing/create">Add Listing</a>
                    </li>
                    <li class="nav-item list-group-item menu">
                        <a class="nav-link" href="/listing/search">Search Listings</a>
                    </li>
                </ul>
            </div>

            <div class="content-right col">
                <div class="header">
                    <h3>New Listing in Your Area</h3>
                </div>
                    <hr>
				
                <div class="listings">
                    <ol>
                    <c:choose>
                    	<c:when test="${newest.size() < 1 }">
                    		<div>
                    			<h5>There are no new listings in your area.</h5>
                    		</div>
                    	</c:when>
                    	<c:otherwise>
		                    <c:forEach items="${newest}" var="newPost">
		                    	<li><a href="/listing/${newPost.id}"><c:out value="${newPost.title}"/></a>
				      			 <div class="card-container col-8">
							    		<input type="hidden" id="lat" value="${newPost.lat}">
										<input type="hidden" id="lng" value="${newPost.lng}">
							    	<div id="map"></div>
					    		</div>
		                    	<c:out value="${newPost.address}"/> <c:out value="${newPost.city}"/> <c:out value="${newPost.state}"/> <c:out value="${newPost.zipcode}"/></li>
		                    </c:forEach>
                    	</c:otherwise>
                    </c:choose>
                    </ol>
                </div>

            </div>
        </div>        
        <div class="footer row">
            <div class="foot-left col">
                <p>Active Listings</p>
                <hr>
		        	<c:forEach items="${listings}" var="listing">
		                <c:choose>
		                	<c:when test="${user.id == listing.user.id}">
				                <ul class="list-group">
				                    <li class="list-group-item">
				                    <a href="/listing/${listing.id}"><c:out value="${listing.title}"/></a>
				                    
				                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
					                    <a href="/listing/edit/${listing.id}"><button class="btn btn-primary me-md-2">Edit</button></a>
					                     
					                    <form action="listing/delete/${listing.id}" method="post">
									        <input type="hidden" name="_method" value="Delete">
									        <button class="btn btn-danger" type="submit">Delete</button>
								   		</form>
				                    </div>
							   		</li>
				                </ul>
		                	</c:when>
                			<c:otherwise>
                				<p>You currently have no active listings...</p>                	
                			</c:otherwise>
                	</c:choose>
	           	</c:forEach>
            </div>

            <div class="foot-right col">
                <p>Past Listings</p>
                <hr>
                <ul class="list-group">
                    <c:choose>
                	<c:when test="${user.id == listing.user.id}">
                	<c:set var="today" value="<%=new java.util.Date()%>" />
	                <c:forEach items="${listings.date lt today}" var="listing">
		                <ul class="list-group">
		                    <li class="list-group-item">
		                    	<a href="/listing/${listing.id}"><c:out value="${listing.title}"/></a>
					   		</li>
		                </ul>
	                </c:forEach>
                	</c:when>
                	<c:otherwise>
                		<p>You currently have no past listings...</p>                	
                	</c:otherwise>
                </c:choose>
                </ul>
            </div>            
        </div>
      </div>

	
	<script type="text/javascript" src="js/script.js"></script> <!-- link javascript file -->
	<script
    	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAoGVzc5akCX1cuR-P4i4BWYhLaZV2hFdI&callback=initMap&v=weekly" defer>
	</script>
</body>
</html>