$(document).on("turbolinks:load", function () {
  $("#add-new-group").hide();
  $("#add-group-btn").click(function () {
    $("#add-new-group").slideToggle(function () {
      $("#new_group").focus();
    });
    return false;
  });

  $("#save-group-btn").click(function (event) {
    event.preventDefault();

    $.ajax({
      url: "/groups",
      method: "post",
      data: {
        group: { name: $("#new_group").val() },
      },
      success: function (response) {
        console.log(response);
      },
      error: function (xhr) {
        console.log(xhr);
      },
    });
  });
});
