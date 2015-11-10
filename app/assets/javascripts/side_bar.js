$(document).ready(function(){
  $("#menu-toggle").find("img").attr("src", "/assets/toggle_button_back.png");
  $("#menu-toggle").click(function(e) {
    $("#wrapper").toggleClass("toggled");
    if ($(this).find('img').attr('src') == "/assets/toggle_button.png"){
      $(this).find("img").attr("src", "/assets/toggle_button_back.png");
    }else{
      $(this).find("img").attr("src", "/assets/toggle_button.png");

    }
  });
});
