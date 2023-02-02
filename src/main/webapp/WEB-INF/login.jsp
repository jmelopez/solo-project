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
    <div class="container container-forms">
       	<div class="nav">
       		<h1 class="page-head">Site</h1>
       	</div>
        <div class="content mt-4">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
			<c:choose>
				<c:when test="${invalid == true}">
			  		<li class="nav-item" role="presentation">
				    	<button class="nav-link" id="login-tab" data-bs-toggle="tab" data-bs-target="#login-tab-pane" type="button" role="tab" aria-controls="login-tab-pane" aria-selected="false">Login</button>
				  	</li>
				  	<li class="nav-item" role="presentation">
				    	<button class="nav-link active" id="register-tab" data-bs-toggle="tab" data-bs-target="#register-tab-pane" type="button" role="tab" aria-controls="register-tab-pane" aria-selected="true">Register Now!</button>
				  	</li>			  
				  </c:when>
				  <c:otherwise> 
				  	<li class="nav-item" role="presentation">
				    	<button class="nav-link active" id="login-tab" data-bs-toggle="tab" data-bs-target="#login-tab-pane" type="button" role="tab" aria-controls="login-tab-pane" aria-selected="true">Login</button>
				  	</li>
				  	<li class="nav-item" role="presentation">
				    	<button class="nav-link" id="register-tab" data-bs-toggle="tab" data-bs-target="#register-tab-pane" type="button" role="tab" aria-controls="register-tab-pane" aria-selected="false">Register Now!</button>
				  	</li>
				  </c:otherwise>
			</c:choose>
			
			</ul>
			
			<div class="tab-content" id="myTabContent">
				<c:choose>
					<c:when test="${invalid == true}">
					<div class="tab-pane fade" id="login-tab-pane" role="tabpanel" aria-labelledby="login-tab" tabindex="0">        	
						<div class="content-right">	 
						       	
			        		<div class="header mt-4">
			        			<h2>Login</h2>
			        		</div>
			        		
			        		<div class="form">
			        			<form:form action="/login" method="POST" modelAttribute="newLogin">
			        				<div class="errors text-danger">
			                            <p><form:errors path="email"/></p>
			                            <p><form:errors path="password"/></p>
			                        </div>
			        				
			        				<div class="form_input row mb-3">
				        				<form:label path="email" class="col-sm-3 col-form-label">Email Address:</form:label>
				        				<div class="col-sm-9">
				        					<form:input path="email" class="form-control"/>
				        				</div>
				        			</div>
				        			
				        			<div class="form_input row mb-3">
				        				<form:label path="password" class="col-sm-3 col-form-label">Password:</form:label>
				        				<div class="col-sm-9">
				        					<form:input path="password" type="password" class="form-control"/>
				        				</div>	        			
				        			</div>
				        			
			    					<div class="btn-div d-grid gap-2 col-12">
									  <button class="btn btn-primary" type="submit">Login</button>
									</div>			        			
			        			</form:form>
			        		</div>
			        		
			        	</div>	
		        	</div>						
					</c:when>
					<c:otherwise>
					<div class="tab-pane fade show active" id="login-tab-pane" role="tabpanel" aria-labelledby="login-tab" tabindex="0">        	
					<div class="content-right">	 
					       	
		        		<div class="header mt-4">
		        			<h2>Login</h2>
		        		</div>
		        		
		        		<div class="form">
		        			<form:form action="/login" method="POST" modelAttribute="newLogin">
		        				<div class="errors text-danger">
		                            <p><form:errors path="email"/></p>
		                            <p><form:errors path="password"/></p>
		                        </div>
		        				
		        				<div class="form_input row mb-3">
			        				<form:label path="email" class="col-sm-3 col-form-label">Email Address:</form:label>
			        				<div class="col-sm-9">
			        					<form:input path="email" class="form-control"/>
			        				</div>
			        			</div>
			        			
			        			<div class="form_input row mb-3">
			        				<form:label path="password" class="col-sm-3 col-form-label">Password:</form:label>
			        				<div class="col-sm-9">
			        					<form:input path="password" type="password" class="form-control"/>
			        				</div>	        			
			        			</div>
			        			
		    					<div class="btn-div d-grid gap-2 col-12">
								  <button class="btn btn-primary" type="submit">Login</button>
								</div>			        			
		        			</form:form>
		        		</div>
		        		
		        	</div>	
	        	</div>
					</c:otherwise>
				</c:choose>
	        	<c:choose>
	        		<c:when test ="${invalid == true}">
						<div  class="tab-pane fade show active" id="register-tab-pane" role="tabpanel" aria-labelledby="register-tab" tabindex="1">      	
						<div class="content-left">
								
			        		<div class="header mt-4">
			        			<h2>Register Now!</h2>
			        		</div>
			        		
			        		<div class="form">
			        			<form:form action="/register" method="POST" modelAttribute="newUser">
			        			
								    <div class="errors text-danger">
								        <p><form:errors path="firstName"/></p>
								        <p><form:errors path="lastName"/></p>
								        <p><form:errors path="dob"/></p>
								        <p><form:errors path="zipcode"/></p>
								        <p><form:errors path="email"/></p>
								        <p><form:errors path="password"/></p>
								        <p><form:errors path="confirm"/></p>
								    </div>
								    
								    <p class="text-danger"><c:out value="${ageError}"/></p>
								    
								    <div class="form_input row mb-3">
								        <form:label path="firstName" class="col-sm-4 col-form-label">First Name:</form:label>
								        <div class="col-sm-8">
								            <form:input path="firstName" class="form-control"/>
								        </div>
								    </div>
								    
								    <div class="form_input row mb-3">
								        <form:label path="lastName" class="col-sm-4 col-form-label">Last Name:</form:label>
								        <div class="col-sm-8">
								            <form:input path="lastName" class="form-control"/>
								        </div>
								    </div>
								    <div class="form_input row mb-3">
								        <form:label path="dob" class="col-sm-4 col-form-label">Date of Birth:</form:label>
								        <div class="col-sm-8">
								            <form:input path="dob" type="date" class="form-control"/>
								        </div>        
								    </div>
								
								    <div class="form_input row mb-3">
								        <form:label path="zipcode" class="col-sm-4 col-form-label">Zip Code:</form:label>
								        <div class="col-sm-8">
								            <form:input path="zipcode" class="form-control"/>
								        </div>        
								    </div>
								    
								    <div class="form_input row mb-3">
								        <form:label path="email" class="col-sm-4 col-form-label">Email Address:</form:label>
								        <div class="col-sm-8">
								            <form:input path="email" class="form-control"/>
								        </div>
								    </div>
								    
								    <div class="form_input row mb-3">
								        <form:label path="password" class="col-sm-4 col-form-label">Password:</form:label>
								        <div class="col-sm-8">
								            <form:input path="password" type="password" class="form-control"/>
								        </div>
								    </div>
								    
								    <div class="form_input row mb-3">
								        <form:label path="confirm" class="col-sm-4 col-form-label">Confirm Password:</form:label>
								        <div class="col-sm-8">
								            <form:input path="confirm" type="password" class="form-control"/>
								        </div>
								    </div>
								    
								    <div class="btn-div d-grid gap-2 col-12">
								        <button class="btn btn-primary" type="submit">Register</button>
								    </div>
				        		
				        		</form:form>
				        	</div>        		        	
			        	</div>
		        	</div>
	        		</c:when>
	        		<c:otherwise>
	        		<div  class="tab-pane fade" id="register-tab-pane" role="tabpanel" aria-labelledby="register-tab" tabindex="1">      	
						<div class="content-left">
								
			        		<div class="header mt-4">
			        			<h2>Register Now!</h2>
			        		</div>
			        		
			        		<div class="form">
			        			<form:form action="/register" method="POST" modelAttribute="newUser">
			        			
								    <div class="errors text-danger">
								        <p><form:errors path="firstName"/></p>
								        <p><form:errors path="lastName"/></p>
								        <p><form:errors path="dob"/></p>
								        <p><form:errors path="zipcode"/></p>
								        <p><form:errors path="email"/></p>
								        <p><form:errors path="password"/></p>
								        <p><form:errors path="confirm"/></p>
								    </div>
								    
								    <p class="text-danger"><c:out value="${ageError}"/></p>
								    
								    <div class="form_input row mb-3">
								        <form:label path="firstName" class="col-sm-4 col-form-label">First Name:</form:label>
								        <div class="col-sm-8">
								            <form:input path="firstName" class="form-control"/>
								        </div>
								    </div>
								    
								    <div class="form_input row mb-3">
								        <form:label path="lastName" class="col-sm-4 col-form-label">Last Name:</form:label>
								        <div class="col-sm-8">
								            <form:input path="lastName" class="form-control"/>
								        </div>
								    </div>
								    <div class="form_input row mb-3">
								        <form:label path="dob" class="col-sm-4 col-form-label">Date of Birth:</form:label>
								        <div class="col-sm-8">
								            <form:input path="dob" type="date" class="form-control"/>
								        </div>        
								    </div>
								
								    <div class="form_input row mb-3">
								        <form:label path="zipcode" class="col-sm-4 col-form-label">Zip Code:</form:label>
								        <div class="col-sm-8">
								            <form:input path="zipcode" class="form-control"/>
								        </div>        
								    </div>
								    
								    <div class="form_input row mb-3">
								        <form:label path="email" class="col-sm-4 col-form-label">Email Address:</form:label>
								        <div class="col-sm-8">
								            <form:input path="email" class="form-control"/>
								        </div>
								    </div>
								    
								    <div class="form_input row mb-3">
								        <form:label path="password" class="col-sm-4 col-form-label">Password:</form:label>
								        <div class="col-sm-8">
								            <form:input path="password" type="password" class="form-control"/>
								        </div>
								    </div>
								    
								    <div class="form_input row mb-3">
								        <form:label path="confirm" class="col-sm-4 col-form-label">Confirm Password:</form:label>
								        <div class="col-sm-8">
								            <form:input path="confirm" type="password" class="form-control"/>
								        </div>
								    </div>
								    
								    <div class="btn-div d-grid gap-2 col-12">
								        <button class="btn btn-primary" type="submit">Register</button>
								    </div>
				        		
				        		</form:form>
				        	</div>        		        	
			        	</div>
		        	</div>
	        		</c:otherwise>
	        	</c:choose>
			</div>
        </div>
    </div>
		
		<script type="text/javascript" src="/js/script.js"></script> <!-- link javascript file -->
</body>
</html>