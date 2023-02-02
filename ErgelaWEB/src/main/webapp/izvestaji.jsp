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
	<title>Izvestaji</title>
</head>
<body>

	<%@ include file="header-footer/header.jsp" %>

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

	<%@ include file="header-footer/bg.jsp" %>

</body>
</html>