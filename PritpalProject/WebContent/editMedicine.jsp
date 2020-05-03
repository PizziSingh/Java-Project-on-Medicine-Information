<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>

<%
int id=Integer.parseInt(request.getParameter("id"));
Connection con = null;
PreparedStatement pt = null;
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");  
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","System","123");
String sql = "SELECT * FROM disease";
String q = "SELECT * FROM type";
String sql1 = "SELECT * FROM JAVAPROJECT jp, TYPE t, DISEASE d where jp.disease=d.d_id and jp.type=t.t_id and med_id="+id;
pt=con.prepareStatement(sql);

Statement stmt=con.createStatement();
Statement mt=con.createStatement();
Statement ft=con.createStatement();
ResultSet rs = stmt.executeQuery(sql); 
ResultSet ds = mt.executeQuery(q);
ResultSet fs = ft.executeQuery(sql1);
while(fs.next())
{
%>
	<nav style="color:#c0392b"class="navbar navbar-dark bg-primary">
	<h3 style="color:white">Medicine Database</h3>
	
	</nav>

<div class="container">
<div class="card">
	
  <h5 class="card-header">Add Medicine</h5>
  <div style="padding-left: 20px;     margin-top: 15px" >
<a href="DataTable.jsp" class="btn btn-primary btn-success"><span class="glyphicon glyphicon-upload"></span> Back To List</a>
</div>
  <div class="card-body">
    <form id="myForm1"  method="POST" action="update.jsp">
    <input type="hidden" name="id" value="<%=fs.getInt(1) %>">
  <div class="form-group row">
    <label for="medcinename" class="col-sm-2 col-form-label">Medicine Name</label>
    <div class="col-sm-6">
      <input  value="<%=fs.getString(2) %>" type="text" class="form-control" id="medicinename" name="mname" required>
    </div>
  </div>
  <div class="form-group row">
    <label for="genericname" class="col-sm-2 col-form-label">Generic Name</label>
    <div class="col-sm-6">
      <input value="<%=fs.getString(3) %>"  type="text" class="form-control" id="genericname" name="gname" required>
    </div>
  </div>
    <div class="form-group row">
    <label for="manufacturer" class="col-sm-2 col-form-label">Manufacturer</label>
    <div class="col-sm-6">
      <input  value="<%=fs.getString(4) %>"  type="text" class="form-control" id="manufacturer" name="mnftr" required>
    </div>
  </div>
      <div class="form-group row">
    <label for="contains" class="col-sm-2 col-form-label">Contains</label>
    <div class="col-sm-6">
      <input  value="<%=fs.getString(5) %>"  type="text" class="form-control" id="contains" name="contains" required>
    </div>
  </div>
        <div class="form-group row">
    <label for="desc" class="col-sm-2 col-form-label">Description</label>
    <div class="col-sm-6">
    <textarea  class="form-control" aria-label="With textarea" name="desc"required><%=fs.getString(6) %></textarea>
    </div>
  </div>
         <div class="form-group row">
    <label for="usage" class="col-sm-2 col-form-label">Usage</label>
    <div class="col-sm-6">
          <select  class="form-control" id="exampleFormControlSelect1" name="usage" required>
          <%
while(rs.next())
{
String tname = rs.getString(2); 
int tid = rs.getInt(1); 
%>
<option value="<%=tid %>"><%=tname %></option>
<%
}
%>

    </select>
    </div>
 
    
  </div>
  
      <div class="form-group row">
    <label for="price" class="col-sm-2 col-form-label">Price</label>
    <div class="col-sm-6">
      <input  value="<%=fs.getString(8) %>"  type="number" class="form-control" id="price" name="price" required>
    </div>
  </div>
      
            <div class="form-group row">
    <label for="type" class="col-sm-2 col-form-label">Type</label>
    <div class="col-sm-6">
          <select class="form-control" id="exampleFormControlSelect1" name="type" required>
          <%
while(ds.next())
{
String dname = ds.getString(2); 
int did = ds.getInt(1); 
%>
<option value="<%=did %>"><%=dname %></option>
<%
}
%>
    </select>
    </div>
  </div>
    	
  

<center>
  <div class="form-group row">
    <div class="col-sm-10">
      <button type="submit" class="btn btn-primary">Update Medicine</button>
    </div>
  </div>
 </center>
</form>
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
%>
<script>
var form = $('#myForm1');
form.submit(function () {
 
$.ajax({
type: form.attr('method'),
url: form.attr('action'),
data: form.serialize(),
success: function (data) {
	var result=data;
	alert(result);
		
}
});
 
return false;
});
</script>
</body>
</html>