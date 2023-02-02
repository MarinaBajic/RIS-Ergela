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
    <title>Error</title>
</head>
<body>

    <%@ include file="header-footer/header.jsp" %>

    <main>
        <h1>Whoops! Došlo je do greške!</h1>
    </main>

    <%@ include file="header-footer/bg.jsp" %>

</body>
</html>