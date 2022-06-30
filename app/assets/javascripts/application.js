//= require jquery3
//= require rails-ujs
//= require jquery-ui/core
//= require jquery-ui/widget
//= require jquery-ui/position
//= require jquery-ui/widgets/autocomplete
//= require jquery-ui/widgets/menu
//= require activestorage
//= require turbolinks
//= require_tree .

$(document).on("turbolinks:load", function () {
  $(function () {
    $(document).scroll(function () {
      var $nav = $(".fixed-top");
      $nav.toggleClass("scrolled", $(this).scrollTop() > $nav.height());
    });
  });

  // Autocomplete
  $(function () {
    // Form id is term
    $("#term").autocomplete({
      source: "/contacts/autocomplete",
      minLength: 3,
      select: function (event, ui) {
        $("#term").val(ui.item.value);
        // Click on autocomplete to select the matching suggestion
        $(this).closest("form").submit();
      },
    });
  });
});
