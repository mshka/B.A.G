$(document).ready(function(){
    var disabled_button = false;

    if ( $('#restaurant_opening_days_hours').val() != "" ){
      valuedata =  $('#restaurant_opening_days_hours').val();
      valuedata = JSON.parse(valuedata);
      $.each(valuedata, function(key){
            button = "#" + key
            opening_hour = "#" + key + "_opening_hour"
            closing_hour = "#" + key + "_closing_hour"
            program = "#" + key + "_program"
            if (valuedata[key]["open"] == "true"){
              $(button).prop('disabled', false);
              $(opening_hour).prop('disabled', false);
              $(closing_hour).prop('disabled', false);
              $(program).prop('disabled', false);

              $(button).removeClass();
              $(button).addClass('btn btn-default btn-primary');
              $(opening_hour).val(valuedata[key]["opening_hour"])
              $(closing_hour).val(valuedata[key]["closing_hour"])
              $(program).val(valuedata[key]["program"])
            }

      });

    }





    $('#new_restaurant_sign_up').hide();

    if($("#main-category").find(":selected").text() != "Other"){
      $("#type_category").val($("#main-category").find(":selected").text()).hide();
    }

    $("#main-category").on("change",function(){
      if($(this).find(":selected").text() == "Other"){
        $("#type_category").val("").slideDown();
      }else{
        $("#type_category").val($(this).find(":selected").text()).slideUp();
      }
    });



      function formatHourData(){
        jsonData =  {  "monday": {},
                      "tuesday": {},
                      "wednesday": {},
                      "thursday": {},
                      "friday": {},
                      "saturday": {},
                      "sunday" :{},
                    };

        $.each(jsonData, function(key){
          if ($('#'+key).hasClass('btn-primary')){
            opening_hour = "#" + $('#'+key).attr('id') + "_opening_hour"
            closing_hour = "#" + $('#'+key).attr('id') + "_closing_hour"
            program = "#" + $('#'+key).attr('id') + "_program"
            jsonData[key]["open"] ="true"
            jsonData[key]["opening_hour"] = $(opening_hour).val()
            jsonData[key]["closing_hour"] = $(closing_hour).val()
            jsonData[key]["program"] = $(program).val()

          }
          else{
            jsonData[key]["open"] ="false"
          }
        });

        $('#restaurant_opening_days_hours').val(JSON.stringify(jsonData));
      }

      $('#dayBtnsWrapper a').on("click", function(){
        if (disabled_button == false){
          $(this).toggleClass("btn-primary");
          if ($(this).attr('class')=== "btn btn-default btn-primary"){
            string = "#" + $(this).attr('id') + "_opening_hour"
            $(string).prop('disabled', false);
            string = "#" + $(this).attr('id') + "_closing_hour"
            $(string).prop('disabled', false);
            string = "#" + $(this).attr('id') + "_program"
            $(string).prop('disabled', false);
          }
          else
          {
            string = "#" + $(this).attr('id') + "_opening_hour"
            $(string).prop('disabled', true);
            string = "#" + $(this).attr('id') + "_closing_hour"
            $(string).prop('disabled', true);
            string = "#" + $(this).attr('id') + "_program"
            $(string).prop('disabled', true);
          }
        }
      });

      $('#new_restaurant').on("submit", function(event){
        $('#new_restaurant_sign_up').show();

        $('#new_restaurant_sign_up').slideDown();
        event.preventDefault();
        formatHourData();
        $(this).unbind('submit').submit();
      });

      $('#edit_restaurant_1').on("submit", function(event){
        $('#new_restaurant_sign_up').show();

        $('#new_restaurant_sign_up').slideDown();
        event.preventDefault();
        formatHourData();
        $(this).unbind('submit').submit();
      });

      $('#openallthetimecheck').on("click", function(){
        $(this).toggleClass("btn-primary");
        keys =  {  "monday": {},
                      "tuesday": {},
                      "wednesday": {},
                      "thursday": {},
                      "friday": {},
                      "saturday": {},
                      "sunday" :{},
                    };
        if ($(this).attr('class')=== "btn btn-default btn-primary"){
          $.each(keys, function(key){
            $('#'+key).removeClass();
            $('#'+key).addClass('btn btn-primary');
            disabled_button = true
            string = "#" + key + "_opening_hour"
            $(string).val('06:00')
            $(string).prop('disabled', true);
            string = "#" + key + "_closing_hour"
            $(string).val("05:59")
            $(string).prop('disabled', true);
            string = "#" + key + "_program"
            $(string).prop('disabled', false);
          });
        }else{
          $.each(keys, function(key){
            $('#'+key).removeClass();
            $('#'+key).addClass('btn btn-default');
            disabled_button = false
            string = "#" + key + "_opening_hour"
            $(string).val("")
            $(string).prop('disabled', true);
            string = "#" + key + "_closing_hour"
            $(string).val("")
            $(string).prop('disabled', true);
            string = "#" + key + "_program"
            $(string).prop('disabled', true);
          });
        }
      });


    });


