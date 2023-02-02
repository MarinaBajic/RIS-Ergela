<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Prikaz svih jahača</title>
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
		<h2>Prikaz svih jahača</h2>

		<c:if test="${!empty sviJahaci}">
			<table>
				<tr>
					<th>Ime</th>
					<th>Prezime</th>
					<th>Datum rođenja</th>
					<th>Adresa</th>
					<th>Datum upisa</th>
				</tr>
				<c:forEach var="j" items="${sviJahaci}">
					<tr>
						<td>${j.ime}</td>
						<td>${j.prezime}</td>
						<td>${j.datumRodjenja}</td>
						<td>${j.adresa}</td>
						<td>${j.datumUpisa}</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</main>
	
	<c:if test="${!empty porukaSviJahaci}">
		<p>${porukaSviJahaci}</p>
	</c:if>
	
	<div class="hero-img">
		<div class="hero-img-overlay"></div>
	</div>

</body>
</html>