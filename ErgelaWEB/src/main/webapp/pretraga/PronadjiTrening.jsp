<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Pretraga treninga</title>
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
		<h2>Pretraga treninga</h2>

		<div class="main-col">
			<form action="/ergela/menadzeri/getTrening" method="get">
				<div class="forma">
					<div class="field">
						<p>Unesite datum</p>
						<input type="date" name="datum" required><br>
					</div>
					<div class="field">
						<p>Ime i prezime jahača</p>
						<input type="text" placeholder="Unesite ime" name="imePrezime" required><br>
					</div>
					<div class="field">
						<p>Nadimak konja</p>
						<input type="text" placeholder="Nadimak konja" name="nadimak" required><br>
					</div>
					
					<input type="submit" value="Prikazi">
				</div>
			</form>
			
			<c:if test="${!empty treninziPretraga}">
				<table>
					<tr>
						<th>Datum</th>
						<th>Jahač</th>
						<th>Konj</th>
						<th>Vreme</th>
					</tr>
					<c:forEach var="t" items="${treninziPretraga}">
						<tr>
							<td>${t.datum}</td>
							<td>${t.jahac.ime} ${t.jahac.prezime}</td>
							<td>${t.konj.nadimak}</td>
							<td>${t.vreme}</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			
			<c:if test="${!empty porukaPretragaTreninga}">
				<p>${porukaPretragaTreninga}</p>
			</c:if>
		</div>
	</main>
	
	<div class="hero-img">
		<div class="hero-img-overlay"></div>
	</div>

</body>
</html>