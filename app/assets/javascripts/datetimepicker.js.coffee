$ ->
  $(".dtpicker-start").datetimepicker
    useStrict: true
    format: FORMAT

  $(".dtpicker-end").datetimepicker
    useStrict: true
    useCurrent: false
    format: FORMAT

  $(".dtpicker-start").on "dp.change", (e) ->
    $(".dtpicker-end").data("DateTimePicker").minDate(e.date)

  $(".dtpicker-end").on "dp.change", (e) ->
    $(".dtpicker-start").data("DateTimePicker").maxDate(e.date)
  
