<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Unos treninga</title>
</head>
<body>

	<form action="/ergela/jahaci/unesiTrening" method="post">
		<security:authorize access="hasRole('JAHAC')">
			<c:if test="${!empty ulogovaniJahac}">
				Unos treninga za jahaca: ${ulogovaniJahac.ime} ${ulogovaniJahac.prezime}
			</c:if>
		</security:authorize>
		<security:authorize access="hasAnyRole('MENADZER', 'ADMIN')">
			<c:if test="${!empty sviJahaci}">
				<select name="idJahac" required>
					<c:forEach var="j" items="${sviJahaci}">
						<option value="${j.idJahac}">${j.ime} ${j.prezime}</option>
					</c:forEach>
				</select>
			</c:if>
		</security:authorize>
		<br>
		<c:if test="${!empty sviKonji}">
			<select name="idKonj" required>
				<c:forEach var="k" items="${sviKonji}">
					<option value="${k.idKonj}">${k.punoIme}, ${k.nadimak}</option>
				</c:forEach>
			</select>
		</c:if>
		<br>
		Unesite datum:
		<input type="date" name="datum" required><br>
		
		Unesite vreme treninga:
		<input type="text" placeholder="Vreme treninga" name="vreme" required><br>
		
		<input type="submit" value="Sačuvaj">
	</form>
	
	<c:if test="${!empty trening}">
		Trening je uspesno sacuvan!<br>
		${trening.jahac.ime} ${trening.jahac.prezime}, ${trening.datum}
	</c:if>
	
	<c:if test="${!empty porukaUnosTreninga}">${porukaUnosTreninga}</c:if>
	
	<br>
	<form action="/ergela/auth/index" method="get">
		<input type="submit" value="Nazad na pocetnu">
	</form>

</body>
</html>