$(document).on "turbolinks:load", (e) ->
  options =
    aspectRatio: 2.2
    events: "/events.json"
    dayClick: (date, jsEvent, view) ->
      showCreateEventModal(date)
    eventClick: (calEvent, jsEvent, view) ->
      showUpdateEventModal(calEvent)
    header:
      left: 'prev, next, title'
      right: 'today, month, agendaWeek, agendaDay'
    displayEventTime: false
    eventLimit: true

  # Initialize fullcalendar
  $("#calendar").fullCalendar(options)

  # Initialize minicolors
  $(".minicolors").minicolors
    theme: "bootstrap"

  refetchEvents = ->
    $("#calendar").fullCalendar("refetchEvents")

  showUpdateEventModal = (event) ->
    # set URLs
    $("#update-event-modal form").attr("action", event.update_path)
    $("#update-event-modal #remove_event").attr("href", event.remove_path)

    $("#update-event-modal #event_title").val(event.title)
    $("#update-event-modal #event_start_time").val(moment(event.start).format(FORMAT))
    $("#update-event-modal #event_end_time").val(moment(event.end).format(FORMAT))
    $("#update-event-modal #event_color").val(event.color)
    $("#update-event-modal").modal("show")

  showCreateEventModal = (date) ->
    $("#create-event-modal").modal("show")

    # Reset shown modal
    $("#create-event-modal #event_title").val("")
    $("#create-event-modal #event_end_time").val("")
    $("#create-event-modal #event_color").val("")

    # Set start time and adjust end time to dates less than the start time to
    # prevent users from inputting a previous end time.
    startTime = date.format(FORMAT)
    $("#create-event-modal #event_start_time").val(startTime)
    $(".dtpicker-end").data("DateTimePicker").minDate(startTime)
    $(".dtpicker-end").data("DateTimePicker").defaultDate(startTime)

  $("#new_event").on "ajax:success", (e) ->
    $("#create-event-modal").modal("hide")
    refetchEvents()

  $("#update_event").on "ajax:success", (e, data) ->
    $("#update-event-modal").modal("hide")
    refetchEvents()

  $("#remove_event").on "ajax:success", (e, data) ->
    $("#update-event-modal").modal("hide")
    refetchEvents()

  # ERRORS
  $("#new_event, #update_event, #remove_event").on "ajax:error", (e) ->
    alert "Something went wrong"

