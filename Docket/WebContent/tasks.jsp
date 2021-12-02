<%@ page import="java.sql.*" import="java.text.SimpleDateFormat"
	import="java.util.Date"%>

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
						<div class="modal-body">
							<h4 class="modal-title">
								<span class="event-icon"></span><span class="event-title"></span>
							</h4>
							<div class="event-body"></div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary">Remove</button>
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>

			<div id="modal-view-event-add"
				class="modal modal-top fade calendar-modal">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<form id="add-event">
							<div class="modal-body">
								<h4>Add Event Detail</h4>
								<div class="form-group">
									<label>Event name</label> <input type="text"
										class="form-control" name="ename">
								</div>
								<div class="form-group">
									<label>Event Date</label> <input type='text'
										class="datetimepicker form-control" name="edate">
								</div>
								<div class="form-group">
									<label>Event Description</label>
									<textarea class="form-control" name="edesc"></textarea>
								</div>
								<!-- 
								<div class="form-group">
									<label>Event Color</label> <select class="form-control"
										name="ecolor">
										<option value="fc-bg-default">Default</option>
										<option value="fc-bg-blue">Blue</option>
										<option value="fc-bg-lightgreen">Light green</option>
										<option value="fc-bg-deepskyblue">Deep sky blue</option>
									</select>
								</div>
								<div class="form-group">
									<label>Event Icon</label> <select class="form-control"
										name="eicon">
										<option value="circle">Circle</option>
										<option value="cog">Cog</option>
										<option value="group">Group</option>
									</select>
								</div>-->
								<div class="form-group">
									<label>Notification</label> <select class="form-control"
										name="notif-type">
										<option value="email">email</option>
										<option value="text">text</option>
									</select>
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

			<!-- View task -->
			<div id="modal-view-event"
				class="modal modal-top fade calendar-modal">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<form id="modifytask">
							<div class="modal-body">
								<h4 class="modal-title">
									<span class="event-icon"></span> <span class="event-title"></span>
								</h4>
								<input type="hidden" name="account_id" value=<%=account_id%> />
								<!-- Save account_id on submit -->
								<input type="hidden" name="event_id" id="x-id" /> <input
									type="hidden" name="update" value="true" />
								<div class="form-group">
									<label>Task</label>
									<textarea class="event-title form-control" name="task"
										style="height: 200px;"></textarea>
								</div>
								<div class="form-group">
									<label>Description</label> <input type='text'
										class="event-desc form-control" name="desc"
										style="height: 200px;">
								</div>
								<div class="form-group">
									<label>Date (yyyy-mm-dd)</label> <input id="x-start"
										type='date' class="event-start form-control" name="date">
								</div>
								<div class="form-group">
									<label>Time (hh:mm:ss)</label> <input id="x-start" type='time'
										class="event-time form-control" name="time">
								</div>
								<div class="form-group">
									<label>Notification</label>
									<!-- TODO: drop down menu -->
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

			<%
			String taskName = request.getParameter("ename");
			String taskDesc = request.getParameter("edesc");
			String dateTime = request.getParameter("edate");
			String date = "";
			String time = "";
			if (dateTime != null) {
				String original = dateTime.substring(0, dateTime.indexOf(" ")).replaceAll("/", "-");
				date = original.substring(6) + "-" + original.substring(0, 5);

				SimpleDateFormat military = new SimpleDateFormat("HH:mm");
				SimpleDateFormat normal = new SimpleDateFormat("hh:mm a");
				Date parsedTime = normal.parse(dateTime.substring(dateTime.indexOf(" ") + 1));
				time = military.format(parsedTime) + ":00";
			}
			String taskNotif = request.getParameter("notif-type");
			String update = request.getParameter("update");
			String task_id = request.getParameter("event_id");

			//String account_id, String title, String desc, String date, String time, String notificationType

			if (update != null && update.equals("true")) {
				try {
					//updateNote(account_id, taskName, taskDesc, taskTime, taskNotif);
					//displayMessage(out, "Note updated!");
				} catch (Exception e) {
					displayMessage(out, "Error: " + e.getMessage());
				}
			} else if ((taskName != null && taskDesc != null && date != null && time != null && taskNotif != null)
					&& task_id == null) {
				try {
					addTask(account_id, taskName, taskDesc, date, time, taskNotif);
					displayMessage(out, "Note added!");
				} catch (Exception e) {
					//MysqlDataTruncation = incorrect date format
					displayMessage(out, "Error: " + e.getMessage());
				}
			} else if (task_id != null) {
				try {
					//removeNote(account_id, task_id);
					displayMessage(out, "Note removed!");
				} catch (Exception e) {
					displayMessage(out, "Error: " + e.getMessage());
				}
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
			<i class="menu__icon fa fa-home"></i> <span class="menu__text">goals</span>
		</a> <a class="menu__item" href="notes.jsp?account_id=<%=account_id%>">
			<i class="menu__icon fa fa-envelope"></i> <span class="menu__text">notes</span>
		</a> <a class="menu__item menu__item--active"
			href="tasks.jsp?account_id=<%=account_id%>"> <i
			class="menu__icon fa fa-calendar"></i> <span class="menu__text">calendar</span>
		</a> <a class="menu__item" href="settings.jsp?account_id=<%=account_id%>">
			<i class="menu__icon fa fa-sliders"></i> <span class="menu__text">settings</span>
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
		<% renderTasks(out, account_id); %>
</div>
</html>

<%!String user = "docket";
	String pass = "!d0ckeT2t3";
	String db = "docket";
	String table = "tasks";
	String relation = "create_task";
	String notifyTable = "notification";
	String notifyRelation = "set_notification";

	public void addTask(String account_id, String title, String desc, String date, String time, String notificationType)
			throws Exception {
		if (desc.isEmpty() || desc == null)
			desc = "";

		Connection con = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/" + db + "?autoReconnect=true&useSSL=false", user, pass);
		Statement stmt = con.createStatement();

		//Get the max id and iterate to create the new note_id
		ResultSet maxTaskId = stmt.executeQuery("select max(task_id) from " + table);
		maxTaskId.next();
		int task_id = maxTaskId.getInt(1) + 1;
		maxTaskId.close();
		System.out.println("task id is " + task_id);

		ResultSet maxNotifyId = stmt.executeQuery("select max(task_id) from " + table);
		maxNotifyId.next();
		int noti_id = maxNotifyId.getInt(1) + 1;
		maxNotifyId.close();
		System.out.println("nofif id is " + noti_id);

		desc = desc.replace("\n", " ").replace("\'", "\\\'").replace("\"", "\\\"");
		title = title.replace("\n", " ").replace("\'", "\\\'").replace("\"", "\\\"");


		stmt.executeUpdate("insert into " + db + "." + table + " (task_id, title, description, date, time) VALUES (\""
				+ task_id + "\", \"" + title + "\", \"" + desc + "\", \"" + date + "\", \"" + time + "\")");
		stmt.executeUpdate("insert into " + db + "." + relation + " (account_id, task_id) values (" + account_id + ", "
				+ task_id + ")");
		stmt.executeUpdate("insert into " + db + "." + notifyTable + " (notification_id, date, time, type) VALUES (\""
				+ noti_id + "\", \"" + date + "\", \"" + time + "\", \"" + notificationType + "\")");
		stmt.executeUpdate("insert into " + db + "." + notifyRelation + " (task_id, notification_id) values (" + task_id
				+ ", " + noti_id + ")");

		stmt.close();
		con.close();
	}
	/*
	public void removeNote(String account_id, String task_id) throws Exception{
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db+"?autoReconnect=true&useSSL=false", user, pass);
		Statement stmt = con.createStatement();
		
		//Verify Account access
		ResultSet verifyAccess = stmt.executeQuery("select * from "+db+"."+relation+" JOIN "+db+"."+table+" USING(task_id) WHERE tasj_id=\""+task_id+"\" and account_id=\""+account_id+"\"");
		if(verifyAccess.next() == false){
				throw new Exception("Could not remove task!");
			}
		
		//Get notification_id
		ResultSet getNotiId = stmt.executeQuery("SELECT notification_id FROM "+db+"."+notifyRelation+" WHERE task_id=5");
		getNotiId.next();
		int noti_id = getNotiId.getInt(1)+1;
		getNotiId.close();
		
		//SELECT notification_id FROM docket.set_notification WHERE task_id=5;
		stmt.executeUpdate("delete from "+db+"."+relation+" where (account_id="+account_id+") and (note_id="+note_id+")");
		stmt.executeUpdate("delete from "+db+"."+table+" where (note_id=\""+note_id+"\")");
	
		verifyAccess.close();
		stmt.close();
		con.close();
	}
	
	public void updateNote(String note_id, String note, String start, String end) throws Exception{
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db+"?autoReconnect=true&useSSL=false", user, pass);
		Statement stmt = con.createStatement();
		
		String query = "update "+db+"."+table+" set ";
		boolean notFirst = false;
		if(!note_id.isEmpty()){
			query += "notes=\""+note+"\"";
			notFirst=true;
		}
		if(!start.isEmpty()){
			if(notFirst) query += ", ";
			query += "start_date=\""+start+"\"";
			notFirst=true;
		}
		if(!end.isEmpty()){
			if(notFirst) query += ", ";
			query += "end_date=\""+end+"\"";
		}
		query += " where note_id=\""+note_id+"\"";
		
			stmt.executeUpdate(query);
			
		stmt.close();
		con.close();
	}*/

	public void displayMessage(javax.servlet.jsp.JspWriter out, String message) throws Exception {
		out.write("<div id=\"message\" class=\"modal-message\">");
		out.write("<div class=\"modal-message-content\">");
		out.write(message);
		out.write("</div>");
		out.write("</div>");
	}

	public void renderTasks(javax.servlet.jsp.JspWriter out, String account_id) throws Exception {
		//Range: current/given month
		Connection con = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/" + db + "?autoReconnect=true&useSSL=false", user, pass);
		Statement stmt = con.createStatement();
		ResultSet allNotes = stmt.executeQuery("select * from " + db + "." + relation + " JOIN " + db + "." + table
				+ " USING(task_id) WHERE account_id=\"" + account_id + "\"");

		out.write("<script>");
		out.write("$('#calendar').fullCalendar('removeEvents');"); //Refresh event list
		out.write("var events=[];"); //Initialize list of events

		if (allNotes.next() == true) { //Abort if query set is empty
			//Collect events from database and Add event to list
			while (!allNotes.isAfterLast()) {
				String text = allNotes.getString(3).replace("\n", "\\n").replace("\'", "\\\'").replace("\"", "\\\"");

				out.write("events.push({id:" + allNotes.getInt(1) + ", title:'" + text + "', start:'"
						+ allNotes.getString(4) + "T00:00:00', end:'" + allNotes.getString(5)
						+ "T23:00:00', icon:'group'});");
				allNotes.next();
			}
			out.write("$('#calendar').fullCalendar( 'addEventSource', events);");
		}
		out.write("</script>");

		allNotes.close();
		stmt.close();
		con.close();
	}%>
</body>
</html>

