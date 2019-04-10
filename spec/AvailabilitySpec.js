describe("Availability", function() {
  var player;
  var song;

  beforeEach(function() {
    availability = new Availability();
  });

  describe('dates to array', function() {
    it("should convert a strig of dates to an array", function() {
      var dates = availability.datesToArray('2019-04-21 2019-03-01');
      expect(dates).toEqual(['2019-04-21', '2019-03-01']);
    });
  });
});
