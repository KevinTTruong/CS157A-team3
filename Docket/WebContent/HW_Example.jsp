<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>JDBC Connection example</title>
    </head>
  <body>
    <h1>JDBC Connection example</h1>
    
    <table border="1">
      <tr>
        <td>ID</td>
        <td>Name</td>
        <td>Age</td>
   </tr>
    <% 
     	String db = "";
		String table = "hw1";
		String user = "";
		String pass = "";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db+"?autoReconnect=true&useSSL=false", user, pass);
			out.println("\""+db+"\" database successfully opened.<br/><br/>");
				
			out.println("Initial entries in table \""+table+"\": <br/>");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from "+table);
			while (rs.next()) {
				out.println(rs.getInt(1) + " " + rs.getString(2) + " " + rs.getString(3));
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			out.println(e);
		}
    %>
  </body>
</html>
