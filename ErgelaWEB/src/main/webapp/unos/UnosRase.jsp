<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Unos rase</title>
</head>
<body>

	<form action="/ergela/admin/unesiRasu" method="post">
		Unesite naziv:
		<input type="text" placeholder="Naziv rase" name="naziv"><br>
		
		Unesite boju:
		<input type="text" placeholder="Boja rase" name="boja"><br>
		
		<input type="submit" value="Sačuvaj">
	</form>
	
	<c:if test="${!empty rasa}">
		Rasa je uspesno sacuvana!<br>
		${rasa.naziv}, ${rasa.boja}
	</c:if>
	<c:if test="${empty rasa}">fak</c:if>
	
	<br>
	<form action="/ergela/auth/index" method="get">
		<input type="submit" value="Nazad na pocetnu">
	</form>

</body>
</html>