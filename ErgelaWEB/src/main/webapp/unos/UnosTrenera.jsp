<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Unos trenera</title>
</head>
<body>

	<form action="/ergela/admin/unesiTrenera" method="post">
		Unesite ime:
		<input type="text" placeholder="Ime" name="ime" required><br>
		
		Unesite prezime:
		<input type="text" placeholder="Prezime" name="prezime" required><br>
		
		Unesite broj godina iskustva:
		<input type="number" placeholder="Broj godina iskustva" name="godIskustva"><br>
		
		<input type="submit" value="Sačuvaj">
	</form>
	
	<c:if test="${!empty trenerUnos}">
		Trener je uspesno sacuvan!<br>
		${trenerUnos.ime} ${trenerUnos.prezime} [${trenerUnos.godIskustva}]
	</c:if>
	
	<c:if test="${!empty porukaUnosTrenera}">${porukaUnosTrenera}</c:if>
	
	<br>
	<form action="/ergela/auth/index" method="get">
		<input type="submit" value="Nazad na pocetnu">
	</form>

</body>
</html>