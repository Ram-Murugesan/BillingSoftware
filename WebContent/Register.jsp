<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<%@page import="java.sql.*,java.util.*"%>

<%
String name=request.getParameter("name");
String fatherName=request.getParameter("fatherName");
String address=request.getParameter("address");
String landmark=request.getParameter("landmark");
String email=request.getParameter("email");
String joinDate=request.getParameter("joinDate");
String mobile=request.getParameter("mobile");
String alternateMobile=request.getParameter("alternateMobile");
String qualification=request.getParameter("qualification");
String currentStatus=request.getParameter("currentStatus");
String timeFrom=request.getParameter("timeFrom");
String timeTo=request.getParameter("timeTo");
String courseRequired=request.getParameter("courseRequired");
int courseFee=Integer.parseInt(request.getParameter("courseFee"));






try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/New_Billing", "root", "root");

String sql = "INSERT INTO `new_billing`.`register` " +
"(`NAME`, `FATHERNAME`, `ADDRESS`, `LANDMARK`, `EMAILID`, `JOINDATE`, `MOBILE`, `ALTERNATEMOBILE`, `QUALIFICATION`, `CURRENTSTATUS`, `FROMTIME`, `TOTIME`, `COURSE`, `COURSEFEE`)" +
"VALUES('" + name +"', '"+ fatherName + "', '"+ address + "', '"+ landmark + "', '"+ email +"', '"+ joinDate +"', '"+ mobile +"', '"+ alternateMobile +"', '"+ qualification +"', '"+ currentStatus +"', '"+ timeFrom +"', '"+ timeTo +"', '"+ courseRequired +"', "+ courseFee +")";
PreparedStatement preparedStatement = conn.prepareStatement(sql);

int i= preparedStatement.executeUpdate();
out.println("Data is successfully inserted!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
<body>

</body>
</html>