<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%
String mname=request.getParameter("mname");
String gname=request.getParameter("gname");
String mnftr=request.getParameter("mnftr");
String cnt=request.getParameter("contains");
String desc=request.getParameter("desc");
int usage=Integer.parseInt(request.getParameter("usage"));
int price=Integer.parseInt(request.getParameter("price"));
int type=Integer.parseInt(request.getParameter("type"));

Connection con = null;
PreparedStatement pt = null;
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");  
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","System","123");
String sql = "INSERT INTO JAVAPROJECT(med_name,g_name,mnftr,contain,description,disease,price,type) VALUES(?,?,?,?,?,?,?,?)";
pt=con.prepareStatement(sql);
pt.setString(1,mname);
pt.setString(2,gname);
pt.setString(3,mnftr);
pt.setString(4,cnt);
pt.setString(5,desc);
pt.setInt(6,usage);
pt.setInt(7,price);
pt.setInt(8,type);

int i=pt.executeUpdate();
if  (i==1)
{
	out.println("Inserted");
}
else
{
	out.println("Failed");
}
}
            catch (Exception ex) {
            out.println("Unable to connect to batabase.");
   
               }
            finally {
                // close all the connections.
                pt.close();
                con.close();
            }
%>
	