import "@hotwired/turbo-rails"
import "controllers"
import 'datatables/datatables'
import "use_jquery"
import "bootstrap"



var signInSubmit = function() {
    debugger
    $(document).on('click', '.sign-in-submit', function(){
        debugger
        console.log("rohan was here")
    })
  }


$(document).on("turbolinks:load", signInSubmit);
