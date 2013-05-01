$(function() {
  $(window).resize(resizeLists);
})

function resizeLists() {
  $('html').width(0);
  $('.tweets').each(function(index, list){
    $(list).height($(window).height() - 85);
    $('html').width($('html').width() + 401);
  });
}