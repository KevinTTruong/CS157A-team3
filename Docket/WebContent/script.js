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

  (function () {    
      'use strict';
      jQuery(function() {
          jQuery('#calendar').fullCalendar({
              themeSystem: 'bootstrap4',
              businessHours: false,
              defaultView: 'month',
              editable: true,
              header: {
                  left: 'title',
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
                    description: 'Discussion',
                    start: '2021-11-10T13:00:00',
                    end: '2021-11-10T16:00:00',
                    className: 'fc-bg-blue',
                    icon : "group",
                    allDay: false
                }],
              eventRender: function(event, element) {
                  if(event.icon){
                      element.find(".fc-title").prepend("<i class='fa fa-"+event.icon+"'></i>");
                  }
                },
              dayClick: function() {
                  jQuery('#modal-view-event-add').modal();
              }
            ,
              eventClick: function(event, jsEvent, view) {
                      jQuery('.event-icon').html("<i class='fa fa-"+event.icon+"'></i>");
                      jQuery('.event-title').html(event.title);
                      jQuery('.event-body').html(event.description);
                      jQuery('.eventUrl').attr('href',event.url);
                      jQuery('#modal-view-event').modal();
              },
          })
      });
    
  })(jQuery);

