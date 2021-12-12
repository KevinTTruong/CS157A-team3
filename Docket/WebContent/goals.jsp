<%@ page import="java.sql.*"%>
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

<style>
.modal-message {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.4);
}

/* Modal Content */
.modal-message-content {
	background-color: #fefefe;
	margin: auto;
	padding: 100px;
	border: 1px solid #888;
	width: 80%;
}
</style>

<html>
<div class="wrapper">
	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	String account_id = request.getParameter("account_id");
	%>
	<script>
		function remove() {
			var url = window.location.href;
			if (url.indexOf('&') < 0) {
				window.location.assign(url + '&event_id='
						+ jQuery('#event-id').text());
			} else {
				window.location.assign(url.substring(0, url.indexOf('&'))
						+ '&event_id=' + jQuery('#event-id').text());
			}
		}
	</script>

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
			<div id="modal-view-event"
				class="modal modal-top fade calendar-modal">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<form id="modify-goal">
							<div class="modal-body">
								<h4 class="modal-title">
									<span class="event-icon"></span> 
									<span class="event-title"></span>
									<span id="event-id" class="event-id" style="display:none"></span>
                    				<span id="event-end" class="event-end" style="display:none"></span>
								</h4>
								<input type="hidden" name="account_id" value=<%=account_id%> />
								<!-- Save account_id on submit -->
								<input type="hidden" name="event_id" id="x-id" /> <input
									type="hidden" name="update" value="true" />
								<div class="form-group">
									<label>Goal</label>
									<textarea class="event-title form-control" name="goal"
										style="height: 200px;"></textarea>
								</div>
								<div class="form-group">
									<label>Start Date (yyyy-mm-dd)</label> <input id="x-start"
										type='date' class="event-start form-control"
										name="goalstartdate">
								</div>
								<div class="form-group">
									<label>End Date (yyyy-mm-dd)</label> <input id="x-end"
										type='date' class="event-end form-control" name="goalenddate">
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">Save</button>
								<button type="button" class="btn btn-primary" onclick="remove()">Remove</button>
								<button type="button" class="btn btn-primary"
									data-dismiss="modal">Close</button>
							</div>
						</form>
					</div>
				</div>
			</div>

			<!-- Add goal -->
			<div id="modal-view-event-add"
				class="modal modal-top fade calendar-modal">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<form id="add-goal">
							<div class="modal-body">
								<h4>Add Goal</h4>
								<input type="hidden" name="account_id" value=<%=account_id%> />
								<!-- Save account_id on submit -->
								<div class="form-group">
									<label>Goal</label>
									<textarea class="form-control" name="goal"
										style="height: 100px;"></textarea>
								</div>
								<div class="form-group">
									<label>Start Date (yyyy-mm-dd)</label> <input type='date'
										class="form-control" name="goalstartdate">
								</div>
								<div class="form-group">
									<label>End Date (yyyy-mm-dd)</label> <input type='date'
										class="form-control" name="goalenddate">
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">Save</button>
								<button type="button" class="btn btn-primary"
									data-dismiss="modal">Close</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			
						<!-- Create logout modal -->
			<div class="modal fade" id="logout">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">

						<div class="modal-body">
							<h4>Are you sure you want to log out?</h4>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary"
									onclick="location.href='account.jsp'">Log out</button>
								<button type="button" class="btn btn-primary"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			<%
			String goal = request.getParameter("goal");
			String goalStartDate = request.getParameter("goalstartdate");
			String goalEndDate = request.getParameter("goalenddate");
			String goal_id = request.getParameter("event_id");
			String update = request.getParameter("update");

			if (update != null && update.equals("true")) {
				try {
					updateGoal(goal_id, goal, goalStartDate, goalEndDate);
					//displayMessage(out, "Goal updated!");
				} catch (Exception e) {
					displayMessage(out, "Error: " + e.getMessage());
				}
			} else if ((goal != null && goalStartDate != null && goalEndDate != null) && goal_id == null) {
				try {
					addGoal(account_id, goal, goalStartDate, goalEndDate);
					displayMessage(out, "Goal added!");
				} catch (Exception e) {
					//MysqlDataTruncation = incorrect date format
					displayMessage(out, "Error: " + e.getMessage());
				}
			} else if (goal_id != null) {
				try {
					removeGoal(account_id, goal_id);
					displayMessage(out, "Goal removed!");
				} catch (Exception e) {
					displayMessage(out, "Error: " + e.getMessage());
				}
			}
			%>

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
			<i class="menu__icon fa fa-home"></i> <span class="menu__text">goals</span>
		</a> <a class="menu__item" href="notes.jsp?account_id=<%=account_id%>">
			<i class="menu__icon fa fa-envelope"></i> <span class="menu__text">notes</span>
		</a> <a class="menu__item menu__item--active"
			href="tasks.jsp?account_id=<%=account_id%>"> <i
			class="menu__icon fa fa-calendar"></i> <span class="menu__text">tasks</span>
		</a> <a class="menu__item" href="settings.jsp?account_id=<%=account_id%>">
			<i class="menu__icon fa fa-sliders"></i> <span class="menu__text">settings</span>
		</a> <a class="menu__item" href="#logout" data-toggle="modal"
			data-target="#logout"> <i class="menu__icon fa fa-sign-out"></i>
			<span class="menu__text">log out</span>
		</a>
	</nav>
	<div class="copyright">Docket &copy; 2021</div>
	</sidebar>

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
	renderGoals(out, account_id);
	%>

