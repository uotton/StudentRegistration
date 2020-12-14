<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Rating</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>

<body>
	<!-- Sidebar -->
	<div class="w3-sidebar w3-light-grey w3-bar-block" style="width: 10%">
		<h3 class="w3-bar-item">Menu</h3>
		<a href="/home" class="w3-bar-item w3-button">Home</a> <a
			href="/create-faculty" class="w3-bar-item w3-button">Create
			Faculty</a> <a href="/rating" class="w3-bar-item w3-button">Rating</a>
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

		<c:if test="${not empty statements}">
			<table>
				<tr>
					<th>First name</th>
					<th>Second name</th>
					<th>Email</th>
					<th>Faculty name</th>
					<th>Marks</th>
				</tr>
				<c:forEach items="${statements}" var="currentStatement">
					<tr>
						<td>${currentStatement.user.firstName}</td>
						<td>${currentStatement.user.secondName}</td>
						<td>${currentStatement.user.email}</td>
						<td>${currentStatement.faculty.name}</td>

						<td>${currentStatement.faculty.subjects}<br>${currentStatement.marks}</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>

</html>
