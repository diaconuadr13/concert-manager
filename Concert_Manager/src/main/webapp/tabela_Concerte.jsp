<%@page import="DAOImpl.StiluriMuzicaleDaoImpl"%>
<%@page import="DAOImpl.MuzicieniDaoImpl"%>
<%@page import="pojo.StilMuzical"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Muzician"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Concerte</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
            $(document).ready(function () {
                $("#stergeConcert").hide();
                $("#modificaConcert").hide();

                $("#update").click(function () {
                    $("#modificaConcert").show();
                    $("#stergeConcert").hide();
                });
                $("#delete").click(function () {
                    $("#stergeConcert").show();
                    $("#modificaConcert").hide();
                });
            });
        </script>

</head>
<body>
	<%
        MuzicieniDaoImpl muzicianDaoImpl = new MuzicieniDaoImpl();
                                                    StiluriMuzicaleDaoImpl stilmuzicalDaoImpl = new StiluriMuzicaleDaoImpl();
                                                    List<Muzician> listaMuzicieni = new ArrayList();
                                                    listaMuzicieni = muzicianDaoImpl.afiseazaMuzicieni();
                                                    List<StilMuzical> listaStilurimuzicale = new ArrayList();
                                                    listaStilurimuzicale = stilmuzicalDaoImpl.afiseazaStilurimuzicale();
                                                    request.setAttribute("listaMuzicieni", listaMuzicieni);
                                                    request.setAttribute("listaStilurimuzicale", listaStilurimuzicale);
        %>
	<h1 class="text-center">Tabela Concerte:</h1>
	<table class="table table-striped table-bordered" align="center">
			<tr>
				<th>IdConcert:</th>
				<th>NumeMuzician:</th>
				<th>PrenumeMuzician:</th>
				<th>DataNasterii:</th>
				<th>TaraOrigine:</th>
				<th>InstrumentPrincipal:</th>
				<th>NumeStil:</th>
				<th>OrigineStil:</th>
				<th>PerioadaPopularitate:</th>
				<th>DataConcert:</th>
				<th>Locatie:</th>
				<th>AlteDetalii:</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="concert" items="${listaConcerte}">
				<tr>
					<td>${concert.idconcert}</td>
					<td>${concert.muzician.nume}</td>
					<td>${concert.muzician.prenume}</td>
					<td>${concert.muzician.datanasterii}</td>
					<td>${concert.muzician.taraorigine}</td>
					<td>${concert.muzician.instrumentprincipal}</td>
					<td>${concert.stilmuzical.numestil}</td>
					<td>${concert.stilmuzical.originestil}</td>
					<td>${concert.stilmuzical.perioadapopularitate}</td>
					<td>${concert.dataconcert}</td>
					<td>${concert.locatie}</td>
					<td>${concert.altedetalii}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<form action="ConcerteController" method="POST" class="text-center">
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
                <label for="idconcert">idconcert:</label>
                <select class="form-control" name="idconcert" id="idconcert">
                    <c:forEach items="${listaConcerte}" var="concert">
                        <option value="${concert.idconcert}">${concert.idconcert}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="idmuzician">idmuzician:</label>
                <select class="form-control" name="idmuzician" id="idmuzician">
                    <c:forEach items="${listaMuzicieni}" var="muzicieni">
                        <option value="${muzicieni.idmuzician}">${muzicieni.idmuzician}, ${muzicieni.nume}, ${muzicieni.prenume}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="idstil">idstil:</label>
                <select class="form-control" name="idstil" id="idstil">
                    <c:forEach items="${listaStilurimuzicale}" var="stiluri">
                        <option value="${stiluri.idstil}">${stiluri.idstil}, ${stiluri.numestil}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="dataconcert">Modifica data concertului:</label>
                <input class="form-control" id="dataconcert" type="text" name="dataconcert">
            </div>

            <div class="form-group">
                <label for="locatie">Modifica locatia:</label>
                <input class="form-control" id="locatie" type="text" name="locatie">
            </div>

            <div class="form-group">
                <label for="altedetalii">Modifica detaliile:</label>
                <input class="form-control" id="altedetalii" type="text" name="altedetalii">
            </div>
        </div>
    </div>
</div>
		<button type="submit" class="btn btn-primary" id="modificaConcert"
			name="modificaConcert">Modifica</button>
		<button type="submit" class="btn btn-danger" id="stergeConcert"
			name="stergeConcert">Sterge</button>
	</form>
	<br>
	<p align="center">
		<a href="index.html"><b>Home</b></a>
	</p>
</body>
</html>
