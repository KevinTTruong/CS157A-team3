jQuery(document).ready(function(){
    jQuery('.datetimepicker').datepicker({
        timepicker: true,
        language: 'en',
        range: true,
        multipleDates: true,
            multipleDatesSeparator: " - "
      });
    jQuery("#add-event").submit(function(){
        alert("Submitted");

        var values = {};
        $.each($('#add-event').serializeArray(), function(i, field) {
            values[field.name] = field.value;
        });
        console.log(
          values
        );
    });
  });

jQuery('#calendar').fullCalendar({
      themeSystem: 'bootstrap4',
      businessHours: false,
      defaultView: 'month',
      editable: true,
      customButtons: {
    	Add: {
	      text: 'Add',
	      click: function() {
	    	  jQuery('#modal-view-event-add').modal();
	      }
	    }
      },
      header: {
          left: 'title Add',
          center: 'month,agendaWeek,agendaDay',
          right: 'today prev,next'
      },
      //event sources 
      //getAll from db
    //   events: function(){
    //         fetch('http://localhost:3000/getAll')
    //         .then(response => response.json());                    
    //   },
    
      events: [

        {
            title: 'Team Meeting',
            description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.',
            start: '2021-11-10T13:00:00',
            end: '2021-11-10T16:00:00',
            className: 'fc-bg-pinkred',
            icon : "group",
            allDay: false
        },
        {
            title: 'Team Meeting 2',
            description: 'Discussion',
            start: '2021-11-15T13:00:00',
            end: '2021-11-15T16:00:00',
            className: 'fc-bg-blue',
            icon : "group",
        },
        {
            title: 'Team Meeting 3',
            description: 'Discussion',
            start: '2021-11-15T13:00:00',
            end: '2021-11-15T16:00:00',
            className: 'fc-bg-blue',
            icon : "group",
        }
    ],
    
      eventRender: function(event, element) {
          if(event.icon){
              element.find(".fc-title").prepend("<i class='fa fa-"+event.icon+"'></i>");
          }
        },
      eventClick: function(event, jsEvent, view) {
          jQuery('.event-icon').html("<i class='fa fa-"+event.icon+"'></i>");
    	  jQuery('.event-title').html(event.title);
          jQuery('.event-start').html(event.start.format("YYYY-MM-DD").toString());
          jQuery('.event-id').html(event.id);
          jQuery('.eventUrl').attr('href',event.url);
          if(event.end!=undefined){
        	  //Is a note or goal
        	  jQuery('.event-end').html(event.end.format("YYYY-MM-DD").toString());
          }else{
        	  //Is a task
        	  jQuery('.event-tags').html(event.extendedProp.tags);
              jQuery('.event-desc').html(event.description);
        	  
        	  //Remove tag render in title's input
        	  var tags = event.extendedProp.tags.split(" ");
	  		  tagResult = "";
	  		  for(let i=0;i<tags.length-1;i++){
	  			if(!(tags[i] === "")){
	  				tagResult += "["+tags[i]+"]";
	  			}
	  		  }
	  		  
		  	  if(tagResult === ""){
		  		  jQuery('.event-title-modified').html(event.title);
          	  }else{
          		  jQuery('.event-title-modified').html(event.title.substring(tagResult.length+1));
          	  }
          }
          jQuery('#modal-view-event').modal();          
          
          document.getElementById("x-id").value=jQuery("#event-id").text();
          document.getElementById("x-start").value=event.start.format("YYYY-MM-DD").toString();
          if(event.end!=undefined){
        	  //Is a note or goal
        	  document.getElementById("x-end").value=event.end.format("YYYY-MM-DD").toString();
          }else{
        	  //Is a task
        	  document.getElementById("x-tags").value=event.extendedProp.tags;
        	  document.getElementById("x-desc").value=event.description;
              document.getElementById("x-time").value=event.start.format("HH:mm:ss").toString();
              if(event.notification.toLowerCase() === "email"){
            	  document.getElementById("x-notif").selectedIndex="0";
              } else {
            	  document.getElementById("x-notif").selectedIndex="1";
              }
          }

          
      }
});

