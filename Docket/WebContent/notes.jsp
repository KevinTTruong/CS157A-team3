<%@ page 
	import="java.sql.*"
	import="java.time.LocalDate"
%>
<html>
<div class="wrapper">
<meta charset = "UTF-8">
<link href = "main.css" rel="stylesheet" type="text/css">
    <%!
    /*
    TODO:
    Add note
    -UI
    Remove note
    -UI
    Display note
    -Retrieve note from SQL using range (week/month)
    -UI
    Find a way to initialize/reinitialize dates
    */
     	String db = "planner";
		String table = "tasks";
		String user = "docket";
		String pass = "!d0ckeT2t3";
		
		int[][] days = new int[7][5];
		String currentMonth = "";
		public void initializeDates(int year, int month, int startDay){
			LocalDate date = LocalDate.of(year, month, startDay);
			boolean initializeCurrentMonth = true;
			for(int i=0;i<5;i++){
				for(int j=0;j<7;j++,date = date.plusDays(1)){
					days[j][i] = date.getDayOfMonth();
					if(date.getDayOfMonth()==1&&initializeCurrentMonth){
						currentMonth += date.getMonth()+" "+date.getYear();
						initializeCurrentMonth = false;
					}
				}
			}
		}
		/*
		try {
			Class.forName("com.mysql.jdbc.Driver");
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
		*/
    %>
    <%
    	initializeDates(2021, 11, 28); 
    %>
    <main>
      <div class="toolbar">
        <div class="toggle">
          <div class="toggle__option">week</div>
          <div class="toggle__option toggle__option--selected">month</div>
          <div class="toggle__option">year</div>
        </div>
        <div class="current-month"><%out.println(currentMonth);%></div>
        <div class="search-input">
          <input type="text" value=" What are you looking for? ">
          <i class="fa fa-search"></i>
        </div>
      </div>
      <div class="button1">add note</div>
      <div class="button2">remove note</div>

      <div class="calendar">
        <div class="calendar__header">
          <div>sun</div>
          <div>mon</div>
          <div>tue</div>
          <div>wed</div>
          <div>thu</div>
          <div>fri</div>
          <div>sat</div>
        </div>
        <div class="calendar__week">
          <div class="calendar__day day"><%out.println(days[0][0]);%></div>
          <div class="calendar__day day"><%out.println(days[1][0]);%></div>
          <div class="calendar__day day"><%out.println(days[2][0]);%></div>
          <div class="calendar__day day"><%out.println(days[3][0]);%></div>
          <div class="calendar__day day"><%out.println(days[4][0]);%></div>
          <div class="calendar__day day"><%out.println(days[5][0]);%></div>
          <div class="calendar__day day"><%out.println(days[6][0]);%></div>
        </div>
        <div class="calendar__week">
          <div class="calendar__day day"><%out.println(days[0][1]);%></div>
          <div class="calendar__day day"><%out.println(days[1][1]);%></div>
          <div class="calendar__day day"><%out.println(days[2][1]);%></div>
          <div class="calendar__day day"><%out.println(days[3][1]);%></div>
          <div class="calendar__day day"><%out.println(days[4][1]);%></div>
          <div class="calendar__day day"><%out.println(days[5][1]);%></div>
          <div class="calendar__day day"><%out.println(days[6][1]);%></div>      
        </div>
        <div class="calendar__week">
          <div class="calendar__day day"><%out.println(days[0][2]);%></div>
          <div class="calendar__day day"><%out.println(days[1][2]);%></div>
          <div class="calendar__day day"><%out.println(days[2][2]);%></div>
          <div class="calendar__day day"><%out.println(days[3][2]);%></div>
          <div class="calendar__day day"><%out.println(days[4][2]);%></div>
          <div class="calendar__day day"><%out.println(days[5][2]);%></div>
          <div class="calendar__day day"><%out.println(days[6][2]);%></div>  
        </div>
        <div class="calendar__week">
          <div class="calendar__day day"><%out.println(days[0][3]);%></div>
          <div class="calendar__day day"><%out.println(days[1][3]);%></div>
          <div class="calendar__day day"><%out.println(days[2][3]);%></div>
          <div class="calendar__day day"><%out.println(days[3][3]);%></div>
          <div class="calendar__day day"><%out.println(days[4][3]);%></div>
          <div class="calendar__day day"><%out.println(days[5][3]);%></div>
          <div class="calendar__day day"><%out.println(days[6][3]);%></div>
        </div>
        <div class="calendar__week">
          <div class="calendar__day day"><%out.println(days[0][4]);%></div>
          <div class="calendar__day day"><%out.println(days[1][4]);%></div>
          <div class="calendar__day day"><%out.println(days[2][4]);%></div>
          <div class="calendar__day day"><%out.println(days[3][4]);%></div>
          <div class="calendar__day day"><%out.println(days[4][4]);%></div>
          <div class="calendar__day day"><%out.println(days[5][4]);%></div>
          <div class="calendar__day day"><%out.println(days[6][4]);%></div>
        </div>
      </div>
    </main>
    <sidebar>
      <div class="avatar">
        <div class="avatar__img">
          <img src="https://picsum.photos/70" alt="avatar">
        </div>
        <div class="avatar__name">User</div>
      </div>
      <nav class="menu">
        <a class="menu__item" href="#">
          <i class="menu__icon fa fa-home"></i>
          <span class="menu__text">goals</span>
        </a>
        <a class="menu__item menu__item--active" href="notes.jsp">
          <i class="menu__icon fa fa-envelope"></i>
          <span class="menu__text">notes</span>
        </a>
        <a class="menu__item" href="tasks.jsp">
          <i class="menu__icon fa fa-calendar"></i>
          <span class="menu__text">calendar</span>
        </a>
        <a class="menu__item" href="#">
          <i class="menu__icon fa fa-trophy"></i>
          <span class="menu__text">achivements</span>
        </a>
        <a class="menu__item" href="#">
          <i class="menu__icon fa fa-sliders"></i>
          <span class="menu__text">settings</span>
        </a>
      </nav>
      <div class="copyright">Docket &copy; 2021</div>
    </sidebar>
  </div>
  </html>
  </body>
</html>
