<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Prikaz treninga</title>
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
		<h2>Prikaz treninga</h2>
		
		<c:if test="${!empty sviTreninzi}">
			<table>
				<tr>
					<security:authorize access="hasAnyRole('MENADZER', 'ADMIN')">
						<th>Ime i prezime jahača</th>
					</security:authorize>
					<th>Nadimak konja</th>
					<th>Datum</th>
					<th>Vreme</th>
					<security:authorize access="hasAnyRole('MENADZER', 'ADMIN')">
						<th>Obriši</th>
					</security:authorize>
				</tr>
				<c:forEach var="t" items="${sviTreninzi}">
					<tr>
						<security:authorize access="hasAnyRole('MENADZER', 'ADMIN')">
							<td>${t.jahac.ime} ${t.jahac.prezime}</td>
						</security:authorize>
						<td>${t.konj.nadimak}</td>
						<td>${t.datum}</td>
						<td>${t.vreme}</td>
						<security:authorize access="hasAnyRole('MENADZER', 'ADMIN')">
							<td><a href="/ergela/menadzeri/obrisiTrening?idTrening=${t.idTrening}">Obriši</a></td>
						</security:authorize>
					</tr>
				</c:forEach>
			</table>
		</c:if>

		<c:if test="${!empty porukaSviTreninzi}">
			<p>${porukaSviTreninzi}</p>
		</c:if>

		<c:if test="${!empty porukaTreningObrisan}">
			<p>${porukaTreningObrisan}</p>
		</c:if>
	</main>
	
	
	<div class="hero-img">
		<div class="hero-img-overlay"></div>
	</div>

</body>
</html>