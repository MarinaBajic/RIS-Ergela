<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="<c:url value="/css/style.css" />"
	type="text/css">
	<title>Unos entiteta</title>
</head>
<body>

	<%@ include file="header-footer/header.jsp" %>

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

	<%@ include file="header-footer/bg.jsp" %>
	
</body>
</html>