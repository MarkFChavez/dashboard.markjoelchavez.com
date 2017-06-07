$ ->
  options =
    events: "/events.json"
    eventLimit: 3
    dayClick: (date, jsEvent, view) ->
      formattedDate = date.format("DD/MM/YYYY")

      # open modal and set start time
      $("#create-event-modal").modal("show")
      $("#create-event-modal #event_start_time").val(formattedDate)
    header:
      left: 'prev, next'
      center: "title"
      right: 'month'

  $("#calendar").fullCalendar(options)

  $("#new_event").on "ajax:success", (e) ->
    $("#calendar").fullCalendar("refetchEvents")
