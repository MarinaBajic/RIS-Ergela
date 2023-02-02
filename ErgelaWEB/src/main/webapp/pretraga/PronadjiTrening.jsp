<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="<c:url value="/css/style.css" />"
	type="text/css">
	<title>Pretraga treninga</title>
</head>
<body>

	<%@ include file="../header-footer/header.jsp" %>

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
	
	<%@ include file="../header-footer/bg.jsp" %>

</body>
</html>