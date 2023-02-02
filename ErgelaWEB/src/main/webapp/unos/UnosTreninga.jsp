<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Unos treninga</title>
	<link rel="stylesheet" href="<c:url value="/css/style.css" />"
	type="text/css">
</head>
<body>

	<header>
		<img class="logo" src="<c:url value="/images/Logo.png" />/" alt="Logo">
	
		<nav>
			<p>
				<a href="/ergela/index.jsp">Početna</a>
			</p>
			<p>
				<a href="/ergela/prikaz.jsp">Prikaz</a>
			</p>
			<p>
				<a href="/ergela/pretraga.jsp">Pretraga</a>
			</p>
	
			<security:authorize access="isAuthenticated()">
				<p>
					<a href="/ergela/unos.jsp">Unos</a>
				</p>
	
				<security:authorize access="hasRole('ADMIN')">
					<p>
						<a href="/ergela/izvestaji.jsp">Izveštaji</a>
					</p>
				</security:authorize>
			</security:authorize>
		</nav>
	
		<div class="login">
			<security:authorize access="isAnonymous()">
				<form action="/ergela/auth/loginPage" method="get">
					<input type="submit" value="Login">
				</form>
			</security:authorize>
			<security:authorize access="isAuthenticated()">
				<form action="/ergela/auth/logout" method="get">
					<input type="submit" value="Logout">
				</form>
			</security:authorize>
		</div>
	</header>

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
	
	<div class="hero-img">
		<div class="hero-img-overlay"></div>
	</div>

</body>
</html>