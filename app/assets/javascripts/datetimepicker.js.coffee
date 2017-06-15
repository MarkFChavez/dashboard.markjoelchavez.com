$(document).on "ready page:load", (e) ->
  default_options =
    useStrict:  true
    useCurrent: false
    format:     FORMAT

  # Initialize dt pickers
  $(".dtpicker-start").datetimepicker(default_options)
  $(".dtpicker-end").datetimepicker(default_options)

  # Link pickers
  # The end date should be greater than the start date and this is how
  # we do it.
  $(".dtpicker-start").on "dp.change", (e) ->
    $(".dtpicker-end").data("DateTimePicker").minDate(e.date)

  $(".dtpicker-end").on "dp.change", (e) ->
    $(".dtpicker-start").data("DateTimePicker").maxDate(e.date)
  
