// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("jquery")

//= require popper
//= require bootstrap
//= require_tree .
//= require_tree packs


$(function() {

  $("#input_profession").hide();
  $("#input_service").hide();
  $("#label_profession").hide();
  $("#label_service").hide();

  $('#radio_button_expert').on("click",function() {
    if($('#radio_button_expert').is(':checked')) 
    { 
      $("#input_profession").show();
    $("#input_service").show();
    $("#label_profession").show();
  $("#label_service").show();
    }                      
  });

  $('#radio_button_novice').on("click",function() {
    if($('#radio_button_novice').is(':checked')) 
    { 
      $("#input_profession").hide();
    $("#input_service").hide();
    $("#label_profession").hide();
  $("#label_service").hide();
    }                      
  });
 
});




  
  