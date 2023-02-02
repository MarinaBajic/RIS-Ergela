<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Prikaz svih konja</title>
	<link rel="stylesheet" href="<c:url value="/css/style.css" />" type="text/css">
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
		<h2>Prikaz svih konja</h2>

		<c:if test="${!empty sviKonji}">
			<table>
				<tr>
					<th>Puno ime</th>
					<th>Nadimak</th>
					<th>Pol</th>
					<th>Datum rođenja</th>
					<th>Rasa</th>
					<security:authorize access="hasRole('JAHAC')">
						<th>Omiljeni</th>
					</security:authorize>
					<security:authorize access="hasRole('ADMIN')">
						<th>Promena nadimka</th>
					</security:authorize>
				</tr>
				<c:forEach var="k" items="${sviKonji}">
					<tr>
						<td>${k.punoIme}</td>
						<td>${k.nadimak}</td>
						<td>${k.pol}</td>
						<td>${k.datumRodjenja}</td>
						<td>${k.rasa.naziv}</td>
						<security:authorize access="hasRole('JAHAC')">
							<td><a href="/ergela/jahaci/dodajKonjaUOmiljene?idKonj=${k.idKonj}">Dodaj u omiljene</a></td>
						</security:authorize>
						<security:authorize access="hasRole('ADMIN')">
							<td><a href="/ergela/admin/promeniNadimakKonju?idKonj=${k.idKonj}">Promeni nadimak</a></td>
						</security:authorize>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<c:if test="${!empty porukaSviKonji}">
			<p>${porukaSviKonji}</p>
		</c:if>

		<c:if test="${!empty porukaOmiljeni}">
			<p>${porukaOmiljeni}</p>
		</c:if>
	</main>

	<div class="hero-img">
		<div class="hero-img-overlay"></div>
	</div>

</body>
</html>