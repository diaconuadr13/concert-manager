<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga Stil Muzical</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body class="container">
        <%
            String numestil = request.getParameter("numestil");
            String originestil = request.getParameter("originestil");
            String perioadapopularitate = request.getParameter("perioadapopularitate");
            if (numestil != null) {
                jb.connect();
                jb.adaugaStil(numestil, originestil, perioadapopularitate);
                jb.disconnect();
        %>
        <p class="alert alert-success">Stilul muzical a fost adaugat.</p><%
            } else {
        %>
        <h1>Adauga un nou Stil Muzical:</h1>
        <form action="nou_StilMuzical.jsp" method="post">
            <div class="form-group">
                <label for="numestil">Nume Stil:</label>
                <input type="text" class="form-control" id="numestil" name="numestil" />
            </div>
            <div class="form-group">
                <label for="originestil">Origine Stil:</label>
                <input type="text" class="form-control" id="originestil" name="originestil" />
            </div>
            <div class="form-group">
                <label for="perioadapopularitate">Perioada Popularitate:</label>
                <input type="text" class="form-control" id="perioadapopularitate" name="perioadapopularitate" />
            </div>
            <button type="submit" class="btn btn-primary">Adauga stilul muzical</button>
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html" class="btn btn-secondary">Home</a>
        <br/>
    </body>
</html>