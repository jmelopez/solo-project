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
<title>Upcoming Events</title>

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
    <div class="container">
    	<div class="listings">
	    	<h3>Saved Listings</h3>
	    	<hr>
	    	<c:choose>
	    		<c:when test="${favListings.size() < 1}">
	    			<div>
	    				<h3>You are not currently watching any events.</h3>
	    			</div>
	    		</c:when>
	    		<c:otherwise>
	    			<div>
	    				<c:forEach items="${favListings}" var="favorite">
	    				<p>
							Address: <c:out value="${favorite.address}"/> <c:out value="${favorite.city}"/> <c:out value="${favorite.state}"/> <c:out value="${favorite.zipcode}"/>/>
						</p>
						<p>
							Tags:
							<c:forEach items="${favorite.tags}" var="tag">
								<p><c:out value="${tag}"/></p>
							</c:forEach>
						</p>
						<p>Time till start</p>
	    					
	    				</c:forEach>
	    			</div>
	    		</c:otherwise>
	    	</c:choose>
    	</div>
    	
    	<div class="listings">
	    	<h3>Next 7 Days</h3>
	    	<hr>
	    	<c:choose>
	    		<c:when test="${days <= 7}">
	    			<div>
	    				<h3>You are not currently watching any events.</h3>
	    			</div>
	    		</c:when>
	    		<c:otherwise>
	    			<div class="text-capitalize">
	    				<c:forEach items="${thisWeek}" var="posting">
	    				<p class="fst-italic"><c:out value="${posting.date}"/> </p>
	    				<p class="fw-bold"><a href="listing/${posting.id}"><c:out value="${posting.title}"/></a></p>
	    				<p>
							<span class="fw-bold">Address:</span> <c:out value="${posting.address}"/> <c:out value="${posting.city}"/>, <c:out value="${posting.state}"/> <c:out value="${posting.zipcode}"/>
						</p>
						<p class="tags">
							<span class="fw-bold">Tags:</span>
							<c:forEach items="${posting.tags}" var="tag">
								<c:out value="${tag}"/> |
							</c:forEach>
						</p>
						<p class="fst-italic">Time till start</p>
						<hr class="between_post">
	    					
	    				</c:forEach>
	    			</div>
	    		</c:otherwise>
	    	</c:choose>
    	</div>
    </div>
</body>
</html>