//= require jquery3
//= require rails-ujs
//= require jquery-ui/core
//= require jquery-ui/widget
//= require jquery-ui/position
//= require jquery-ui/widgets/autocomplete
//= require jquery-ui/widgets/menu
//= require activestorage
//= require turbolinks
//= require toastr
//= require_tree .

$(document).on("turbolinks:load", function () {
  $(function () {
    $(document).scroll(function () {
      var $nav = $(".fixed-top");
      $nav.toggleClass("scrolled", $(this).scrollTop() > $nav.height());
    });
  });

  // Fancy Alert
  setTimeout(function () {
    $("#notice-wrapper").fadeOut("fast", function () {
      $(this).remove();
    });
  }, 2500);

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

// Toastr Notification
toastr.options = {
  closeButton: false,
  debug: false,
  newestOnTop: false,
  progressBar: true,
  positionClass: "toast-bottom-right",
  preventDuplicates: false,
  onclick: null,
  showDuration: "300",
  hideDuration: "1000",
  timeOut: "2000",
  extendedTimeOut: "1000",
  showEasing: "swing",
  hideEasing: "linear",
  showMethod: "fadeIn",
  hideMethod: "fadeOut",
};
