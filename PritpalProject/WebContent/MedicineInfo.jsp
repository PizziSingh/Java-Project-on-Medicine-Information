<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</head>
<body>
<nav style="color:#c0392b"class="navbar navbar-dark bg-primary">
	<h3 style="color:white">Medicine Database</h3>
	
	</nav>
<%
int id=Integer.parseInt(request.getParameter("id"));	
Connection con = null;
PreparedStatement pt = null;
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");  
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","System","123");
String sql = "SELECT * FROM JAVAPROJECT jp, TYPE t, DISEASE d where jp.disease=d.d_id and jp.type=t.t_id and med_id=?";
pt=con.prepareStatement(sql);
pt.setInt(1,id);

ResultSet rs=pt.executeQuery();
%>
<%while(rs.next())
{
	
%>
<div class="container">
	<div class="card">
		<h5 class="card-header">Medicine Information</h5>
		<div class="card-body">
		<table id="medicineinfo" class="table table-bordered table-hover" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td>Medicine Name</td>
				<td><%=rs.getString(2) %></td>
			</tr>
			<tr>
				<td>Genric Name</td>
				<td><%=rs.getString(3) %></td>
			</tr>
			<tr>
				<td>Manufacturer</td>
				<td><%=rs.getString(4) %></td>
			</tr>
			<tr>
				<td>Usage </td>
				<td><%=rs.getString(13) %></td>
			</tr>
			<tr>
				<td>Type </td>
				<td><%=rs.getString(11) %></td>
			</tr>
			<tr>
				<td>Contains </td>
				<td><%=rs.getString(5) %></td>
			</tr>
			<tr>
				<td>Description </td>
				<td><%=rs.getString(6) %></td>
			</tr>
			<tr>
				<td>Price </td>
				<td><%=rs.getString(8) %></td>
			</tr>
		</table>
		<center><div>
		<a href="DataTable.jsp" class="btn btn-primary btn-info"><span class="glyphicon glyphicon-backward"></span> Back to List</a>
		</div>
		</center>
		</div>
	</div>
</div>
<%
}
%>

<%
}
catch(SQLException sqe)
{ 
out.println(sqe);
}
finally {
    // close all the connections.
    pt.close();
    con.close();
}
%>

</body>
</html>