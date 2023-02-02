<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Izvestaji</title>
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
		<h2>Izveštaji</h2>

		<div class="cards">
			<div class="card">
				<a href="/ergela/admin/izvestajSviTreninzi">Izvestaj o treninzima</a>
			</div>
			<div class="card">
				<a href="/ergela/admin/izvestajTreninziZaJahaca">Izvestaj o treninzima za jahaca</a>
			</div>
		</div>
	</main>

	<div class="hero-img">
		<div class="hero-img-overlay"></div>
	</div>

</body>
</html>