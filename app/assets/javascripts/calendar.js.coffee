$ ->
  options =
    aspectRatio: 2.1
    events: "/events.json"
    dayClick: (date, jsEvent, view) ->
      showCreateEventModal(date)
    header:
      left: 'title'
      right: 'prev, next, today, month'
    displayEventTime: false

  # Initialize fullcalendar
  $("#calendar").fullCalendar(options)

  # Initialize minicolors
  $(".minicolors").minicolors
    theme: "bootstrap"

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

  refetchEvents = ->
    $("#calendar").fullCalendar("refetchEvents")

  $("#new_event").on "ajax:success", (e) ->
    $("#create-event-modal").modal("hide")
    refetchEvents()

  $("#new_event").on "ajax:error", (e) ->
    alert "Something went wrong"

