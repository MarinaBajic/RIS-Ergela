<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Unos rase</title>
	<link rel="stylesheet" href="<c:url value="/css/style.css" />"
	type="text/css">
</head>
<body>

	<header>
		<img class="logo" src="<c:url value="/images/Logo.png" />/" alt="Logo">
	
		<nav>
			<p>
				<a href="/ergela/index.jsp">Početna</a>
			</p>
			<p>
				<a href="/ergela/prikaz.jsp">Prikaz</a>
			</p>
			<p>
				<a href="/ergela/pretraga.jsp">Pretraga</a>
			</p>
	
			<security:authorize access="isAuthenticated()">
				<p>
					<a href="/ergela/unos.jsp">Unos</a>
				</p>
	
				<security:authorize access="hasRole('ADMIN')">
					<p>
						<a href="/ergela/izvestaji.jsp">Izveštaji</a>
					</p>
				</security:authorize>
			</security:authorize>
		</nav>
	
		<div class="login">
			<security:authorize access="isAnonymous()">
				<form action="/ergela/auth/loginPage" method="get">
					<input type="submit" value="Login">
				</form>
			</security:authorize>
			<security:authorize access="isAuthenticated()">
				<form action="/ergela/auth/logout" method="get">
					<input type="submit" value="Logout">
				</form>
			</security:authorize>
		</div>
	</header>

	<main>
		<h2>Unos nove rase</h2>

		<div class="main-col">
			<form action="/ergela/admin/unesiRasu" method="post">
				<div class="forma">
					<div class="field">
						<p>Unesite naziv</p>
						<input type="text" placeholder="Naziv rase" name="naziv" required><br>
					</div>
					<div class="field">
						<p>Unesite boju</p>
						<input type="text" placeholder="Boja rase" name="boja" required><br>
					</div>
					<input type="submit" value="Sačuvaj">
				</div>
			</form>
			
			<div class="pretraga">
				<c:if test="${!empty rasaUnos}">
					<p><b>Rasa je uspešno sačuvana!</b></p>
					<p><b>Naziv rase:</b> ${rasaUnos.naziv}</p>
					<p><b>Boja konja:</b> ${rasaUnos.boja}</p>
				</c:if>
				
				<c:if test="${!empty porukaUnosRase}">
					<p>${porukaUnosRase}</p>
				</c:if>
			</div>
		</div>
	</main>
	
	<div class="hero-img">
		<div class="hero-img-overlay"></div>
	</div>

</body>
</html>