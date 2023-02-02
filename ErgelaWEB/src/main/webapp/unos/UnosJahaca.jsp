<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="<c:url value="/css/style.css" />"
	type="text/css">
	<title>Unos jahaca</title>
</head>
<body>

	<%@ include file="../header-footer/header.jsp" %>

	<main>
		<h2>Unos novog jahača</h2>

		<div class="main-col">
			<form action="/ergela/admin/unesiJahaca" method="post">
				<div class="forma">
	
					<div class="field">
						<p>Unesite ime</p>
						<input type="text" placeholder="Ime" name="ime" required>
					</div>
					<div class="field">
						<p>Unesite prezime</p>
						<input type="text" placeholder="Prezime" name="prezime" required>
					</div>
					<div class="field">
						<p>Unesite adresu</p>
						<input type="text" placeholder="Adresa" name="adresa">
					</div>
					<div class="field">
						<p>Unesite datum rođenja</p>
						<input type="date" name="datumRodjenja">
					</div>
					<div class="field">
						<c:if test="${!empty sviTreneri}">
							<p>Izaberite trenera</p>
							<select name="idTrener" required>
								<c:forEach var="t" items="${sviTreneri}">
									<option value="${t.idTrener}">${t.ime} ${t.prezime}</option>
								</c:forEach>
							</select>
						</c:if>
					</div>
					<input type="submit" value="Sačuvaj">
				</div>
			</form>
			
			<div class="pretraga">
				<c:if test="${!empty jahacUnos}">
					<p><b>Jahač je uspešno sačuvan!</b></p>
					<p><b>Ime jahača:</b> ${jahacUnos.ime}</p>
					<p><b>Prezime jahača:</b> ${jahacUnos.prezime}</p>
					<p><b>Datum rođenja:</b> ${jahacUnos.datumRodjenja}</p>
				</c:if>

				<c:if test="${!empty porukaUnosJahaca}">
					<p>${porukaUnosJahaca}</p>
				</c:if>
			</div>
		</div>
	</main>
	
	<%@ include file="../header-footer/bg.jsp" %>

</body>
</html>