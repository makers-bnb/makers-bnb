describe("Availability", function() {
  var player;
  var song;

  beforeEach(function() {
    availability = new Availability('2019-04-21 2019-03-01');
  });

  describe('dates to array', function() {
    it("should convert a strig of dates to an array", function() {
      var dates = Availability.datesToArray('2019-04-21 2019-03-01');
      expect(dates).toEqual(['2019-04-21', '2019-03-01']);
    });
  });

  describe('convert string to a formatted date', function () {
    it("should convert a date object to a string", function () {
      var date = new Date('Wed Apr 10 2019 06:00:00 GMT+0100');
      expect(Availability.dateConversion(date)).toEqual('2019-04-10');
    });
  });

  describe('date to array', function () {
    it("should return true if date is not array", function () {
      var date = new Date('Wed Apr 10 2019 06:00:00 GMT+0100');
      expect(availability.dateAvailable(date)).toEqual(true);
    });
    it("should return false if date is in array", function () {
      var date = new Date('Wed Apr 21 2019 06:00:00 GMT+0100');
      expect(availability.dateAvailable(date)).toEqual(false);
    });
  });
});
