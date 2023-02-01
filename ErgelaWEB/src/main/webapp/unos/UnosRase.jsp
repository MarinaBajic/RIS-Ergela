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
		<input type="text" placeholder="Naziv rase" name="naziv" required><br>
		
		Unesite boju:
		<input type="text" placeholder="Boja rase" name="boja" required><br>
		
		<input type="submit" value="Sačuvaj">
	</form>
	
	<c:if test="${!empty rasaUnos}">
		Rasa je uspesno sacuvana!<br>
		${rasaUnos.naziv}, ${rasaUnos.boja}
	</c:if>
	
	<c:if test="${!empty porukaUnosRase}">${porukaUnosRase}</c:if>
	
	<br>
	<form action="/ergela/auth/index" method="get">
		<input type="submit" value="Nazad na pocetnu">
	</form>

</body>
</html>