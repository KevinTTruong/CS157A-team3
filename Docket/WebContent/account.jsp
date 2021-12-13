<%@ page import="java.sql.*"%>

<html>
<div class="wrapper">
	<meta charset="UTF-8">
	<link
		href="https://fonts.googleapis.com/css?family=Nunito:400,600,700&display=swap"
		rel="stylesheet">
	<link
		href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700&display=swap"
		rel="stylesheet">
	<link rel='stylesheet'
		href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css'>
	<link rel='stylesheet'
		href='https://maxcdn.icons8.com/fonts/line-awesome/1.1/css/line-awesome-font-awesome.min.css'>
	<link rel='stylesheet'
		href='https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/css/datepicker.css'>
	<link rel="stylesheet" href="./main.css">
	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	String account_id = ""; //If account_id not retrieved, will crash
	String user = "docket";
	String pass = "!d0ckeT2t3";
	String db = "docket";
	String table = "account";
	%>
</div>

 <style type ="text/css" >
   .top-style{ 
       position: fixed;     
       text-align: top;    
       top: 30px;
       width: 100%;
   }
   </style>

<body>
	<div class="top-style">
		<div class="pt-2">
			<h2 class="m-2" style="font-size: 50px;">Docket</h2>
		</div>
		<form id="login-form"
			action="${pageContext.servletContext.contextPath}/submit"
			method="post">
			<div class="modal-body">
				<h4>Login</h4>
				<!-- Save account_id on submit -->
				<input type="hidden" name="account_id" value=<%=account_id%> />
				<div class="form-group">
					<label>Email</label> <input type="text" class="form-control"
						name="email" required>
				</div>
				<div class="form-group">
					<label>Password</label> <input type="password" class="form-control"
						name="password" required>
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary" name="login-button"
					value="login">Login</button>
							<!-- Button trigger create account modal -->
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#createAccount">Create Account</button>
			</div>
		</form>
	</div>


	<div>

		<!-- Create account modal -->
		<div class="modal fade" id="createAccount" tabindex="-1" role="dialog">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">

					<form id="create-form">
						<div class="modal-body">
							<h4>Create Account</h4>
							<div class="form-group">
								<label>Email</label> <input type="text" class="form-control"
									name="email" required />
							</div>
							<div class="form-group">
								<label>Password</label> <input type="password" class="form-control"
									name="password" required />
							</div>
							<div class="form-group">
								<label>Phone Number</label> <input type="number"
									class="form-control" name="phone" required />
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">Create
								Account</button>
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
			</div>
		</div>




	</div>






<!-- partial -->
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js'></script>
<script
	src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js'></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.js'></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js'></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/js/datepicker.js'></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/js/i18n/datepicker.en.js'></script>
<script src="./script.js"></script>
		<%
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		if (email != null && !email.isEmpty() && password != null && !password.isEmpty() && phone != null && !phone.isEmpty()) {
			account_id = createAccount(out, email, password, phone);
			System.out.println("current id is: " + account_id);
        	response.sendRedirect("tasks.jsp?account_id=" + account_id); //creates account and redirects to tasks page
		}
		%>
</html>
</body>
<%!String user = "docket";
	String pass = "!d0ckeT2t3";
	String db = "docket";
	String table = "account";
	
	// adds account to db
	public String createAccount(javax.servlet.jsp.JspWriter out, String email, String password, String phone)
			throws Exception {
		String account_id = "";
		try {
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/" + db + "?autoReconnect=true&useSSL=false", user, pass);
			Statement stmt = con.createStatement();
			//Get the max id and iterate to create the next account_id
			ResultSet maxId = stmt.executeQuery("select max(account_id) from " + table);
			maxId.next();
			account_id = Integer.toString(maxId.getInt(1) + 1);
			maxId.close();
			stmt.executeUpdate("INSERT INTO " + db + "." + table + " (account_id, email, password, phone) VALUES ("
					+ account_id + ", \"" + email + "\", \"" + password + "\", \"" + phone + "\")");
			System.out.println("inserted " + email + ", " + password + ", " + phone);
			stmt.close();
			con.close();
		} catch (Exception e) {
			//MysqlDataTruncation = incorrect date format
			out.println(e);
		}
		return account_id;
	}
	
	// deletes account from db
	public void removeAccount(javax.servlet.jsp.JspWriter out, String account_id, String email, String password,
			int phone) throws Exception {
		try {
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/" + db + "?autoReconnect=true&useSSL=false", user, pass);
			Statement stmt = con.createStatement();
			ResultSet pass = stmt
					.executeQuery("SELECT password FROM " + db + "." + table + " WHERE password = " + password + ";");
			if (pass.getString(1).equals(password)) { // finds account in db and deletes if password is correct
				stmt.executeUpdate("DELETE FROM " + db + "." + table + " (email, password, phone) VALUES (" + account_id
						+ ", \"" + email + "\", \"" + password + "\", \"" + phone + "\")");
			}
			stmt.close();
			con.close();
		} catch (Exception e) {
			//MysqlDataTruncation = incorrect date format
			out.println(e);
		}
	}%>