</div>
</html>
<%!String user = "docket";
	String pass = "!d0ckeT2t3";
	String db = "docket";
	String table = "goals";
	String relation = "have_goals";

	public void addGoal(String account_id, String goal, String start, String end) throws Exception {
		Connection con = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/" + db + "?autoReconnect=true&useSSL=false", user, pass);
		Statement stmt = con.createStatement();

		//Get the max id and iterate to create the new goal_id
		ResultSet maxId = stmt.executeQuery("select max(goal_id) from " + table);
		maxId.next();
		int goal_id = maxId.getInt(1) + 1;
		maxId.close();

		goal = goal.replace("\n", " ").replace("\'", "\\\'").replace("\"", "\\\"");
		stmt.executeUpdate("insert into " + db + "." + table + " (goal_id, goal, start_date, end_date) VALUES (\""
				+ goal_id + "\", \"" + goal + "\", \"" + start + "\", \"" + end + "\")");
		stmt.executeUpdate("insert into " + db + "." + relation + " (account_id, goal_id) values (" + account_id + ", "
				+ goal_id + ")");

		stmt.close();
		con.close();
	}

	public void removeGoal(String account_id, String goal_id) throws Exception {
		Connection con = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/" + db + "?autoReconnect=true&useSSL=false", user, pass);
		Statement stmt = con.createStatement();
		ResultSet verifyAccess = stmt.executeQuery("select * from " + db + "." + relation + " JOIN " + db + "." + table
				+ " USING(goal_id) WHERE goal_id=\"" + goal_id + "\" and account_id=\"" + account_id + "\"");
		if (verifyAccess.next() == false) {
			throw new Exception("Could not remove goal!");
		}

		stmt.executeUpdate("delete from " + db + "." + table + " where (goal_id=\"" + goal_id + "\")");
		stmt.executeUpdate("delete from " + db + "." + relation + " where (account_id=" + account_id + ") and (goal_id="
				+ goal_id + ")");

		verifyAccess.close();
		stmt.close();
		con.close();
	}

	public void updateGoal(String goal_id, String goal, String start, String end) throws Exception {
		Connection con = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/" + db + "?autoReconnect=true&useSSL=false", user, pass);
		Statement stmt = con.createStatement();

		String query = "update " + db + "." + table + " set ";
		boolean notFirst = false;
		if (!goal_id.isEmpty()) {
			query += "goal=\"" + goal + "\"";
			notFirst = true;
		}
		if (!start.isEmpty()) {
			if (notFirst)
				query += ", ";
			query += "start_date=\"" + start + "\"";
			notFirst = true;
		}
		if (!end.isEmpty()) {
			if (notFirst)
				query += ", ";
			query += "end_date=\"" + end + "\"";
		}
		query += " where goal_id=\"" + goal_id + "\"";

		stmt.executeUpdate(query);

		stmt.close();
		con.close();
	}

	public void displayMessage(javax.servlet.jsp.JspWriter out, String message) throws Exception {
		out.write("<div id=\"message\" class=\"modal-message\">");
		out.write("<div class=\"modal-message-content\">");
		out.write(message);
		out.write("</div>");
		out.write("</div>");
	}

	public void renderGoals(javax.servlet.jsp.JspWriter out, String account_id) throws Exception {
		//Range: current/given month
		Connection con = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/" + db + "?autoReconnect=true&useSSL=false", user, pass);
		Statement stmt = con.createStatement();
		ResultSet allGoals = stmt.executeQuery("select * from " + db + "." + relation + " JOIN " + db + "." + table
				+ " USING(goal_id) WHERE account_id=\"" + account_id + "\"");

		out.write("<script>");
		out.write("$('#calendar').fullCalendar('removeEvents');"); //Refresh event list
		out.write("var events=[];"); //Initialize list of events

		if (allGoals.next() == true) { //Abort if query set is empty
			//Collect events from database and Add event to list
			while (!allGoals.isAfterLast()) {
				String text = allGoals.getString(3).replace("\n", "\\n").replace("\'", "\\\'").replace("\"", "\\\"");

				out.write("events.push({id:" + allGoals.getInt(1) + ", title:'" + text + "', start:'"
						+ allGoals.getString(4) + "T00:00:00', end:'" + allGoals.getString(5)
						+ "T23:00:00', icon:'group'});");
				allGoals.next();
			}
			out.write("$('#calendar').fullCalendar( 'addEventSource', events);");
		}
		out.write("</script>");

		allGoals.close();
		stmt.close();
		con.close();
	}%>

