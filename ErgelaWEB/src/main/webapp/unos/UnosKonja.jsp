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
		<input type="text" placeholder="Puno ime" name="punoIme" required><br>
		
		Unesite nadimak:
		<input type="text" placeholder="Nadimak" name="nadimak"><br>
		
		Unesite pol(z,m):
		<input type="text" placeholder="Pol" name="pol" required><br>
		
		Unesite datum rođenja:
		<input type="date" name="datumRodjenja" required><br>
		
		<c:if test="${!empty sveRase}">
			<select name="idRasa" required>
				<c:forEach var="r" items="${sveRase}">
					<option value="${r.idRasa}">${r.naziv} - ${r.boja}</option>
				</c:forEach>
			</select>
		</c:if>
		<br>
		<input type="submit" value="Sačuvaj">
	</form>
	
	<c:if test="${!empty konjUnos}">
		Konj je uspesno sacuvan!<br>
		${konjUnos.punoIme}, ${konjUnos.nadimak}
	</c:if>
	
	<c:if test="${!empty porukaUnosKonja}">${porukaUnosKonja}</c:if>
	
	<br>
	<form action="/ergela/auth/index" method="get">
		<input type="submit" value="Nazad na pocetnu">
	</form>

</body>
</html>