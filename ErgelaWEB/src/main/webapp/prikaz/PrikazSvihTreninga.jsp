<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prikaz svih treninga</title>
</head>
<body>

	<c:if test="${!empty sviTreninzi}">
		<table border="1">
			<tr>
				<th>Ime i prezime jahača</th>
				<th>Nadimak konja</th>
				<th>Datum</th>
				<th>Vreme</th>
				<security:authorize access="hasRole('MENADZER')">
					<th>Obriši</th>
				</security:authorize>
			</tr>
			<c:forEach var="t" items="${sviTreninzi}">
				<tr>
					<td>${t.jahac.ime} ${t.jahac.prezime}</td>
					<td>${t.konj.nadimak}</td>
					<td>${t.datum}</td>
					<td>${t.vreme}</td>
					<security:authorize access="hasRole('MENADZER')">
						<td><a href="/ergela/menadzeri/obrisiTrening?idTrening=${t.idTrening}">Obriši</a></td>
					</security:authorize>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	
	<c:if test="${!empty porukaSviTreninzi}">${porukaSviTreninzi}</c:if>
	<c:if test="${!empty porukaTreningObrisan}">${porukaTreningObrisan}</c:if>
	
	<br>
	<form action="/ergela/auth/index" method="get">
		<input type="submit" value="Nazad na pocetnu">
	</form>

</body>
</html>