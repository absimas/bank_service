$(document).ready(function(){
  $("td").click(function() {
    window.location = $(this).data("href")
  });
});
