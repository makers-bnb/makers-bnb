$(document).ready(function() {
  var datesString = $("#request_date_picker").attr("data-booked-dates")
  var availability = new Availability(datesString);
  var availability_bound = availability.dateAvailable.bind(availability)

$('#display').datepicker({
    minDate: new Date(2019, 0, 1),
    maxDate: new Date(2019, 5, 31),
    dateFormat: 'DD, MM, d, yy',
    constrainInput: true,
    beforeShowDay: availability_bound
  });
});