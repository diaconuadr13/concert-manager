<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page
    import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Concerte</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body class="container">
    <h1 class="text-center">Tabela Concerte:</h1>
    <br />
    <p class="text-center">
        <a href="nou_Concert.jsp" class="btn btn-primary">Adauga un nou concert.</a> 
        <a href="index.html" class="btn btn-secondary">Home</a>
    </p>
    <%
    jb.connect();
    int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
    ResultSet rs = jb.intoarceConcertId(aux); // Adaptați metoda pentru concert
    rs.first();
    int idmuzician = rs.getInt("idmuzician");
    int idstil = rs.getInt("idstil");
    String dataconcert = rs.getString("dataconcert");
    String locatie = rs.getString("locatie");
    String altedetalii = rs.getString("altedetalii");

    ResultSet rs1 = jb.vedeTabela("muzicieni");
    ResultSet rs2 = jb.vedeTabela("stiluri_muzicale");
    %>
    <form action="m2_Concert.jsp" method="post" class="form-horizontal">
        <div class="form-group">
            <label for="idconcert" class="col-sm-2 control-label">IdConcert:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="idconcert" name="idconcert" value="<%=aux%>" readonly />
            </div>
        </div>
        <div class="form-group">
            <label for="idmuzician" class="col-sm-2 control-label">IdMuzician:</label>
            <div class="col-sm-10">
                <select class="form-control" id="idmuzician" name="idmuzician">
                    <% while (rs1.next()) { %>
                        <option value="<%=rs1.getInt("idmuzician")%>"><%=rs1.getInt("idmuzician")%>, <%=rs1.getString("nume")%>, <%=rs1.getString("prenume")%>, <%=rs1.getDate("datanasterii").toString()%>, <%=rs1.getString("taraorigine")%>, <%=rs1.getString("instrumentprincipal")%></option>
                    <% } %>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="idstil" class="col-sm-2 control-label">IdStil:</label>
            <div class="col-sm-10">
                <select class="form-control" id="idstil" name="idstil">
                    <% while (rs2.next()) { %>
                        <option value="<%=rs2.getString("idstil")%>"><%=rs2.getString("idstil")%>, <%=rs2.getString("numestil")%>, <%=rs2.getString("originestil")%>, <%=rs2.getString("perioadapopularitate")%></option>
                    <% } %>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="dataconcert" class="col-sm-2 control-label">Data Concert:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="dataconcert" name="dataconcert" value="<%=dataconcert%>" />
            </div>
        </div>
        <div class="form-group">
            <label for="locatie" class="col-sm-2 control-label">Locatie:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="locatie" name="locatie" value="<%=locatie%>" />
            </div>
        </div>
        <div class="form-group">
            <label for="altedetalii" class="col-sm-2 control-label">Alte Detalii:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="altedetalii" name="altedetalii" value="<%=altedetalii%>" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">Modifica concertul</button>
            </div>
        </div>
    </form>
    <p class="text-center">
        <a href="index.html" class="btn btn-secondary">Home</a> <br />
    </p>
<%
rs.close();
rs1.close();
rs2.close();
jb.disconnect();
%>
</body>
</html>