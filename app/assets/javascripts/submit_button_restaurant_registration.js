$(document).ready(function(){
    var disabled_button = false
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
            jsonData[key]["opening_hour"] = $(closing_hour).val()
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
        event.preventDefault();
        formatHourData();
        $(this).unbind('submit').submit();
      });

      $('#openallthetimecheck').on("change", function(){
        keys =  {  "monday": {},
                      "tuesday": {},
                      "wednesday": {},
                      "thursday": {},
                      "friday": {},
                      "saturday": {},
                      "sunday" :{},
                    };
        if ($(this).prop('checked') == true){
          $.each(keys, function(key){
            $('#'+key).removeClass();
            $('#'+key).addClass('btn btn-primary');
            disabled_button = true
            string = "#" + key + "_opening_hour"
            $(string).val("6:00")
            $(string).prop('disabled', true);
            string = "#" + key + "_closing_hour"
            $(string).val("5:59")
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


