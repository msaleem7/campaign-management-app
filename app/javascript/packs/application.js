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

// require("./show")

// $(document).on('page:fetch', function() {
//     $(".loading-indicator").show();
//   });
//   $(document).on('page:change', function() {
//     $(".loading-indicator").hide();
//   });

//   $((function() {
//     $('[data-js-hide-link]').on("click",function(event){
//       alert('You clicked the Hide link');
//     });
//     $('#clickme').on("click",function(){
//         $("#para").html("<p>yes, i'm pumped</p>")
//         $('ul').empty()
//         $('ul').append("<p>yes, i'm pumped</p>")

//     })  
    
//     document.onload(function hide() {
//         document.getElementById("clickme").onclick(function (params) {
//             document.getElementById("para").html("<p>yes, i'm pumped</p>")
//             alert('You clicked the Hide link');
//         })
//     })


//   }))
$(document).ready(function(){
    $("#input_profession").hide();
    $("#input_service").hide();
    $("#label_profession").hide();
    $("#label_service").hide();
   
    // $("#show").click(function(){
    //   $("p").show();
    //   $("#input_profession").show();
    //   $("#input_service").show();

      
    // });

    

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