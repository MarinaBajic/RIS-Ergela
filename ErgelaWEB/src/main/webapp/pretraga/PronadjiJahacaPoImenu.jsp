<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pronadji jahaca po imenu</title>
</head>
<body>

	<form action="/ergela/menadzeri/getJahacIme" method="get">
		Unesite ime:
		<input type="text" placeholder="Ime" name="ime" required><br>
		Unesite prezime:
		<input type="text" placeholder="Prezime" name="prezime" required><br>
		<input type="submit" value="Prikazi">
	</form>
	
	<c:if test="${!empty jahacIme}">
		${jahacIme.ime} ${jahacIme.prezime}, ${jahacIme.datumRodjenja}
	</c:if>
	
	<c:if test="${!empty porukaNijeNadjenJahac}">${porukaNijeNadjenJahac}</c:if>
	
	<br>
	<form action="/ergela/auth/index" method="get">
		<input type="submit" value="Nazad na pocetnu">
	</form>

</body>
</html>