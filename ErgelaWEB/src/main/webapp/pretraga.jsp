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
	<title>Pretraga</title>
</head>
<body>

	<%@ include file="header-footer/header.jsp" %>

	<main>
		<h2>Pretraga</h2>
		
		<div class="cards">
			<div class="card">
				<a href="/ergela/nereg/pronadjiKonjaNadimak">Pretraga konja po nadimku</a>
			</div>
			<div class="card">
				<a href="/ergela/nereg/pronadjiKonjeRasa">Pretraga konja po rasi</a>
			</div>
			
			<security:authorize access="hasAnyRole('MENADZER', 'ADMIN')">
				<div class="card">
					<a href="/ergela/menadzeri/pronadjiJahacaPoImenu">Pretraga jahača</a>
				</div>
				<div class="card">
					<a href="/ergela/menadzeri/pronadjiTrening">Pretraga treninga</a>
				</div>
			</security:authorize>
		</div>
	</main>

	<%@ include file="header-footer/bg.jsp" %>
	
</body>
</html>