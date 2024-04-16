<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page
    import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga Concert</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body class="container">
    <%
    String idmuzician, idstil, dataconcert, locatie, altedetalii;
    idmuzician = request.getParameter("idmuzician");
    idstil = request.getParameter("idstil");
    dataconcert = request.getParameter("dataconcert");
    locatie = request.getParameter("locatie");
    altedetalii = request.getParameter("altedetalii");
    if (idmuzician != null && idstil != null) {
        jb.connect();
        jb.adaugaConcert(java.lang.Integer.parseInt(idmuzician), java.lang.Integer.parseInt(idstil), dataconcert, locatie,
        altedetalii);
        jb.disconnect();
    %>
    <p class="alert alert-success">Concertul a fost adaugat.</p>
    <%
    } else {
    jb.connect();
    ResultSet rs1 = jb.vedeTabela("muzicieni");
    ResultSet rs2 = jb.vedeTabela("stiluri_muzicale");
    %>
    <h1>Adauga un nou Concert:</h1>
    <form action="nou_Concert.jsp" method="post">
        <div class="form-group">
            <label for="idmuzician">IdMuzician:</label>
            <select class="form-control" id="idmuzician" name="idmuzician">
                <%
                while (rs1.next()) {
                    String idMuzician = rs1.getString("idmuzician");
                    String numeMuzician = rs1.getString("nume");
                    String prenumeMuzician = rs1.getString("prenume");
                    String dataNasterii = rs1.getString("datanasterii");
                    String taraOrigine = rs1.getString("taraorigine");
                    String instrumentPrincipal = rs1.getString("instrumentprincipal");
                %>
                <option value="<%=idMuzician%>"><%=idMuzician%> - <%=numeMuzician%> <%=prenumeMuzician%>, <%=dataNasterii%>, <%=taraOrigine%>, <%=instrumentPrincipal%></option>
                <%
                }
                %>
            </select>
        </div>
        <div class="form-group">
            <label for="idstil">IdStil:</label>
            <select class="form-control" id="idstil" name="idstil">
                <%
                while (rs2.next()) {
                    String idStil = rs2.getString("idstil");
                    String numeStil = rs2.getString("numestil");
                    String origineStil = rs2.getString("originestil");
                    String perioadaPopularitate = rs2.getString("perioadapopularitate");
                %>
                <option value="<%=idStil%>"><%=idStil%>, <%=numeStil%>, <%=origineStil%>, <%=perioadaPopularitate%></option>
                <%
                }
                %>
            </select>
        </div>
        <div class="form-group">
            <label for="dataconcert">Data concert:</label>
            <input type="text" class="form-control" id="dataconcert" name="dataconcert" />
        </div>
        <div class="form-group">
            <label for="locatie">Locatie:</label>
            <input type="text" class="form-control" id="locatie" name="locatie" />
        </div>
        <div class="form-group">
            <label for="altedetalii">Alte detalii:</label>
            <input type="text" class="form-control" id="altedetalii" name="altedetalii" />
        </div>
        <button type="submit" class="btn btn-primary">Adauga concertul</button>
    </form>
    <%
    jb.disconnect();
    }
    %>
    <br />
    <a href="index.html" class="btn btn-secondary">Home</a>
    <br />
</body>
</html>