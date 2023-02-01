<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Odabir jahača za izveštaj</title>
</head>
<body>

	<form action="/ergela/admin/generisiIzvestajTreninziZaJahaca" method="get">
		Odaberite jahaca:
		<c:if test="${!empty sviJahaci}">
			<select name="idJahac" required>
				<c:forEach var="j" items="${sviJahaci}">
					<option value="${j.idJahac}">${j.ime} ${j.prezime}</option>
				</c:forEach>
			</select>
			<br>
			<input type="submit" value="Izaberi">
		</c:if>
	</form>
	
	<c:if test="${!empty porukaIzvestaj}">${porukaIzvestaj}</c:if>
	
	<br>
	<form action="/ergela/auth/index" method="get">
		<input type="submit" value="Nazad na pocetnu">
	</form>

</body>
</html>