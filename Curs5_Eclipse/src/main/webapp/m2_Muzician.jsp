<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Muzicieni</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body class="container">
        <h1 class="text-center">Tabela Muzicieni:</h1>
        <br/>
        <p class="text-center">
            <a href="nou_Muzician.jsp" class="btn btn-primary">Adauga un nou muzician.</a> 
        </p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idmuzician"));
            String nume = request.getParameter("nume");
            String prenume = request.getParameter("prenume");
            String datanasterii = request.getParameter("datanasterii");
            String taraorigine = request.getParameter("taraorigine");
            String instrumentprincipal = request.getParameter("instrumentprincipal");

            String[] valori = {nume, prenume, datanasterii, taraorigine, instrumentprincipal};
            String[] campuri = {"nume", "prenume", "datanasterii", "taraorigine", "instrumentprincipal"};
            jb.modificaTabela("muzicieni", "idmuzician", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 class="text-center">Modificarile au fost efectuate !</h1>
        <p class="text-center">
            <a href="index.html" class="btn btn-secondary">Home</a>
            <br/>
        </p>
    </body>
</html>