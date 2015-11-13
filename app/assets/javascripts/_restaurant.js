$(document).ready(function(){


//   setInterval(function(){
//     if ($('#review_content').val() != "" && $('#review_rating').val() != ""){
//       $('#review_submit').prop('disabled', false);
//     }
//     else
//     {
//       $('#review_submit').prop('disabled', true);
//     }
// }, 1000);


  $('.rating_button').on('click', function(){
    $('#review_submit').prop('disabled', false);

    star_nbr = parseInt($(this).attr('value'));
    $('#review_rating').val(star_nbr)

    for (var i = 1; i <= star_nbr; i++) {
      nbr = i.toString()
      string = '#star-' + nbr;
      $(string).html('✭');
      $(string).css('color', 'gold');
    }

    for (var i = (star_nbr + 1); i <= 5; i++) {
      nbr = i.toString()
      string = '#star-' + nbr;
      $(string).html('☆');
      $(string).css('color', '');
    }



  });

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
