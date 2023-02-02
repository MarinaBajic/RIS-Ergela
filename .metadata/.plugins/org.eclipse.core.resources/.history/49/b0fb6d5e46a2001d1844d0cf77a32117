<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prikaz svih jahača</title>
</head>
<body>

	<c:if test="${!empty jahaci}">
		<table border="1">
			<tr>
				<th>Ime</th>
				<th>Prezime</th>
				<th>Datum rođenja</th>
				<th>Adresa</th>
				<th>Datum upisa</th>
			</tr>
			<c:forEach var="j" items="${jahaci}">
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
	<c:if test="${empty jahaci }">fak</c:if>
	
	<br>
	<form action="/ergela/auth/index" method="get">
		<input type="submit" value="Nazad na pocetnu">
	</form>

</body>
</html>