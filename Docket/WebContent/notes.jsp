<%@ page import="java.sql.*"%>

<html>
<div class="wrapper">
<meta charset = "UTF-8">
<link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700&display=swap" rel="stylesheet"> 
<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700&display=swap" rel="stylesheet"> <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://maxcdn.icons8.com/fonts/line-awesome/1.1/css/line-awesome-font-awesome.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/css/datepicker.css'><link rel="stylesheet" href="./main.css">
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
        
        <div id="modal-view-event-add" class="modal modal-top fade calendar-modal">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
              <form id="add-event">
                <div class="modal-body">
                <h4>Add Note</h4>        
                  <div class="form-group">
                    <label>Notes</label>
                    <input type="text" class="form-control" name="notename">
                  </div>
                  <div class="form-group">
                    <label>Start Date</label>
                    <input type='date' class="form-control" name="notestartdate">
                  </div>        
                  <div class="form-group">
                    <label>End Date</label>
                    <input type='date' class="form-control" name="noteenddate">
                  </div>      
              </div>
                <div class="modal-footer">
                <button type="submit" class="btn btn-primary" >Save</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>        
              </div>
              </form>
            </div>
          </div>
        </div>
        
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
  <% 
     	String noteName = request.getParameter("notename");
  		String noteStartDate = request.getParameter("notestartdate");
  		String noteEndDate = request.getParameter("noteenddate");
  		
  		out.println(noteName+" "+noteStartDate+" fd "+noteEndDate);
    %>
  </body>
</html>

