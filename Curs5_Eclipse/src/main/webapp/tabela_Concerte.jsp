<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Concert</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body class="container">
	<h1 class="text-center">Tabela Concert:</h1>
	<br />
	<p class="text-center">
		<a href="nou_Concert.jsp" class="btn btn-primary">Adauga un nou
			concert.</a>
	</p>
	<form action="sterge_Concert.jsp" method="post">
		<table class="table table-bordered">
			<tr>
				<td><b>Mark:</b></td>
				<td><b>IdConcert:</b></td>
				<td><b>NumeMuzician:</b></td>
				<td><b>PrenumeMuzician:</b></td>
				<td><b>DataNasterii:</b></td>
				<td><b>TaraOrigine:</b></td>
				<td><b>InstrumentPrincipal:</b></td>
				<td><b>NumeStil:</b></td>
				<td><b>OrigineStil:</b></td>
				<td><b>PerioadaPopularitate:</b></td>
				<td><b>DataConcert:</b></td>
				<td><b>Locatie:</b></td>
				<td><b>AlteDetalii:</b></td>
			</tr>
			<%
                    jb.connect();
                    ResultSet rs = jb.vedeConcerte();
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idconcert");
                %>
			<tr>
				<td><input type="checkbox" name="primarykey" value="<%= x %>" /></td>
				<td><%= x %></td>
				<td><%= rs.getString("nume") %></td>
				<td><%= rs.getString("prenume") %></td>
				<td><%= rs.getString("datanasterii") %></td>
				<td><%= rs.getString("taraorigine") %></td>
				<td><%= rs.getString("instrumentprincipal") %></td>
				<td><%= rs.getString("numestil") %></td>
				<td><%= rs.getString("originestil") %></td>
				<td><%= rs.getString("perioadapopularitate") %></td>
				<td><%= rs.getString("dataconcert") %></td>
				<td><%= rs.getString("locatie") %></td>
				<td><%= rs.getString("altedetalii") %></td>
				<%
                        }
                    %>
			</tr>
		</table>
		<br />
		<p class="text-center">
			<input type="submit" value="Sterge liniile marcate"
				class="btn btn-danger">
		</p>
	</form>
	<%
            rs.close();
            jb.disconnect();
        %>
	<br />
	<p class="text-center">
		<a href="index.html" class="btn btn-secondary">Home</a> <br />
	</p>
</body>
</html>