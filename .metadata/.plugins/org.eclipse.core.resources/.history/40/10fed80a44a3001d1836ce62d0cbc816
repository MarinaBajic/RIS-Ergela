<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Omiljeni konji</title>
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
		<h2>Moji omiljeni konji</h2>

		<c:if test="${!empty omiljeni}">
			Omiljeni konji za jahača: ${ulogovaniJahac.ime} ${ulogovaniJahac.prezime}
			<br>
			<table>
				<tr>
					<th>Puno ime</th>
					<th>Nadimak</th>
					<th>Pol</th>
					<th>Datum rođenja</th>
					<th>Rasa</th>
					<th>Obriši</th>
				</tr>
				<c:forEach var="o" items="${omiljeni}">
					<tr>
						<td>${o.konj.punoIme}</td>
						<td>${o.konj.nadimak}</td>
						<td>${o.konj.pol}</td>
						<td>${o.konj.datumRodjenja}</td>
						<td>${o.konj.rasa.naziv}</td>
						<td><a href="/ergela/jahaci/obrisiOmiljenogKonja?idOmiljeni=${o.idOmiljeni}">Obriši</a></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>

		<c:if test="${!empty porukaPrikazOmiljeni}">
			<p>${porukaPrikazOmiljeni}</p>
		</c:if>

		<c:if test="${!empty porukaOmiljeniKonjObrisan}">
			<p>${porukaOmiljeniKonjObrisan}</p>
		</c:if>
	</main>
	

	<div class="hero-img">
		<div class="hero-img-overlay"></div>
	</div>

</body>
</html>