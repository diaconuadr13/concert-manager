<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Stiluri Muzicale</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body class="container">
        <h1 class="text-center">Tabela Stiluri Muzicale:</h1>
        <br/>
        <p class="text-center">
            <a href="nou_StilMuzical.jsp" class="btn btn-primary">Adauga un nou stil muzical.</a> 
            <a href="index.html" class="btn btn-secondary">Home</a>
        </p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idstil"));
            String numeStil = request.getParameter("numestil");
            String origineStil = request.getParameter("originestil");
            String perioadaPopularitate = request.getParameter("perioadapopularitate");

            String[] valori = {numeStil, origineStil, perioadaPopularitate};
            String[] campuri = {"numestil", "originestil", "perioadapopularitate"};
            jb.modificaTabela("stiluri_muzicale", "idstil", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 class="text-center">Modificarile au fost efectuate !</h1>
        <p class="text-center">
            <a href="index.html" class="btn btn-secondary">Home</a>
            <br/>
        </p>
    </body>
</html>