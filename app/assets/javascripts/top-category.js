$(function() {
  $(document).on('turbolinks:load', function() { });
  $(".header__box__navi__left__category").hover(function() {
  $("ul.category1").toggle();
  });
  $(".header__box__navi__left__category li ul").hide();
  $(".header__box__navi__left__category li").hover(function() {
      $(">ul:not(:animated)", this).stop(true, true).show("fast");
      $(">a", this).addClass("active");
  }, function() {
      $(">ul:not(:animated)", this).stop(true, true).hide("fast");
      $(">a", this).removeClass("active");
});
});