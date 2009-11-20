require("spec_helper.js");
require("../../public/javascripts/rogue/page.chain.js");

Screw.Unit(function(){
  describe("Page.chain", function(){
    before(function () {
      $('#notes-form-2').css('display', 'none');
      $('.show-form:first').html('edit notes');
    });

    it("hides the notes form on load", function(){
      expect($('#notes-form-2').css('display')).to(equal, "none");
    });

    it("shows the notes form on link click", function(){
      toggle_edit_link($('.show-form:first'));
      expect($('#notes-form-2').css('display')).to_not(equal, "none");
      expect($('.show-form:first').html()).to(equal, "hide form");
    });

    it("hides the notes form on second link click", function(){
      toggle_edit_link($('.show-form:first'));
      expect($('#notes-form-2').css('display')).to_not(equal, "none");
      expect($('.show-form:first').html()).to(equal, "hide form");

      toggle_edit_link($('.show-form:first'));
      expect($('#notes-form-2').css('display')).to(equal, "none");
      expect($('.show-form:first').html()).to(equal, "edit notes");
    });
  });
});
