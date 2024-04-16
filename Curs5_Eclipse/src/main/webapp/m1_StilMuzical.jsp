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
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("stiluri_muzicale", "idstil", aux);
            rs.first();
            String numeStil = rs.getString("numestil");
            String origineStil = rs.getString("originestil");
            String perioadaPopularitate = rs.getString("perioadapopularitate");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_StilMuzical.jsp" method="post" class="form-horizontal">
            <div class="form-group">
                <label for="idstil" class="col-sm-2 control-label">IdStil:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="idstil" name="idstil" value="<%= aux%>" readonly/>
                </div>
            </div>
            <div class="form-group">
                <label for="numestil" class="col-sm-2 control-label">Nume Stil:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="numestil" name="numestil" value="<%= numeStil%>"/>
                </div>
            </div>
            <div class="form-group">
                <label for="originestil" class="col-sm-2 control-label">Origine Stil:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="originestil" name="originestil" value="<%= origineStil%>"/>
                </div>
            </div>
            <div class="form-group">
                <label for="perioadapopularitate" class="col-sm-2 control-label">Perioada Popularitate:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="perioadapopularitate" name="perioadapopularitate" value="<%= perioadaPopularitate%>"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-primary">Modifica stilul muzical</button>
                </div>
            </div>
        </form>
        <p class="text-center">
            <a href="index.html" class="btn btn-secondary">Home</a>
            <br/>
        </p>
    </body>
</html>