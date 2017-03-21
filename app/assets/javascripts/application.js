// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

$(function(){ $(document).foundation(); });

if (Modernizr.testAllProps('gridRowGap') === false) {
  $('body').append("<div class='no-grid-warning'>Your browser does not support CSS-Grid - this demo requires CSS-grid to function properly</div>");
}

$('.expandable [data-toggle]').on('click', function(e) {
  e.preventDefault();
  $('.expandable').toggleClass('expanded')
  if($('.expandable').hasClass('expanded')) {
    $(this).text('Shrink Me');
  } else {
    $(this).text('Expand Me');
  }
  setTimeout(function() {
    window.containerQueries.reevaluate(false);
  }, 1);
});
