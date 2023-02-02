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
	<title>Unos treninga</title>
</head>
<body>

	<%@ include file="../header-footer/header.jsp" %>

	<main>
		<h2>Unos novog treninga</h2>

		<div class="main-col">
			<form action="/ergela/jahaci/unesiTrening" method="post">
				<div class="forma">
					<security:authorize access="hasRole('JAHAC')">
						<c:if test="${!empty ulogovaniJahac}">
							<p>Unos treninga za jahaca: ${ulogovaniJahac.ime} ${ulogovaniJahac.prezime}</p>
						</c:if>
					</security:authorize>
					<security:authorize access="hasAnyRole('MENADZER', 'ADMIN')">
						<div class="field">
							<c:if test="${!empty sviJahaci}">
								<p>Izaberite jahača</p>
								<select name="idJahac" required>
									<c:forEach var="j" items="${sviJahaci}">
										<option value="${j.idJahac}">${j.ime} ${j.prezime}</option>
									</c:forEach>
								</select>
							</c:if>
						</div>
					</security:authorize>
					<div class="field">
						<c:if test="${!empty sviKonji}">
							<p>Izaberite konja</p>
							<select name="idKonj" required>
								<c:forEach var="k" items="${sviKonji}">
									<option value="${k.idKonj}">${k.punoIme}, ${k.nadimak}</option>
								</c:forEach>
							</select>
						</c:if>
					</div>
					<div class="field">
						<p>Unesite datum</p>
						<input type="date" name="datum" required><br>
					</div>
					<div class="field">
						<p>Unesite vreme treninga</p>
						<input type="text" placeholder="Vreme treninga" name="vreme" required><br>
					</div>
					<input type="submit" value="Sačuvaj">
				</div>
			</form>
			
			<div class="pretraga">
				<c:if test="${!empty trening}">
					<p>Trening je uspesno sačuvan!</p>
					<p><b>Ime i prezime jahača:</b> ${trening.jahac.ime} ${trening.jahac.prezime}</p>
					<p><b>Datum:</b> ${trening.datum}</p>
					<p><b>Vreme:</b> ${trening.vreme}</p>
				</c:if>
				
				<c:if test="${!empty porukaUnosTreninga}">
					<p>${porukaUnosTreninga}</p>
				</c:if>
			</div>
		</div>
	</main>
	
	<%@ include file="../header-footer/bg.jsp" %>

</body>
</html>