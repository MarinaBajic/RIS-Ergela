<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Unos entiteta</title>
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
		<h2>Unos</h2>

		<div class="cards">
			<security:authorize access="hasRole('JAHAC')">
				<div class="card">
					<a href="/ergela/jahaci/getJahacAndKonji">Unos treninga</a>
				</div>
			</security:authorize>
			
			<security:authorize access="hasAnyRole('MENADZER', 'ADMIN')">
				<div class="card">
					<a href="/ergela/menadzeri/getJahaciAndKonji">Unos treninga</a>
				</div>
			</security:authorize>
			
			<security:authorize access="hasRole('ADMIN')">
				<div class="card">
					<a href="/ergela/admin/getSviTreneri">Unos jahača</a>
				</div>
				<div class="card">
					<a href="/ergela/admin/getSveRase">Unos konja</a>
				</div>
				<div class="card">
					<a href="/ergela/admin/unosRase">Unos rase</a>
				</div>
				<div class="card">
					<a href="/ergela/admin/unosTrenera">Unos trenera</a><br>
				</div>
			</security:authorize>
		</div>
	</main>

	<div class="hero-img">
		<div class="hero-img-overlay"></div>
	</div>
	
</body>
</html>