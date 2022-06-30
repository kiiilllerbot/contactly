//= require jquery3
//= require rails-ujs
//= require jquery-ui
//= require activestorage
//= require turbolinks
//= require_tree .

$(function () {
  $(document).scroll(function () {
    var $nav = $(".fixed-top");
    $nav.toggleClass("scrolled", $(this).scrollTop() > $nav.height());
  });

  // Hide the input form first
  $("#add-group-input").hide();

  // Toggle the input form by clicking
  $("#add-group-btn").click(function () {
    $("#add-group-input").toggle();
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
    },
  });
});
