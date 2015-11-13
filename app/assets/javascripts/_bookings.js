$(document).ready(function(){


  $('.restauran-comment').on('change',function(){

    id_acc = "#" + $(this).attr('id') + "-accept";
    id_reject = "#" + $(this).attr('id') + "-reject";
    comment = $(this).val();
    id_number = parseInt($(this).attr('id'))
    new_acc_href = '/bookings/acc_booking/' + id_number +'/' + comment
    new_rej_href = '/bookings/reject_booking/' + id_number +'/' + comment
    $(id_acc).attr('href',new_acc_href);
    $(id_reject).attr('href',new_rej_href);

  });

});

