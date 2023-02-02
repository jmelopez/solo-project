<%@page import="java.util.Date"%>
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
            <div class="collapse navbar-collapse" id="navbarNav">
	                <ul class="navbar-nav justify-content-end">
	                    <li class="nav-item">
	                        <a class="nav-link" href="/dashboard">Dashboard</a>
	                    </li>
	                    <li class="nav-item">
	                        <a class="nav-link" href="/search">Search</a>
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
    <div class="container">
	   <div class="search d-flex">
	    <form id="search-form" onsubmit="search()">
	    	<input class="form-control me-2" type="search" name="q" placeholder="Search"/>
	    	<button class="col-3" type="submit">Search</button>
	    </form>
	   </div>    
    <hr>
    <div class="results">
    	<c:choose>
    		<c:when test="${allListings.size() < 1}">
    			<h3>There are currently no listings available...</h3>
    		</c:when>
    		<c:when test="${searchQuery == null }">
    			<h3>All listings:</h3>    		
		    	<ol class="list-group-numbered">
	    			<c:forEach items="${allListings}" var="listing">
			    		<li class="list-group-item text-capitalize">
				    		<a href="/listing/${listing.id}"><c:out value="${listing.title}"/></a>
				    		<c:out value="${listing.address}"/> <c:out value="${listing.city}"/> <c:out value="${listing.state}"/> <c:out value="${listing.zipcode}"/>
			    		</li>
			    	</c:forEach>
		    	</ol>
    		</c:when>
    		<c:otherwise>
    			<h3>Showing search results for: <c:out value="${searchQuery}"/></h3>
	    		<ol class="list-group-numbered">
	    			<c:forEach items="${searchResult}" var="listing">
	    				<li class="list-group-item text-capitalize">
				    		<a href="/listing/${listing.id}"><c:out value="${listing.title}"/></a><br>
				    		<c:out value="${listing.address}"/> <c:out value="${listing.city}"/>, <c:out value="${listing.state}"/> <c:out value="${listing.zipcode}"/> 
	    				</li>
	    			</c:forEach>
	    		</ol>
    		</c:otherwise>
    	</c:choose>
    </div>
    
    </div>
    <script type="text/javascript" src="js/script.js"></script> <!-- link javascript file -->
</body>
</html>