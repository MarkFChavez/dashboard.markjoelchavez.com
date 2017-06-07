$ ->
  options =
    events: "/events.json"
    eventLimit: 3
    dayClick: (date, jsEvent, view) ->
      showCreateEventModal(date)
    header:
      left: 'prev, next'
      center: "title"
      right: 'month'

  $("#calendar").fullCalendar(options)

  showCreateEventModal = (date) ->
    $("#create-event-modal").modal("show")
    $("#create-event-modal #event_title").val("")
    $("#create-event-modal #event_start_time").val(date)
    $("#create-event-modal #event_end_time").val("")

  $("#new_event").on "ajax:success", (e) ->
    $("#create-event-modal").modal("hide")
    $("#calendar").fullCalendar("refetchEvents")

  $("#new_event").on "ajax:error", (e) ->
    alert "Something went wrong"
