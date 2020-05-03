<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<link rel="stylesheet" href="//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
</head>
<body>                                                                                                                                                                                                                                                                                                                                                      
	<nav style="color:#c0392b"class="navbar navbar-dark bg-primary">
	<h3 style="color:white">Medicine Database</h3>
	
	</nav>
<%
Connection con = null;
PreparedStatement pt = null;
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","System","123");
String sql ="SELECT * FROM JAVAPROJECT jp, TYPE t, DISEASE d where jp.disease=d.d_id and jp.type=t.t_id";
Statement stmt=con.createStatement();
ResultSet rs = stmt.executeQuery(sql); 
%>
<div class="container">

<div class="card">
<h5 class="card-header">Medicine Information</h5>
<div style="padding-left: 20px;     margin-top: 15px" >
<a href="Index.jsp" class="btn btn-primary btn-success"><span class="glyphicon glyphicon-upload"></span> Add Medicine</a>
</div>
<div class="card-body">
<div class="panel-body">
	<table id="tbl-medicine" class="table table-bordered table-hover" cellpadding="0" cellspacing="0" width="100%">
		<thead>
			<tr>
				<th>Medicine Name</th>
				<th>Generic Name</th>
				<th>Manufacturer</th>
				<th>Usage</th>
				<th>Price</th>	
				<th>Action</th>
				
			</tr>
		</thead>
		<tbody>	
			<tr><%
				while(rs.next())
{


%>
<td> <%=rs.getString(2) %></td>
<td> <%=rs.getString(3) %></td>
<td> <%=rs.getString(4) %></td>
<td> <%=rs.getString(13) %></td>
<td> <%=rs.getInt(8) %></td>
<td><i id=" <%=rs.getInt(1) %>" class="fa fa-trash-o fa-2x delete" style="color:red"aria-hidden="true"></i>
<a href="editMedicine.jsp?id=<%= rs.getString(1) %>"><i class="fa fa-pencil-square-o fa-2x" style="color:yellow" aria-hidden="true"></i></a>
<a href="MedicineInfo.jsp?id=<%= rs.getString(1) %>"><i class="fa fa-eye fa-2x" style="color:green" aria-hidden="true"></i></a></td>
</tr>
<%
}
%>
			
			</tbody>
		
	</table>
</div>
</div>
</div>
</div>


<%
}
catch(SQLException sqe)
{ 
out.println(sqe);
}
%>
<script>
$(document).ready(function() {
// crating new click event for save button
$(".delete").click(function() {
var id = this.id;
$.ajax({
url: "delete-ajax.jsp",
type: "POST",
data: {
id : id,
},
success : function(data){
alert(data); // alerts the response from jsp
location.reload();
}
});
});
});
</script>
<script src="//cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" type="text/javascript"></script>
</body>
</html>