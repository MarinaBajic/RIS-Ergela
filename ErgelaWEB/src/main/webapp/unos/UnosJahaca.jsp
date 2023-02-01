<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Unos jahaca</title>
</head>
<body>

	<form action="/ergela/admin/unesiJahaca" method="post">
		Unesite ime:
		<input type="text" placeholder="Ime" name="ime" required><br>
		
		Unesite prezime:
		<input type="text" placeholder="Prezime" name="prezime" required><br>
		
		Unesite adresu:
		<input type="text" placeholder="Adresa" name="adresa"><br>
		
		Unesite datum rođenja:
		<input type="date" name="datumRodjenja"><br>
		
		<c:if test="${!empty sviTreneri}">
			<select name="idTrener" required>
				<c:forEach var="t" items="${sviTreneri}">
					<option value="${t.idTrener}">${t.ime} ${t.prezime}</option>
				</c:forEach>
			</select>
		</c:if>
		<br>
		<input type="submit" value="Sačuvaj">
	</form>
	
	<c:if test="${!empty jahacUnos}">
		Jahac je uspesno sacuvan!<br>
		${jahacUnos.ime} ${jahacUnos.prezime}, ${jahacUnos.datumRodjenja}
	</c:if>
	<c:if test="${!empty porukaUnosJahaca}">${porukaUnosJahaca}</c:if>
	
	<br>
	<form action="/ergela/auth/index" method="get">
		<input type="submit" value="Nazad na pocetnu">
	</form>

</body>
</html>