// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


// navigation
$(window).resize(function() {
  var more = document.getElementById("js-navigation-more");
  if (more) {
	  var windowWidth = $(window).width();
	  var moreLeftSideToPageLeftSide = $(more).offset().left;
	  var moreLeftSideToPageRightSide = windowWidth - moreLeftSideToPageLeftSide;

	  if (moreLeftSideToPageRightSide < 330) {
	    $("#js-navigation-more .submenu .submenu").removeClass("fly-out-right");
	    $("#js-navigation-more .submenu .submenu").addClass("fly-out-left");
	  }

	  if (moreLeftSideToPageRightSide > 330) {
	    $("#js-navigation-more .submenu .submenu").removeClass("fly-out-left");
	    $("#js-navigation-more .submenu .submenu").addClass("fly-out-right");
	  }
	}
});

$(document).ready(function() {
  var menuToggle = $("#js-mobile-menu").unbind();
  $("#js-navigation-menu").removeClass("show");

  menuToggle.on("click", function(e) {
    e.preventDefault();
    $("#js-navigation-menu").slideToggle(function(){
      if($("#js-navigation-menu").is(":hidden")) {
        $("#js-navigation-menu").removeAttr("style");
      }
    });
  });
}); 
