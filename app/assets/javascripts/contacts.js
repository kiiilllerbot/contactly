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
      success: function (group) {
        if (group.id != null) {
          const newOption = $("<option/>")
            .attr("value", group.id)
            .attr("selected", true)
            .text(group.name);

          // Append the new group to the select tag
          $("#contact_group_id").append(newOption);

          // Clear out the New Group Form Input
          newGroup.val("");
        }
      },
      error: function (xhr) {
        console.log(xhr);
      },
    });
  });
});
