<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Stiluri Muzicale</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script>
            $(document).ready(function () {
                $("#stergeStilmuzical").hide();
                $("#modificaStilurimuzicale").hide();

                $("#update").click(function () {
                    $("#modificaStilurimuzicale").show();
                    $("#stergeStilmuzical").hide();
                });
                $("#delete").click(function () {
                    $("#stergeStilmuzical").show();
                    $("#modificaStilurimuzicale").hide();
                });
            });
        </script>
</head>
<body>
	<div class="container mt-5">
		<h1 class="text-center">Tabela Stiluri Muzicale:</h1>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>IdStil:</th>
					<th>NumeStil:</th>
					<th>OrigineStil:</th>
					<th>PerioadaPopularitate:</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="stil" items="${listaStilurimuzicale}">
					<tr>
						<td>${stil.idstil}</td>
						<td>${stil.numestil}</td>
						<td>${stil.originestil}</td>
						<td>${stil.perioadapopularitate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<form action="StiluriMuzicaleController" method="POST"
			class="text-center">
			<div class="form-group">
				<label for="update">Modifica:</label> <input type="checkbox"
					id="update"> <label for="delete">Sterge:</label> <input
					type="checkbox" id="delete">
			</div>
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-6">
						<div class="form-group">
							<label for="idstil">idstil:</label> <select class="form-control"
								name="idstil" id="idstil">
								<c:forEach items="${listaStilurimuzicale}" var="stil">
									<option value="${stil.idstil}">${stil.idstil}</option>
								</c:forEach>
							</select>
						</div>

						<div class="form-group">
							<label for="numestil">Modifica NumeStil:</label> <input
								id="numestil" type="text" class="form-control" name="numestil">
						</div>

						<div class="form-group">
							<label for="originestil">Modifica OrigineStil:</label> <input
								id="originestil" type="text" class="form-control"
								name="originestil">
						</div>

						<div class="form-group">
							<label for="perioadapopularitate">Modifica
								PerioadaPopularitate:</label> <input id="perioadapopularitate"
								type="text" class="form-control" name="perioadapopularitate">
						</div>
					</div>
				</div>
			</div>
			<button type="submit" id="modificaStilurimuzicale"
				class="btn btn-primary" name="modificaStilurimuzicale">Modifica</button>
			<button type="submit" id="stergeStilmuzical" class="btn btn-danger"
				name="stergeStilmuzical">Sterge</button>
		</form>
		<div class="text-center">
			<a href="index.html" class="btn btn-link"><b>Home</b></a>
		</div>
	</div>
</body>
</html>