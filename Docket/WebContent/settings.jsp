<%@ page import="java.sql.*"%>
	
<style>
	.modal-message {
	  display: none;
	  position: fixed;
	  z-index: 1;
	  left: 0;
	  top: 0;
	  width: 100%;
	  height: 100%;
	  background-color: rgba(0,0,0,0.4);
	}
	
	/* Modal Content */
	.modal-message-content {
	  background-color: #fefefe;
	  margin: auto;
	  padding: 100px;
	  border: 1px solid #888;
	  width: 80%;
	}
	
	/* page style*/
	   .top-style{ 
       position: fixed;     
       text-align: top;    
       top: 30px;
       width: 100%;
   }
</style>

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
		
		String uph = request.getParameter("uph");
		String uss = request.getParameter("uss");
		String enteredPass = request.getParameter("password");
		
		//Load information
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db+"?autoReconnect=true&useSSL=false", user, pass);
		Statement stmt = con.createStatement();
		ResultSet accountInfo = stmt.executeQuery("select email, password, phone from "+table+" where account_id=\""+account_id+"\"");
		accountInfo.next();	//Skip header
		
		email = accountInfo.getString(1);
		
		//Get password
		String tempPass;
		if(uss!=null && uss.equals("true") && checkPass(out, enteredPass, account_id)){
			tempPass  = request.getParameter("newPassword");
		}else{
			tempPass = accountInfo.getString(2);
		}
		
		
		//Get phone number
		String phoneNumber;
		if(uph!=null && uph.equals("true") && checkPass(out, enteredPass, account_id)){
			phone = Long.parseLong(request.getParameter("phone"));
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
		document.getElementById("uph").value="true";
	}
	function passChanged(){
		document.getElementById("uss").value="true";
	}
</script>

<form id="settings-form" class="top-style">
		<div class="pt-2">
			<h2 class="m-2" style="font-size: 50px;">Docket</h2>
		</div>
	<div class="modal-body">
		<h4>Edit Account</h4>
		<div class="form-group">
			<label>Email</label> <input type="text" class="form-control"
				name="email" value=<%=email%> disabled="disabled" readonly/>
		</div>
		<input type="hidden" name="account_id" value=<%=account_id %> />
		<input type="hidden" id="uph" name="uph" value="false" />
		<input type="hidden" id="uss" name="uss" value="false" />
		<div class="form-group">
			<label>Phone Number</label>
			<input type="number" class="form-control" name="phone" onchange="phoneChanged()" value=<%=phone %> />
		</div>
		<div class="form-group">
			<label>Change Password</label> 
			<input type="text" class="form-control" name="newPassword" onchange="passChanged()" value=<%=password %> />
		</div>
		<div class="form-group">
			<label>Enter Current Password to Save Changes</label> 
			<input type="password" class="form-control" name="password" />
		</div>
	</div>
	<div class="modal-footer">
		<button type="submit" class="btn btn-primary">Save Changes</button>
		<a href="tasks.jsp?account_id=<%=account_id%>" type="button" class="btn btn-primary" data-dismiss="modal" >Return to Calendar</a>
	</div>
</form>



<%

	//String password = request.getParameter("password");
	String newPhone = request.getParameter("phone");
	String newPassword = request.getParameter("newPassword");
	
	try{
		if(enteredPass!=null && checkPass(out, enteredPass, account_id)){ // checks if inputed password is the one in the db
			if (uph.equals("true") && newPhone != null) { // updates phone number if there is data in field
				updatePhone(account_id, newPhone);
				displayMessage(out, "Account info updated!");
			}
			if(uss.equals("true") && newPassword != null){ // updates password if there is data in field
				updatePassword(account_id, newPassword);
				displayMessage(out, "Account info updated!");
			}
		}else if(enteredPass != null && (uph!=null || uss!=null)){
			displayMessage(out, "Incorrect password.");
		}
	} catch(Exception e){
		displayMessage(out, "Error: "+e.getMessage());
	}
%>

<!-- Success/Error message -->
<script>
	// Get the modal
	var modal_message = document.getElementById("message");
	
	modal_message.style.display = "block";
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	  if (event.target == modal_message) {
	    modal_message.style.display = "none";
	  }
	}
</script>

<%!
	String user = "docket";
	String pass = "!d0ckeT2t3";
	String db = "docket";
	String table = "account";
	
	// updates phone number in db
	public void updatePhone(String account_id, String phone) throws Exception{
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db+"?autoReconnect=true&useSSL=false", user, pass);
		Statement stmt = con.createStatement();
		
		stmt.executeUpdate("update "+db+"."+table+" set phone=\'"+phone+"\' where (account_id=\'"+account_id+"\')");
		stmt.close();
		con.close();
	}
	
	// updates password in db
	public void updatePassword(String account_id, String newPassword) throws Exception{
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db+"?autoReconnect=true&useSSL=false", user, pass);
		Statement stmt = con.createStatement();
		
		stmt.executeUpdate("update "+db+"."+table+" set password=\'"+newPassword+"\' where (account_id=\'"+account_id+"\')");
		
		stmt.close();
		con.close();
	}
	
	// checks if inputed password is equal to the user's password in the db
	public boolean checkPass(javax.servlet.jsp.JspWriter out, String password, String account_id) throws Exception{
		if(password.isEmpty()) return false;
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db+"?autoReconnect=true&useSSL=false", user, pass);
		Statement stmt = con.createStatement();
		ResultSet accountPass = stmt.executeQuery("select password from "+table+" where account_id=\""+account_id+"\"");
		
		accountPass.next();	//Skip header
		boolean check = password.equals(accountPass.getString(1));
		
		stmt.close();
		con.close();
		
		return check;
	}
	
	// displays message for an action
  	public void displayMessage(javax.servlet.jsp.JspWriter out, String message) throws Exception{
  		out.write("<div id=\"message\" class=\"modal-message\">");
  		out.write("<div class=\"modal-message-content\">");
  		out.write(message);
  		out.write("</div>");
  		out.write("</div>");
  	}
%>

</body>
</html>