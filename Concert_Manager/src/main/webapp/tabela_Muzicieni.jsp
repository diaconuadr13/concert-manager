<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Muzicieni</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script>
            $(document).ready(function () {
                $("#stergeMuzician").hide();
                $("#modificaMuzicieni").hide();

                $("#update").click(function () {
                    $("#modificaMuzicieni").show();
                    $("#stergeMuzician").hide();
                });
                $("#delete").click(function () {
                    $("#stergeMuzician").show();
                    $("#modificaMuzicieni").hide();
                });
            });
        </script>
</head>
<body>
	<h1 class="text-center">Tabela Muzicieni:</h1>
	<table class="table table-striped table-bordered" align="center">
		<tr>
			<th>IdMuzician:</th>
			<th>Nume:</th>
			<th>Prenume:</th>
			<th>Data Nasterii:</th>
			<th>Tara Origine:</th>
			<th>Instrument Principal:</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach var="muzician" items="${listaMuzicieni}">
				<tr>
					<td>${muzician.idmuzician}</td>
					<td>${muzician.nume}</td>
					<td>${muzician.prenume}</td>
					<td>${muzician.datanasterii}</td>
					<td>${muzician.taraorigine}</td>
					<td>${muzician.instrumentprincipal}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<form action="MuzicieniController" method="POST" class="text-center">
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="checkbox" id="update">
			<label class="form-check-label" for="update">Modifica</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="checkbox" id="delete">
			<label class="form-check-label" for="delete">Sterge</label>
		</div>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<div class="form-group">
						<label for="idmuzician">idmuzician:</label> <select
							class="form-control" name="idmuzician" id="idmuzician">
							<c:forEach items="${listaMuzicieni}" var="muzician">
								<option value="${muzician.idmuzician}">${muzician.idmuzician}</option>
							</c:forEach>
						</select>
					</div>

					<div class="form-group">
						<label for="nume">Modifica Nume:</label> <input
							class="form-control" id="nume" type="text" name="nume">
					</div>

					<div class="form-group">
						<label for="prenume">Modifica Prenume:</label> <input
							class="form-control" id="prenume" type="text" name="prenume">
					</div>

					<div class="form-group">
						<label for="datanasterii">Modifica Data Nasterii:</label> <input
							class="form-control" id="datanasterii" type="date"
							name="datanasterii">
					</div>

					<div class="form-group">
						<label for="taraorigine">Modifica Tara Origine:</label> <input
							class="form-control" id="taraorigine" type="text"
							name="taraorigine">
					</div>

					<div class="form-group">
						<label for="instrumentprincipal">Modifica Instrument
							Principal:</label> <input class="form-control" id="instrumentprincipal"
							type="text" name="instrumentprincipal">
					</div>
				</div>
			</div>
		</div>
		<button type="submit" class="btn btn-primary" id="modificaMuzicieni"
			name="modificaMuzicieni">Modifica</button>
		<button type="submit" class="btn btn-danger" id="stergeMuzician"
			name="stergeMuzician">Sterge</button>
	</form>
	<p class="text-center">
		<a href="index.html" class="btn btn-link"><b>Home</b></a>
	</p>
</body>
</html>