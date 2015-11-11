$(document).ready(function(){

  $('#image_div').hide();

  $('.picture_link').click(function(e) {
    // $(this).src = "hackanm.gif"
    link_part = $(this).find("img").attr('src')
    link_part = link_part.split('link')
    link_part = link_part.join('default')
    console.log(link_part)
    $('#shown_img').attr("src", link_part)
    $('#imageshow').show()
    $('#image_div').show()

  });


  $('#imageshow').click(function(e) {
    $(this).hide();
    $('#image_div').hide()
  });

  $('#opening_hours_show').on('click',function(){

    if ($('#opening_hours_arrow').attr('class') == "fa fa-angle-down"){
      $('#opening_hours_arrow').removeClass();
      $('#opening_hours_arrow').addClass('fa fa-angle-up');
      $('#operation_hour').slideDown();
    }
    else{
      $('#opening_hours_arrow').removeClass();
      $('#opening_hours_arrow').addClass('fa fa-angle-down');
      $('#operation_hour').slideUp()
    }


  });
});
