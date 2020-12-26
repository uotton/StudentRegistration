<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title><spring:message code='create_faculty.title' /></title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>

<body>
	<div class="container">
		<!-- Sidebar -->
		<div class="w3-sidebar w3-light-grey w3-bar-block" style="width: 10%">
			<h3 class="w3-bar-item"><spring:message code='create_faculty.menu' /></h3>
			<a href="/home" class="w3-bar-item w3-button"><spring:message code='create_faculty.home' /></a>
			<a href="/create-faculty" class="w3-bar-item w3-button"><spring:message code='create_faculty.create_faculty' /></a>
			<a href="/registeredEntrants" class="w3-bar-item w3-button"><spring:message code='create_faculty.registered_entrants' /></a>
		</div>

		<!-- Page Content -->
		<div style="margin-left: 10%">
			<div class="w3-container w3-teal">
				<h1><spring:message code='create_faculty.create_new_faculty' /></h1>
			</div>

			<div class="w3-container">
				<c:if test="${pageContext.request.userPrincipal.name != null}">
					<form id="logoutForm" method="POST" action="${contextPath}/logout">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>
					<h2>
						<spring:message code='create_faculty.welcome' /> ${pageContext.request.userPrincipal.name} | <a
							onclick="document.forms['logoutForm'].submit()"><spring:message code='create_faculty.logout' /></a>
					</h2>
				</c:if>

				<form:form method="POST" action="${contextPath}/addFaculty"
					modelAttribute="faculty">
					<table>
						<tr>
							<td><form:label path="name"><spring:message code='create_faculty.new_faculty_name' /> </form:label></td>
							<td><form:input type="text" path="name" /></td>
						</tr>

						<tr>
							<td><form:label path="quantityOfStudents"><spring:message code='create_faculty.quantity_of_students' /> </form:label></td>
							<td><form:input type="number" path="quantityOfStudents" /></td>
						</tr>

						<tr>
							<td><spring:message code='create_faculty.choose_subjects' /> <br><c:if test="${not empty subjects}">
									<c:forEach items="${subjects}" var="currentSubject">
										<form:checkbox path="subjects" value="${currentSubject}" />${currentSubject.title}<br>
									</c:forEach>
								</c:if>
							</td>
						</tr>

						<tr>
							<td><input type="submit" value="<spring:message code='create_faculty.submit' />" /></td>
						</tr>
					</table>

					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form:form>
			</div>
		</div>
	</div>

	<!-- /container -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</body>
</html>