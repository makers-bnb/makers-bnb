$(document).ready(function() {
  var datesString = $("#request_date_picker").attr("data-booked-dates")
  var availability = new Availability(datesString);
  var availability_bound = availability.dateAvailable.bind(availability)

  $('#request_date_picker')
  $('#request_date_picker').datepicker({
    minDate: new Date(2019, 0, 1),
    maxDate: new Date(2019, 5, 31),
    dateFormat: 'yy-mm-dd',
    constrainInput: true,
    beforeShowDay: availability_bound
  });
});
