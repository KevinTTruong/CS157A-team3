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
		String account_id = request.getParameter("account_id");
	
		String user = "docket";
		String pass = "!d0ckeT2t3";
		String db = "docket";
		String table = "account";
		String email;
		String password="";
		long phone;
		
		//Load information
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db+"?autoReconnect=true&useSSL=false", user, pass);
		Statement stmt = con.createStatement();
		ResultSet accountInfo = stmt.executeQuery("select email, password, phone from "+table+" where account_id=\""+account_id+"\"");
		accountInfo.next();	//Skip header
		
		email = accountInfo.getString(1);
		String tempPass = accountInfo.getString(2);
		
		//Get phone number
		String phoneNumber = request.getParameter("phone");
		if(phoneNumber!=null){
			phone = Long.parseLong(phoneNumber);
		}else{
			phone = Long.parseLong(accountInfo.getString(3));
		}
		
		for(int i=0;i<tempPass.length();i++){
			password += "*";
		}
		
		stmt.close();
		con.close();
	%>
</div>
<body>

<script>
	function phoneChanged(){
		document.getElementById("update").value="true";
	}
</script>

<form id="settings-form">
	<div class="modal-body">
		<h4>Edit Account</h4>
		<div class="form-group">
			<label>Email</label> <input type="text" class="form-control"
				name="email" value=<%=email%> disabled="disabled" readonly/>
		</div>
		<input type="hidden" name="account_id" value=<%=account_id%> />
		<input type="hidden" id="update" name="update" value="false" />
		<div class="form-group">
			<label>Phone Number</label>
			<input type="number" class="form-control" name="phone" onchange="phoneChanged()" value=<%=phone %> />
		</div>
		<div class="form-group">
			<label>Password
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#changePassword" >Change Password</button>
			</label> 
			<input type="text" class="form-control" name="password" disabled="disabled" value=<%=password %> readonly />
		</div>
	</div>
	<div class="modal-footer">
		<button type="submit" class="btn btn-primary">Save Changes</button>
		<a href="tasks.jsp?account_id=<%=account_id%>" type="button" class="btn btn-primary" data-dismiss="modal" >Return to Calendar</a>
	</div>
</form>

<div class="modal fade" id="changePassword" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<form id="password-form">
				<div class="modal-body">
					<h4>Change Password</h4>
					<div class="form-group">
						<label>Current Password</label> <input type="text" class="form-control" name="password" required />
					</div>
					<div class="form-group">
						<label>New Password</label> <input type="text" class="form-control" name="newPassword" required />
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">Change Password</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
				</div>
			</form>
		</div>
	</div>
</div>

<%

	//String password = request.getParameter("password");
	String newPhone = request.getParameter("phone");
	String phoneUpdated = request.getParameter("update");
	
	if (phoneUpdated=="true" && newPhone != null) {
		updatePhone(account_id, newPhone);
	}
%>
<%!
	String user = "docket";
	String pass = "!d0ckeT2t3";
	String db = "docket";
	String table = "account";
	
	public void updatePhone(String account_id, String phone) throws Exception{
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db+"?autoReconnect=true&useSSL=false", user, pass);
		Statement stmt = con.createStatement();
		
		stmt.executeUpdate("update "+db+"."+table+" set phone=\'"+phone+"\' where (account_id=\'"+account_id+"\')");
		//UPDATE `docket`.`account` SET `phone` = '4087855673' WHERE (`account_id` = '5');
		
		stmt.close();
		con.close();
	}
	
	public void updatePassword(String account_id, String oldPassword, String newPassword) throws Exception{
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db+"?autoReconnect=true&useSSL=false", user, pass);
		Statement stmt = con.createStatement();
		
		stmt.executeUpdate("update "+db+"."+table+" set password=\'"+newPassword+"\' where (account_id=\'"+account_id+"\')");
		//UPDATE `docket`.`account` SET `phone` = '4087855673' WHERE (`account_id` = '5');
		
		stmt.close();
		con.close();
	}
%>

</body>
</html>