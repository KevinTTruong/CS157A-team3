<%@ page import="java.sql.*"%>

<html>
<div class="wrapper">
<meta charset = "UTF-8">
<link href = "main.css" rel="stylesheet" type="text/css">
    <main>
      <div class="toolbar">
        <div class="toggle">
          <div class="toggle__option">week</div>
          <div class="toggle__option toggle__option--selected">month</div>
          <div class="toggle__option">year</div>
        </div>
        <div class="current-month">November 2021</div>
        <div class="search-input">
          <input type="text" value=" What are you looking for? ">
          <i class="fa fa-search"></i>
        </div>
      </div>
      <div class="button1">add event</div>
      <div class="button2">remove event</div>

      <div class="calendar">
        <div class="calendar__header">
          <div>mon</div>
          <div>tue</div>
          <div>wed</div>
          <div>thu</div>
          <div>fri</div>
          <div>sat</div>
          <div>sun</div>
        </div>
        <div class="calendar__week">
          <div class="calendar__day day">1</div>
          <div class="calendar__day day">2</div>
          <div class="calendar__day day">3</div>
          <div class="calendar__day day">4</div>
          <div class="calendar__day day">5</div>
          <div class="calendar__day day">6</div>
          <div class="calendar__day day">7</div>
        </div>
        <div class="calendar__week">
          <div class="calendar__day day">8</div>
          <div class="calendar__day day">9</div>
          <div class="calendar__day day">10</div>
          <div class="calendar__day day">11</div>
          <div class="calendar__day day">12</div>
          <div class="calendar__day day">13</div>
          <div class="calendar__day day">14</div>        
        </div>
        <div class="calendar__week">
          <div class="calendar__day day">15</div>
          <div class="calendar__day day">16</div>
          <div class="calendar__day day">17</div>
          <div class="calendar__day day">18</div>
          <div class="calendar__day day">19</div>
          <div class="calendar__day day">20</div>
          <div class="calendar__day day">21</div>    
        </div>
        <div class="calendar__week">
          <div class="calendar__day day">22</div>
          <div class="calendar__day day">23</div>
          <div class="calendar__day day">24</div>
          <div class="calendar__day day">25</div>
          <div class="calendar__day day">26</div> 
          <div class="calendar__day day">27</div> 
          <div class="calendar__day day">28</div> 
        </div>
        <div class="calendar__week">
          <div class="calendar__day day">29</div>
          <div class="calendar__day day">30</div>
          <div class="calendar__day day">1</div>
          <div class="calendar__day day">2</div>
          <div class="calendar__day day">3</div>
          <div class="calendar__day day">4</div>
          <div class="calendar__day day">5</div>
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
        <a class="menu__item" href="#">
          <i class="menu__icon fa fa-envelope"></i>
          <span class="menu__text">notes</span>
        </a>
        <a class="menu__item menu__item--active" href="#">
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
	
    <% 
     	String db = "planner";
		String table = "tasks";
		String user = "docket";
		String pass = "!d0ckeT2t3";
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
    %>
  </body>
</html>
