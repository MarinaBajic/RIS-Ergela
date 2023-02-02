<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="<c:url value="/css/style.css" />"
	type="text/css">
	<title>Registracija</title>
</head>
<body>

	<%@ include file="header-footer/header.jsp" %>

	<main>
		<h2>Register</h2>

		<sf:form modelAttribute="korisnik" action="/ergela/auth/register" method="post">
			<div class="register forma">
				<div class="reg-row">
					<div class="reg-col">
						<div class="field">
							<p>Ime</p>
							<sf:input path="ime" placeholder="Unesite ime" required="true"/>
						</div>
						<div class="field">
							<p>Prezime</p>
							<sf:input path="prezime" placeholder="Unesite prezime" required="true"/>
						</div>
						<div class="field">
							<p>Email</p>
							<input type="text" name="email"	placeholder="Unesite email">
						</div>
						<div class="field">
							<p>Unesite datum rođenja</p>
							<input type="date" name="datumRodjenja">
						</div>
					</div>
					<div class="reg-col">
						<div class="field">
							<p>Korisničko ime</p>
							<sf:input path="korisnickoIme" placeholder="Unesite korisničko ime" required="true"/>
						</div>
						<div class="field">
							<p>Lozinka</p>
							<sf:password path="lozinka" placeholder="Unesite lozinku" required="true"/>
						</div>
						<div class="field">
							<p>Uloga</p>
							<sf:select path="ulogas" items="${uloge}" itemValue="idUloga" itemLabel="naziv" required="true"/>
						</div>
					</div>
				</div>
				<div class="reg-row">
					<input type="submit" value="Sacuvaj">
				</div>
			</div>	
		</sf:form>
	</main>

	<%@ include file="header-footer/bg.jsp" %>

</body>
</html>