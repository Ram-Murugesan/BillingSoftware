<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form method="post">
<input type="text" id="name" name="name" value="<%= request.getParameter("name") %> disabled"/><br>
<input type="number" id="mobile" name="mobile" value="<%= request.getParameter("mobile") %> disabled"/><br>
<input type="number" id="courseFee" name="courseFee" value="<%= request.getParameter("courseFee") %>"/><br>
<input type="number" id="paidAmount" name="paidAmount" placeholder="PaidAmount"/><br>
<input type="date" id="paidDate" name="paidDate" placeholder="PaidDate"/><br>
<!-- <input type="number" id="balance" name="balance" placeholder="Balance"/><br>  -->

</form>

<%@page import="java.sql.*,java.util.*"%>

<%
String name=request.getParameter("name");
String mobile=request.getParameter("mobile");
int courseFee=Integer.parseInt(request.getParameter("courseFee")); 
int paidAmount=Integer.parseInt(request.getParameter("paidAmount"));
String paidDate=request.getParameter("paidDate");
int balance = courseFee - paidAmount;
String status;
if(balance==0)
	status="Paid";
else 
	status="Unpaid";

try
{
	Class.forName("com.mysql.jdbc.driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/New_Billing", "root", "root");

	String insert="INSERT INTO `new_billing`.`entry`"+
	"(`NAME`, `MOBILE`, `COURSEFEE`, `PAIDAMOUNT`, `PAIDDATE`, `BALANCE`, `STATUS`)"+
	"VALUES('"+ name +"', '"+ mobile +"', '"+ courseFee +"', '"+ paidAmount +"', '"+ paidDate +"', '"+ balance +"', '"+ status +"')";

	
	PreparedStatement preparedstatement = conn.prepareStatement(insert);
	int i = preparedstatement.executeUpdate();
}
catch(Exception e)
{
	System.out.print(e);
	e.printStackTrace();
}
%>
</body>
</html>