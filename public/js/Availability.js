function Availability(datesString) {
  this.datesString = datesString;
};

Availability.datesToArray = function(datesString) {
  return datesString.split(' ');
};

Availability.dateConversion = function(date) {
  date = new Date(Date.UTC(date.getFullYear(), date.getMonth(), date.getDate()));
  return date.toISOString().substring(0, 10);
};

Availability.prototype.dateAvailable = function(date) {
  var dateString = Availability.dateConversion(date);
  var datesArray = Availability.datesToArray(this.datesString);
  return [!datesArray.includes(dateString)];
};
