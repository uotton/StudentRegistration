<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Registered Entrants</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
table {
	margin-left: 20%;
}
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
th, td, h2 {
	padding: 15px;
	text-align: center;
}
</style>
</head>

<body>
	<!-- Sidebar -->
	<div class="w3-sidebar w3-light-grey w3-bar-block" style="width: 10%">
		<h3 class="w3-bar-item">Menu</h3>
		<a href="/home" class="w3-bar-item w3-button">Home</a>
		<security:authorize access="hasRole('ROLE_ADMIN')">
			<a href="/create-faculty" class="w3-bar-item w3-button">Create Faculty</a>
			<a href="/registeredEntrants" class="w3-bar-item w3-button">Registered Entrants</a>
		</security:authorize>
	</div>

	<!-- Page Content -->
	<div style="margin-left: 10%">
		<div class="w3-container w3-teal">
			<h1>Rating</h1>
		</div>

		<div class="container" style="margin-left: 1%">
			<c:if test="${pageContext.request.userPrincipal.name != null}">
				<form id="logoutForm" method="POST" action="${contextPath}/logout">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>

				<h2>
					Welcome ${pageContext.request.userPrincipal.name} | <a
						onclick="document.forms['logoutForm'].submit()">Logout</a>
				</h2>
			</c:if>
		</div>

		<h2>Rating of faculty with name ${faculty.name}</h2>

		<c:if test="${not empty statements}">
			<table style="width: 60%">
				<tr>
					<th>First name</th>
					<th>Second name</th>
					<th colspan="4">Marks</th>
					<th>Is Accepted?</th>
				</tr>
				<c:forEach items="${statements}" var="currentStatement"
					varStatus="status">
					<tr>
						<td rowspan="2">${users[status.index].firstName}</td>
						<td rowspan="2">${users[status.index].secondName}</td>

						<c:forEach items="${faculty.subjects}" var="currentSubject">
							<td>${currentSubject}</td>
						</c:forEach>

						<td rowspan="2">${accepting[status.index]}</td>
					</tr>
					<tr>
						<c:forEach items="${currentStatement.statementMarks}"
							var="currentStatementMark">
							<td>${currentStatementMark}</td>
						</c:forEach>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>
</body>
</html>
