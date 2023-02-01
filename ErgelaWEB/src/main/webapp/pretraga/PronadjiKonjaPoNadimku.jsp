<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pretraga konja po nadimku</title>
</head>
<body>

	<form action="/ergela/nereg/findKonjaNadimak" method="get">
		Unesite nadimak konja:
		<input type="text" placeholder="Nadimak" name="nadimak" required>
		<input type="submit" value="Prikazi">
	</form>
	
	<c:if test="${!empty konjNadimak}">
		Puno ime:       ${konjNadimak.punoIme}<br>
		Nadimak:        ${konjNadimak.nadimak}<br>
		Pol:            ${konjNadimak.pol}<br>
		Datum rodjenja: ${konjNadimak.datumRodjenja}<br>
		Naziv rase:     ${konjNadimak.rasa.naziv}<br>
	</c:if>
	
	<c:if test="${!empty porukaKonjNadimak}">${porukaKonjNadimak}</c:if>
	
	<br>
	<form action="/ergela/auth/index" method="get">
		<input type="submit" value="Nazad na pocetnu">
	</form>

</body>
</html>