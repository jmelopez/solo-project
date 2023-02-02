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
<title>Site Home</title>

	<!-- for Bootstrap CSS -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<!-- YOUR own local CSS -->
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<!-- For any Bootstrap that uses JS or jQuery-->
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	
    <title>Address Selection</title>
    <link rel="stylesheet" href="./style.css"/>
    <script src="./app.js"></script>
  </head>
  <body>
    <div class="card-container">
    	<input type="hidden" id="lat" value="${listing.lat}">
		<input type="hidden" id="lng" value="${listing.lng}">
    	<div id="map"></div>
    </div>
	<script
	    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAoGVzc5akCX1cuR-P4i4BWYhLaZV2hFdI&callback=initMap&v=weekly" defer>
	</script>
		<script type="text/javascript" src="/js/script.js"></script> <!-- link javascript file -->
  </body>
</html>