//= require jquery3
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

$(function () {
  $(document).scroll(function () {
    var $nav = $(".fixed-top");
    $nav.toggleClass("scrolled", $(this).scrollTop() > $nav.height());
  });
});
