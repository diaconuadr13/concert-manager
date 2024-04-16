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
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
<%
MuzicieniDaoImpl muzicieniDaoImpl = new MuzicieniDaoImpl();
StiluriMuzicaleDaoImpl stiluriDaoImpl = new StiluriMuzicaleDaoImpl();
List<Muzician> listaMuzicieni = new ArrayList();
listaMuzicieni = muzicieniDaoImpl.afiseazaMuzicieni();
List<StilMuzical> listaStiluri = new ArrayList();
listaStiluri = stiluriDaoImpl.afiseazaStilurimuzicale();
request.setAttribute("listaMuzicieni", listaMuzicieni);
request.setAttribute("listaStiluri", listaStiluri);
%>
        <div id="add" class="container my-4">
            <h1> Adauga un nou concert </h1>
            <form action="ConcerteController" method="GET" class="mb-4">
                <div class="form-group">
                    <label>Muzician:</label>
                    <select name="idmuzician" class="form-control">
                        <c:forEach items="${listaMuzicieni}" var="muzician">
                            <option value="${muzician.idmuzician}">${muzician.nume}, ${muzician.prenume}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label>Stil Muzical:</label>
                    <select name="idstil" class="form-control">
                        <c:forEach items="${listaStiluri}" var="stil">
                            <option value="${stil.idstil}">${stil.numestil}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label>Data Concert:</label>
                    <input type="date" name="dataconcert" class="form-control">
                </div>
                <div class="form-group">
                    <label>Locatie:</label>
                    <input type="text" name="locatie" class="form-control">
                </div>
                <div class="form-group">
                    <label>Detalii:</label>
                    <input type="text" name="altedetalii" class="form-control">
                </div>
                <input type="submit" name="adaugaConcert" value="Adauga" class="btn btn-primary">
            </form>

            <form action="ConcerteController" method="POST" class="mb-4">
                <input type="submit" name="afiseazaConcert" value="Afiseaza" class="btn btn-secondary">
            </form>

            <a href="index.html" class="btn btn-link"><b>Home</b></a>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>