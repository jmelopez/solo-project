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
</head>
<body>
	<div class="container">
		<div class="header mt-4">
  			<h2>Login</h2>
  		</div>
  		
  		<div class="form">
			<form:form action="/account/update/${user.id}" method="POST" modelAttribute="user">
     			<input type="hidden" name="_method" value="put">
     			
			    <div class="errors text-danger">
			        <p><form:errors path="firstName"/></p>
			        <p><form:errors path="lastName"/></p>
			        <p><form:errors path="dob"/></p>
			        <p><form:errors path="zipcode"/></p>
			        <p><form:errors path="email"/></p>
			    </div>
			    
			    <div class="form_input row mb-3">
			        <form:label path="firstName" class="col-sm-4 col-form-label">First Name:</form:label>
			        <div class="col-sm-8">
			            <form:input path="firstName" class="form-control" value="${user.firstName}"/>
			        </div>
			    </div>
			    
			    <div class="form_input row mb-3">
			        <form:label path="lastName" class="col-sm-4 col-form-label">Last Name:</form:label>
			        <div class="col-sm-8">
			            <form:input path="lastName" class="form-control" value="${user.lastName}"/>
			        </div>
			    </div>
			    
			    <div class="form_input row mb-3">
			        <form:label path="dob" class="col-sm-4 col-form-label">Date of Birth:</form:label>
			        <div class="col-sm-8">
			            <input class="form-control" value="${user.dob}" disabled="disabled"/>
			        </div>        
			    </div>
			
			    <div class="form_input row mb-3">
			        <form:label path="zipcode" class="col-sm-4 col-form-label">Zip Code:</form:label>
			        <div class="col-sm-8">
			            <form:input path="zipcode" class="form-control" value="${user.zipcode}"/>
			        </div>        
			    </div>
			    
			    <div class="form_input row mb-3">
			        <form:label path="email" class="col-sm-4 col-form-label">Email Address:</form:label>
			        <div class="col-sm-8">
			            <form:input path="email" class="form-control" value="${user.email}"/>
			        </div>
			    </div>
			    
			    <div class="row mt-4">
                   	<div class="btn col-6 fs-5">
	                    <a href="/dashboard">Cancel</a>
                   	</div>
                    <div class="btn-div d-grid gap-2 col-6">
                        <button class="form-btn btn btn-primary" type="submit">Update Account</button>
                    </div>                    
                 </div>
			    
      		</form:form>
		</div>        		        
	</div>