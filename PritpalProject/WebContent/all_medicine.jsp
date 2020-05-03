<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONObject.*"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONArray.*"%>
<%

Connection con = null;
PreparedStatement pt = null;
JSONArray list=new JSONArray();
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");  
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","System","123");
String sql = "SElECT * FROM JAVAPROJECT";
Statement st=con.createStatement();
ResultSet rs=st.executeQuery(sql);
 
while(rs.next())
{
	JSONObject obj= new  JSONObject();
	String mname=rs.getString(1);
	
	obj.put("mname",mname);  
	list.add(obj);
	
}
out.print(list.toJSONString());
out.flush();
}
catch (Exception ex) {
out.println("Unable to connect to batabase.");

   }
finally 
{
    // close all the connections.
    pt.close();
    con.close();
}


%>