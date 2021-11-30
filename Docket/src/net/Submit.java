package net;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;

@WebServlet("/submit")///tasks.jsp?account_id=
public class Submit extends HttpServlet {
	

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	
    	String email = request.getParameter("email");
    	System.out.println("current email is: " + email);
    	String password = request.getParameter("password");
    	System.out.println("current password is: " + password);
    	String phone = request.getParameter("phone");
    	
        if (request.getParameter("login-button") != null) {
        	try {
            	String acctId = login(email, password);
            	System.out.println("login id is: " + login(email, password));
            	request.setAttribute("account_id", acctId);
            	request.setAttribute("loggedIn", true);
            	response.sendRedirect("tasks.jsp?account_id=" + acctId);
        	} catch (Exception e) {
        		System.out.println(e);
        	}
        }
    }
    
    
    public String login(String email, String password) throws Exception {
    	String user = "docket";
    	String pass = "!d0ckeT2t3";
    	String db = "docket";
    	String table = "account";
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	String account_id = "";
    	
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db + "?autoReconnect=true&useSSL=false", user, pass);

		if (email != null && !email.isEmpty() && password != null
		&& !password.isEmpty()) {
	        String getId = "select account_id from " + table + " where email = \"" + email + "\" and password = \"" + password + "\";";
	        PreparedStatement stmt = con.prepareStatement(getId);
	        ResultSet currentAccountId = stmt.executeQuery();
	        currentAccountId.next();
			account_id = Integer.toString(currentAccountId.getInt(1));
			currentAccountId.close();
			stmt.close();
		}
		con.close();
		return account_id;
    }
    
    /*public String createAccount(String email, String password, String phone) {
    	String user = "docket";
    	String pass = "!d0ckeT2t3";
    	String db = "docket";
    	String table = "account";
    	boolean login = false;
    	//Class.forName("com.mysql.cj.jdbc.Driver");
    	String account_id = "";
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db + "?autoReconnect=true&useSSL=false", user, pass);
			Statement stmt = con.createStatement();

			//Get the max id and iterate to create the next account_id
			ResultSet maxId = stmt.executeQuery("select max(account_id) from " + table);
			maxId.next();
			account_id = Integer.toString(maxId.getInt(1) + 1);
			
			System.out.println("max id is: " + account_id);
			
			maxId.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			//MysqlDataTruncation = incorrect date format
			System.out.println(e);
		}
		
		return account_id;
    }*/

}