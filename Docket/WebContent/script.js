jQuery(document).ready(function () {
  jQuery(".datetimepicker").datepicker({
    timepicker: true,
    language: "en",
    range: true,
    multipleDates: true,
    multipleDatesSeparator: " - ",
  });
  jQuery("#add-event").submit(function () {
    alert("Submitted");

    var values = {};
    $.each($("#add-event").serializeArray(), function (i, field) {
      values[field.name] = field.value;
    });
    console.log(values);
  });
});

(function () {
  "use strict"; 
  jQuery(function () {
    
    axios.get("http://localhost:3000/getall").then(results=>{
      console.log("Events: ",results);

      jQuery("#calendar").fullCalendar({
        themeSystem: "bootstrap4",
        businessHours: false,
        defaultView: "month",
        editable: true,
        header: {
          left: "title",
          center: "month,agendaWeek,agendaDay",
          right: "today prev,next",
        },
        events: results.data,
        eventRender: function (event, element) {
          if (event.icon) {
            element
              .find(".fc-title")
              .prepend("<i class='fa fa-" + event.icon + "'></i>");
          }
        },
        dayClick: function () {
          jQuery("#modal-view-event-add").modal();
        },
        eventClick: function (event, jsEvent, view) {
          jQuery(".event-icon").html("<i class='fa fa-" + event.icon + "'></i>");
          jQuery(".event-title").html(event.title);
          jQuery(".event-body").html(event.description);
          jQuery(".eventUrl").attr("href", event.url);
          jQuery("#modal-view-event").modal();
        },
      });
    }).catch(err=>console.error);
    
  });
})(jQuery);
