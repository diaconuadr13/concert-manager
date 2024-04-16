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
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("muzicieni", "idmuzician", aux);
            rs.first();
            String nume = rs.getString("nume");
            String prenume = rs.getString("prenume");
            String datanasterii = rs.getString("datanasterii");
            String taraorigine = rs.getString("taraorigine");
            String instrumentprincipal = rs.getString("instrumentprincipal");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_Muzician.jsp" method="post" class="form-horizontal">
            <div class="form-group">
                <label for="idmuzician" class="col-sm-2 control-label">IdMuzician:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="idmuzician" name="idmuzician" value="<%= aux%>" readonly/>
                </div>
            </div>
            <div class="form-group">
                <label for="nume" class="col-sm-2 control-label">Nume:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="nume" name="nume" value="<%= nume%>"/>
                </div>
            </div>
            <div class="form-group">
                <label for="prenume" class="col-sm-2 control-label">Prenume:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="prenume" name="prenume" value="<%= prenume%>"/>
                </div>
            </div>
            <div class="form-group">
                <label for="datanasterii" class="col-sm-2 control-label">Data Nasterii:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="datanasterii" name="datanasterii" value="<%= datanasterii%>"/>
                </div>
            </div>
            <div class="form-group">
                <label for="taraorigine" class="col-sm-2 control-label">Tara de Origine:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="taraorigine" name="taraorigine" value="<%= taraorigine%>"/>
                </div>
            </div>
            <div class="form-group">
                <label for="instrumentprincipal" class="col-sm-2 control-label">Instrument Principal:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="instrumentprincipal" name="instrumentprincipal" value="<%= instrumentprincipal%>"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">Modifica muzicianul</button>
                </div>
            </div>
        </form>
        <p class="text-center">
            <a href="index.html" class="btn btn-secondary">Home</a>
            <br/>
        </p>
    </body>
</html>