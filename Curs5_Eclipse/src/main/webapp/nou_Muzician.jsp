<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga Muzician</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body class="container">
        <%
            String nume = request.getParameter("nume");
            String prenume = request.getParameter("prenume");
            String datanasterii = request.getParameter("datanasterii");
            String taraorigine = request.getParameter("taraorigine");
            String instrumentprincipal = request.getParameter("instrumentprincipal");
            if (nume != null && prenume != null && datanasterii != null && taraorigine != null && instrumentprincipal != null) {
                jb.connect();
                jb.adaugaMuzician(nume, prenume, datanasterii, taraorigine, instrumentprincipal);
                jb.disconnect();
        %>
        <p class="alert alert-success">Muzicianul a fost adaugat.</p><%
            } else {
        %>
        <h1>Adauga un nou Muzician:</h1>
        <form action="nou_Muzician.jsp" method="post">
            <div class="form-group">
                <label for="nume">Nume:</label>
                <input type="text" class="form-control" id="nume" name="nume" />
            </div>
            <div class="form-group">
                <label for="prenume">Prenume:</label>
                <input type="text" class="form-control" id="prenume" name="prenume" />
            </div>
            <div class="form-group">
                <label for="datanasterii">Data Nasterii:</label>
                <input type="text" class="form-control" id="datanasterii" name="datanasterii" />
            </div>
            <div class="form-group">
                <label for="taraorigine">Tara de Origine:</label>
                <input type="text" class="form-control" id="taraorigine" name="taraorigine" />
            </div>
            <div class="form-group">
                <label for="instrumentprincipal">Instrument Principal:</label>
                <input type="text" class="form-control" id="instrumentprincipal" name="instrumentprincipal" />
            </div>
            <button type="submit" class="btn btn-primary">Adauga muzicianul</button>
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html" class="btn btn-secondary">Home</a>
        <br/>
    </body>
</html>