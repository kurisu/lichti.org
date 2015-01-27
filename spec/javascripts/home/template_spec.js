describe("Modifications to the original Worthy template.js", function() {

    describe("$.fn.oneTimeLinkInit()", function() {
        beforeEach(function() {
            loadFixtures("home/one-time-link.html");
            $("#one-time-link").oneTimeLinkInit();
        });

        describe("when clicking an anchor with class .one-time-link", function() {
           it("should hide the clicked anchor and no other anchors, with or without .one-time-link", function() {
               var hide = spyOn($.fn, 'hide');
               $('#one-time-anchor1').click();
               expect(hide).toHaveBeenCalled();
               expect(hide.calls.mostRecent().object.attr('id')).toEqual('one-time-anchor1');
               expect(hide.calls.count()).toEqual(1);
           });
        });
    });
});
