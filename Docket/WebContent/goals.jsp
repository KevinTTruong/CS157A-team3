<%@ page import="java.sql.*"%>

<html>
<div class="wrapper">
<meta charset = "UTF-8">
<link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700&display=swap" rel="stylesheet"> 
<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700&display=swap" rel="stylesheet"> <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://maxcdn.icons8.com/fonts/line-awesome/1.1/css/line-awesome-font-awesome.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/css/datepicker.css'><link rel="stylesheet" href="./main.css">
<% 
	Class.forName("com.mysql.cj.jdbc.Driver");
	String account_id=request.getParameter("account_id");	//If account_id not retrieved, will crash
%>
    <body>
      <div class="calendar">
        <div class="p-5">
          <h2 class="mb-4">Docket</h2>
          <div class="card">
            <div class="card-body p-0">
              <div id="calendar"></div>
            </div>
          </div>
          
        </div>
        
        <!-- calendar modal -->
        <div id="modal-view-event" class="modal modal-top fade calendar-modal">
            <div class="modal-dialog modal-dialog-centered">
              <div class="modal-content">
                <div class="modal-body">
                  <h4 class="modal-title"><span class="event-icon"></span><span class="event-title"></span></h4>
                  <div class="event-body"></div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                </div>
              </div>
            </div>
        </div>
        
        <!-- Add goal -->
        <div id="modal-view-event-add" class="modal modal-top fade calendar-modal">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
              <form id="add-goal">
                <div class="modal-body">
                <h4>Add Goal</h4>
                  <input type="hidden" name="account_id" value=<%=account_id%> />	<!-- Save account_id on submit -->     
                  <div class="form-group">
                    <label>Goal</label>
                    <textarea class="form-control" name="goal" style="height:100px;"></textarea>
                  </div>
                  <div class="form-group">
                    <label>Start Date</label>
                    <input type='date' class="form-control" name="goalstartdate">
                  </div>        
                  <div class="form-group">
                    <label>End Date</label>
                    <input type='date' class="form-control" name="goalenddate">
                  </div>
              </div>
                <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Save</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>        
              </div>
              </form>
            </div>
          </div>
        </div>
        
      </div>
      <div>
		  <% 
				/*
				TODO:
					Pop-up message if invalid date error/Success
					Display Goals on Calender
					Create a new Add Goal button instead of clicking on calender
					View Goal UI + Remove UI/(Modify)
					(change parameters to removeGoal if needed)
				*/
		  		String goal = request.getParameter("goal");
		  		String goalStartDate = request.getParameter("goalstartdate");
		  		String goalEndDate = request.getParameter("goalenddate");
		  		if(goal!=null && goalStartDate!=null && goalEndDate!=null){
		  			try{
			  			addGoal(account_id, goal, goalStartDate, goalEndDate);
			  		} catch (Exception e) {
			  			//MysqlDataTruncation = incorrect date format
				  		out.println(e);
				  	} 
		  			//
		  			//TODO: pop up modal-view-goal-add with prefilled values + message saying error if catched
		  			//TODO: pop up if success
		  			/*
		  		else if(//update-vars are not null){
		  				try{
			  			updateGoal(//goal_id, //goal, //goalStartDate, //goalEndDate);
			  			} catch (Exception e) {
			  				//MysqlDataTruncation = incorrect date format
					  		out.println(e);
					  	} 
		  		}
		  		else if(toggle-remove not null){
		  			try{
		  				removeGoal(account_id, //goal_id);
		  			} catch (Exception e) {
				  		out.println(e);
				  	} 
		  		}
		  			*/
		  		}
		  		

		    %>
	  </div>
    </body>


    <sidebar>
      <div class="avatar">
        <div class="avatar__img">
          <img src="https://picsum.photos/70" alt="avatar">
        </div>
        <div class="avatar__name">User</div>
      </div>
      <nav class="menu">
        <a class="menu__item" href="goals.jsp?account_id=<%=account_id%>">
          <i class="menu__icon fa fa-home"></i>
          <span class="menu__text">goals</span>
        </a>
        <a class="menu__item" href="notes.jsp?account_id=<%=account_id%>">
          <i class="menu__icon fa fa-envelope"></i>
          <span class="menu__text">notes</span>
        </a>
        <a class="menu__item menu__item--active" href="tasks.jsp?account_id=<%=account_id%>">
          <i class="menu__icon fa fa-calendar"></i>
          <span class="menu__text">calendar</span>
        </a>
        <a class="menu__item" href="#">
          <i class="menu__icon fa fa-sliders"></i>
          <span class="menu__text">settings</span>
        </a>
      </nav>
      <div class="copyright">Docket &copy; 2021</div>
    </sidebar>

     <!-- partial -->
     <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
     <script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js'></script>
     <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js'></script>
     <script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.js'></script>
     <script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js'></script>
     <script src='https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/js/datepicker.js'></script>
     <script src='https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/js/i18n/datepicker.en.js'></script><script  src="./script.js"></script>
  </div>
  </html>
  <%!
	String user = "docket";
	String pass = "!d0ckeT2t3";
	String db = "docket";
	String table = "goals";
	String relation = "have_goals";
	
  	public void addGoal(String account_id, String goal, String start, String end) throws Exception{
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db+"?autoReconnect=true&useSSL=false", user, pass);
		Statement stmt = con.createStatement();
		
		//Get the max id and iterate to create the new goal_id
		ResultSet maxId = stmt.executeQuery("select max(goal_id) from "+table);
		maxId.next();
		int goal_id = maxId.getInt(1)+1;
		maxId.close();
		
  		stmt.executeUpdate("insert into "+db+"."+table+" (goal_id, goal, start_date, end_date) VALUES (\""+goal_id+"\", \""+goal+"\", \""+start+"\", \""+end+"\")");
		stmt.executeUpdate("insert into "+db+"."+relation+" (account_id, goal_id) values ("+account_id+", "+goal_id+")");
  		
		stmt.close();
		con.close();
  	}	
  
  	public void removeGoal(String account_id, String goal_id) throws Exception{
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db+"?autoReconnect=true&useSSL=false", user, pass);
		Statement stmt = con.createStatement();
		
  		stmt.executeUpdate("delete from "+db+"."+table+" where (goal_id=\""+goal_id+"\")");
  		stmt.executeUpdate("delete from "+db+"."+relation+" where (account_id="+account_id+") and (goal_id="+goal_id+")");
  		
		stmt.close();
		con.close();
  	}
  	
  	public void updateGoal(String goal_id, String goal, String start, String end) throws Exception{
  		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db+"?autoReconnect=true&useSSL=false", user, pass);
		Statement stmt = con.createStatement();
		
  		stmt.executeUpdate("update "+db+"."+table+" set goal=\""+goal+"\", start_date=\""+start+"\", end_date=\""+end+"\" where goal_id=\""+goal_id+"\"");
  		
		stmt.close();
		con.close();
  	}
  	
  %>
  </body>
</html>
