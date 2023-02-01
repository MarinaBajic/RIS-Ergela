<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Unos konja</title>
</head>
<body>

	<form action="/ergela/admin/unesiKonja" method="post">
		Unesite puno ime:
		<input type="text" placeholder="Puno ime" name="punoIme"><br>
		
		Unesite nadimak:
		<input type="text" placeholder="Nadimak" name="nadimak"><br>
		
		Unesite pol(z,m):
		<input type="text" placeholder="Pol" name="pol"><br>
		
		Unesite datum rođenja:
		<input type="date" name="datumRodjenja"><br>
		
		<c:if test="${!empty rase}">
			<select name="idRasa">
				<c:forEach var="r" items="${rase}">
					<option value="${r.idRasa}">${r.naziv} - ${r.boja}</option>
				</c:forEach>
			</select>
		</c:if>
		<br>
		<input type="submit" value="Sačuvaj">
	</form>
	
	<c:if test="${!empty konj}">
		Konj je uspesno sacuvan!<br>
		${konj.punoIme}, ${konj.nadimak}
	</c:if>
	<c:if test="${empty konj}">fak</c:if>
	
	<br>
	<form action="/ergela/auth/index" method="get">
		<input type="submit" value="Nazad na pocetnu">
	</form>

</body>
</html>