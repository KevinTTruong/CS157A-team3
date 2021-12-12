<%@ page import="java.sql.*" import="java.text.SimpleDateFormat"
	import="java.util.Date" import="java.util.ArrayList"%>

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

		function logout() {
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

			<!-- View task -->
			<div id="modal-view-event"
				class="modal modal-top fade calendar-modal">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<form id="modifytask">
							<div class="modal-body">
								<h4 class="modal-title">
									<span class="event-icon"></span> <span class="tag-display"></span>
									<span class="event-title"></span> <span id="event-id"
										class="event-id" style="display: none"></span> <span
										id="event-time" class="event-time" style="display: none"></span>
								</h4>
								<input type="hidden" name="account_id" value=<%=account_id%> />
								<!-- Save account_id on submit -->
								<input type="hidden" name="event_id" id="x-id" /> <input
									type="hidden" name="update" value="true" />
								<div class="form-group">
									<label>Task</label>
									<textarea class="event-title-modified form-control"
										name="ename"></textarea>
								</div>
								<div class="form-group">
									<label>Task Description</label>
									<textarea class="event-title form-control" name="edesc"
										id="x-desc" style="height: 200px;"></textarea>
								</div>
								<div class="form-group">
									<label>Date (yyyy-mm-dd)</label> <input id="x-start"
										type='date' class="event-start form-control" name="edate">
								</div>
								<div class="form-group">
									<label>Time (hh:mm:ss)</label> <input id="x-time" type='time'
										class="event-time form-control" name="etime">
								</div>
								<div class="form-group">
									<label>Notification Type</label> <select id="x-notif"
										class="form-control" name="notif-type">
										<option value="email">email</option>
										<option value="text">text</option>
									</select>
								</div>
								<div class="form-group">
									<label>Tags (separate with spaces)</label> <input
										class="event-tags form-control" name="tags" id="x-tags">
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

			<!-- Add task -->
			<div id="modal-view-event-add"
				class="modal modal-top fade calendar-modal">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<form id="add-event">
							<div class="modal-body">
								<h4>Add Task</h4>
								<input type="hidden" name="account_id" value=<%=account_id%> />
								<!-- Save account_id on submit -->
								<div class="form-group">
									<label>Task Name</label>
									<textarea class="form-control" name="ename"></textarea>
								</div>
								<div class="form-group">
									<label>Task Description</label>
									<textarea class="form-control" name="edesc"></textarea>
								</div>
								<div class="form-group">
									<label>Date (yyyy-mm-dd)</label> <input type='date'
										class="form-control" name="edate">
								</div>
								<div class="form-group">
									<label>Time (hh:mm:ss)</label> <input type='time'
										class="form-control" name="etime">
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
									<label>Notification Type</label> <select class="form-control"
										name="notif-type">
										<option value="email">email</option>
										<option value="text">text</option>
									</select>
								</div>
								<div class="form-group">
									<label>Tags (separate with spaces)</label> <input
										class="form-control" name="tags">
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
			String taskName = request.getParameter("ename");
			String taskDesc = request.getParameter("edesc");
			String date = request.getParameter("edate");
			String time = request.getParameter("etime");
			String taskNotif = request.getParameter("notif-type");
			String update = request.getParameter("update");
			String task_id = request.getParameter("event_id");
			String tags = request.getParameter("tags");

			//String account_id, String title, String desc, String date, String time, String notificationType

			if (update != null && update.equals("true")) {
				try {
					updateTask(out, task_id, taskName, taskDesc, date, time, taskNotif, tags);
					displayMessage(out, "Task updated!");
				} catch (Exception e) {
					displayMessage(out, "Error: " + e.getMessage());
				}
			} else if (account_id != null
					&& (taskName != null && taskDesc != null && date != null && time != null && taskNotif != null)
					&& task_id == null) {
				try {
					addTask(account_id, taskName, taskDesc, date, time, taskNotif, tags);
					displayMessage(out, "Task added!");
				} catch (Exception e) {
					//MysqlDataTruncation = incorrect date format
					displayMessage(out, "Error: " + e.getMessage());
				}
			} else if (task_id != null) {
				try {
					removeTask(account_id, task_id);
					displayMessage(out, "Task removed!");
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
	renderTasks(out, account_id);
	%>
</div>
</html>

<%!String user = "docket";
	String pass = "!d0ckeT2t3";
	String db = "docket";
	String table = "tasks";
	String relation = "create_task";
	String notifyTable = "notification";
	String notifyRelation = "set_notification";
	String tagTable = "tag";
	String tagRelation = "tagged";

	public void addTask(String account_id, String title, String desc, String date, String time, String notificationType,
			String tags) throws Exception {
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

		desc = desc.replace("\n", " ").replace("\'", "\\\'").replace("\"", "\\\"");
		title = title.replace("\n", " ").replace("\'", "\\\'").replace("\"", "\\\"");

		//Insert task to db
		stmt.executeUpdate("insert into " + db + "." + table + " (task_id, title, description, date, time) VALUES (\""
				+ task_id + "\", \"" + title + "\", \"" + desc + "\", \"" + date + "\", \"" + time + "\")");
		stmt.executeUpdate("insert into " + db + "." + relation + " (account_id, task_id) values (" + account_id + ", "
				+ task_id + ")");

		//Insert notification to db
		ResultSet maxNotifyId = stmt.executeQuery("select max(notification_id) from " + notifyTable);
		maxNotifyId.next();
		int noti_id = maxNotifyId.getInt(1) + 1;
		maxNotifyId.close();

		stmt.executeUpdate("insert into " + db + "." + notifyTable + " (notification_id, date, time, type) VALUES (\""
				+ noti_id + "\", \"" + date + "\", \"" + time + "\", \"" + notificationType + "\")");
		stmt.executeUpdate("insert into " + db + "." + notifyRelation + " (task_id, notification_id) values (" + task_id
				+ ", " + noti_id + ")");

		//Insert of tags to db
		ResultSet maxTagId = stmt.executeQuery("select max(tag_id) from " + db + "." + tagTable);
		maxTagId.next();
		int tag_id = maxTagId.getInt(1) + 1;
		maxTagId.close();

		for (String tag : tags.split(" ")) {
			if (!tag.isEmpty()) {
				stmt.executeUpdate("insert into " + db + "." + tagTable + " (tag_id, label) values (" + tag_id + ", '"
						+ tag + "')");
				stmt.executeUpdate("insert into " + db + "." + tagRelation + " (task_id, tag_id) values (" + task_id
						+ ", " + tag_id + ")");
				tag_id++;
			}
		}
		stmt.close();
		con.close();
	}

	public void removeTask(String account_id, String task_id) throws Exception {
		Connection con = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/" + db + "?autoReconnect=true&useSSL=false", user, pass);
		Statement stmt = con.createStatement();

		//Verify Account access
		ResultSet verifyAccess = stmt.executeQuery("select * from " + db + "." + relation + " JOIN " + db + "." + table
				+ " USING(task_id) WHERE task_id=\"" + task_id + "\" and account_id=\"" + account_id + "\"");
		if (verifyAccess.next() == false) {
			throw new Exception("Could not remove task!");
		}

		//Get notification_id
		ResultSet getNotiId = stmt
				.executeQuery("SELECT notification_id FROM " + db + "." + notifyRelation + " WHERE task_id=" + task_id);
		getNotiId.next();
		int noti_id = getNotiId.getInt(1);
		getNotiId.close();

		stmt.executeUpdate("delete from " + db + "." + relation + " where (account_id=" + account_id + ") and (task_id="
				+ task_id + ")");
		stmt.executeUpdate("delete from " + db + "." + notifyRelation + " where (notification_id=" + noti_id
				+ ") and (task_id=" + task_id + ")");
		stmt.executeUpdate("delete from " + db + "." + table + " where (task_id=\"" + task_id + "\")");
		stmt.executeUpdate("delete from " + db + "." + notifyTable + " where (notification_id=\"" + noti_id + "\")");
		stmt.executeUpdate("delete from " + db + "." + tagTable + " where tag_id in (SELECT tag_id FROM " + db + "."
				+ tagRelation + " where task_id=" + task_id + ")");
		stmt.executeUpdate("delete from " + db + "." + tagRelation + " where task_id=" + task_id);

		verifyAccess.close();
		stmt.close();
		con.close();
	}

	public void updateTask(javax.servlet.jsp.JspWriter out, String task_id, String title, String desc, String date,
			String time, String notificationType, String tags) throws Exception {
		Connection con = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/" + db + "?autoReconnect=true&useSSL=false", user, pass);
		Statement stmt = con.createStatement();

		//Update task
		String taskQuery = "update " + db + "." + table + " set ";
		boolean notFirst = false;
		if (!task_id.isEmpty()) {
			taskQuery += "title=\"" + title + "\"" + ", description=\"" + desc + "\"";
			notFirst = true;
		}
		if (!date.isEmpty()) {
			if (notFirst)
				taskQuery += ", ";
			taskQuery += "date=\"" + date + "\"";
			notFirst = true;
		}
		if (!time.isEmpty()) {
			if (notFirst)
				taskQuery += ", ";
			taskQuery += "time=\"" + time + "\"";
			notFirst = true;
		}
		taskQuery += " where task_id=\"" + task_id + "\"";
		if (notFirst)
			stmt.executeUpdate(taskQuery);

		//Update notification
		ResultSet notifId = stmt.executeQuery(
				"select notification_id from " + db + "." + notifyRelation + " where task_id=\"" + task_id + "\"");
		notifId.next();
		int notification_id = notifId.getInt(1);
		notifId.close();

		String notifQuery = "update " + db + "." + notifyTable + " set ";
		notFirst = false;
		if (!date.isEmpty()) {
			notifQuery += "date=\"" + date + "\"";
			notFirst = true;
		}
		if (!time.isEmpty()) {
			if (notFirst)
				notifQuery += ", ";
			notifQuery += "time=\"" + time + "\"";
			notFirst = true;
		}
		if (!notificationType.isEmpty()) {
			if (notFirst)
				notifQuery += ", ";
			notifQuery += "type=\"" + notificationType + "\"";
			notFirst = true;
		}
		notifQuery += " where notification_id=\"" + notification_id + "\"";
		if (notFirst)
			stmt.executeUpdate(notifQuery);

		//Update tag
		ResultSet maxTagId = stmt.executeQuery("select max(tag_id) from " + db + "." + tagTable);
		maxTagId.next();
		int tag_id = maxTagId.getInt(1) + 1;
		maxTagId.close();

		//Retrieve list of tags in db
		ArrayList<String> retrievedTags = new ArrayList<String>();
		ResultSet dbTags = stmt.executeQuery("select label from " + db + "." + tagRelation + " join " + db + "."
				+ tagTable + " using (tag_id) where task_id=" + task_id);
		if (dbTags.next() == true) {
			while (!dbTags.isAfterLast()) {
				retrievedTags.add(dbTags.getString(1));
				dbTags.next();
			}
		}
		dbTags.close();

		for (String tag : tags.split(" ")) {
			//Check if tag exists
			if (retrievedTags.contains(tag)) {
				retrievedTags.remove(tag);
			} else if (!tag.isEmpty() && !tag.equals(" ")) {//Insert new tag
				stmt.executeUpdate("insert into " + db + "." + tagTable + " (tag_id, label) values (" + tag_id + ", '"
						+ tag + "')");
				stmt.executeUpdate("insert into " + db + "." + tagRelation + " (task_id, tag_id) values (" + task_id
						+ ", " + tag_id + ")");
				tag_id++;
			}
		}
		//Remove deleted tags (the tags left in retrievedTags)
		if (!retrievedTags.isEmpty()) {
			for (String tag : retrievedTags) {
				ResultSet delTag = stmt.executeQuery("select tag_id from " + db + "." + tagRelation + " join " + db
						+ "." + tagTable + " using (tag_id) where task_id=" + task_id + " and label='" + tag + "'");
				delTag.next();
				int subqueryId = delTag.getInt(1);
				delTag.close();

				stmt.executeUpdate("delete from " + db + "." + tagRelation + " where tag_id=(" + subqueryId + ")");
				stmt.executeUpdate("delete from " + db + "." + tagTable + " where tag_id=(" + subqueryId + ")");
			}
		}
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

	public void renderTasks(javax.servlet.jsp.JspWriter out, String account_id) throws Exception {
		//Range: current/given month
		Connection con = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/" + db + "?autoReconnect=true&useSSL=false", user, pass);
		Statement stmt = con.createStatement();
		Statement notifStmt = con.createStatement();
		Statement tagStmt = con.createStatement();
		ResultSet allTasks = stmt.executeQuery("select * from " + db + "." + relation + " JOIN " + db + "." + table
				+ " USING(task_id) WHERE account_id=\"" + account_id + "\"");

		out.write("<script>");
		out.write("$('#calendar').fullCalendar('removeEvents');"); //Refresh event list
		out.write("var events=[];"); //Initialize list of events

		if (allTasks.next() == true) { //Abort if query set is empty
			//Collect events from database and Add event to list
			while (!allTasks.isAfterLast()) {
				//Get notification
				ResultSet getNotiType = notifStmt.executeQuery("select " + notifyTable + ".type from " + db + "."
						+ notifyRelation + " JOIN " + db + "." + notifyTable
						+ " USING(notification_id) WHERE task_id=\"" + allTasks.getString(1) + "\"");
				getNotiType.next();
				String notifType = getNotiType.getString(1);
				getNotiType.close();

				//Get tasks
				String tags = "";
				ResultSet getTags = tagStmt.executeQuery("select label from " + db + "." + tagRelation + " join " + db
						+ "." + tagTable + " using (tag_id) where task_id=" + allTasks.getInt(1));
				if (getTags.next() == true) {
					while (!getTags.isAfterLast()) {
						tags += getTags.getString(1) + " ";
						getTags.next();
					}
				}
				getTags.close();

				//Adjust texts
				String title = "";
				for (String tag : tags.split(" ")) {
					if (!tag.isEmpty()) {
						title += "[" + tag + "] ";
					}
				}
				title += allTasks.getString(3).replace("\n", "\\n").replace("\'", "\\\'").replace("\"", "\\\"");

				String desc = allTasks.getString(4).replace("\n", "\\n").replace("\'", "\\\'").replace("\"", "\\\"");

				//Add to events in FullCalendar
				out.write("events.push({id:" + allTasks.getInt(1) + ", title:'" + title + "', start:'"
						+ allTasks.getString(5) + "T" + allTasks.getString(6) + "', icon:'group', description: '" + desc
						+ "', notification:'" + notifType + "', extendedProp: {'tags': '" + tags + "'}});");

				allTasks.next();
			}
			out.write("$('#calendar').fullCalendar( 'addEventSource', events);");
		}
		out.write("</script>");

		allTasks.close();
		tagStmt.close();
		notifStmt.close();
		stmt.close();
		con.close();
	}%>
</body>
</html>

