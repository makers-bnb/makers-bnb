$(document).ready(function() {
  var bookedDatesString = $("#request_date_picker").attr("data-booked-dates")
  var availabilityStart = $("#request_date_picker").attr("data-availability-start")
  var availabilityEnd = $("#request_date_picker").attr("data-availability-end")
  var availability = new Availability(bookedDatesString);
  var availability_bound = availability.dateAvailable.bind(availability)


  $('#request_date_picker').datepicker({
    minDate: new Date(availabilityStart),
    maxDate: new Date(availabilityEnd),
    dateFormat: 'yy-mm-dd',
    constrainInput: true,
    beforeShowDay: availability_bound,
    showAnim: 'fade'
  });
});
