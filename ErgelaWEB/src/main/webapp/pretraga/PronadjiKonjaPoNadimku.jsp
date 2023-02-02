<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Pretraga konja po nadimku</title>
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
		<h2>Pretraga konja</h2>

		<form action="/ergela/nereg/findKonjaNadimak" method="get">
			<div class="forma">
				<div class="field">
					<p>Unesite nadimak konja</p>
					<input type="text" placeholder="Nadimak" name="nadimak" required>
				</div>
				<input type="submit" value="Prikazi">
			</div>
		</form>
		
		<div class="pretraga">
			<c:if test="${!empty konjNadimak}">
				<p><b>Traženi konj je:</b></p>
				<p><b>Puno ime:</b> ${konjNadimak.punoIme}</p>
				<p><b>Nadimak:</b> ${konjNadimak.nadimak}</p>
				<p><b>Pol:</b> ${konjNadimak.pol}</p>
				<p><b>Datum rođenja:</b> ${konjNadimak.datumRodjenja}</p>
				<p><b>Naziv rase:</b> ${konjNadimak.rasa.naziv}</p>
			</c:if>
			
			<c:if test="${!empty porukaKonjNadimak}">
				<p>${porukaKonjNadimak}</p>
			</c:if>
		</div>
	</main>
	
	<div class="hero-img">
		<div class="hero-img-overlay"></div>
	</div>

</body>
</html>