// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "@hotwired/turbo-rails"
import "controllers"

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery3
//= require jquery_ujs
//= require popper
//= require 'apexcharts'
//= require bootstrap
//= require_tree .


$(document).ready(function(){
   var tam = $(window).width();

   if (tam >= 1024){
     $("nav").show();
     $(".exibir_menu").hide();
     $(".navbar_mobile").hide();
   }else{
     $(".exibir_menu").show();
     $("nav").hide();
     $("nav").css("position", "fixed");
   }

   $(".exibir_menu").click(function() {
      $(".navbar_mobile").toggle(500);
   });

   $(".edit_form").click(function() {
      $(".editar_atividade").show(800);
      $(".edit_form").hide();
   });
});

$(document).ready(function(){
$('#tipo').hide();
  $('#grupo').change(function(){
    ValidaTipo();
  });
  ValidaTipo();
});

function ValidaTipo() {
    if($('#grupo').val() == 0 || $('#grupo').val() == 10) {
      $('#tipo').show();
    } else {
      $('#tipo').hide();
    }
}

$(document).ready(function() {
  $('.info_concedente').mouseover(function() {
    $('.rotate_info').show(400);
    $('.div_concedente').show(400);
  });

  $('.info_concedente').mouseleave(function() {
    $('.rotate_info').hide(200);
    $('.div_concedente').hide(200);
  });
});

$(document).ready(function() {
  $('.clausulas').hide();
  $('.conteudo').show();

  $('.confirmacao_preenchimento').slideDown(300);
  $('.clausulas_conteudo').slideDown(300);
  $('.clausulas_conteudo').css("background-color", "rgba(10,10,10,0.6)");

  $('.confirma_preenchimento').click(function() {
    $('.confirmacao_preenchimento').slideUp(300);
    $('.clausulas_conteudo').slideUp(300);
  });

  $('.avancar').click(function() {
    $('.clausulas').show(800);
    $('.clausulas_conteudo').show(800);
    $('.clausulas_conteudo').css("background-color", "rgba(10,10,10,0.6)");
  });

  $('.cancelar').click(function() {
    $('.clausulas').hide(800);
    $('.clausulas_conteudo').hide(800);
  });

  $('.btn1').mouseover(function() {
      $('.div_federal').slideDown();
  });

  $('.div_federal').mouseleave(function() {
      $('.div_federal').slideUp();
  });

  $('.btn2').mouseover(function() {
      $('.div_federal2').slideDown();
  });

  $('.div_federal2').mouseleave(function() {
      $('.div_federal2').slideUp();
  });

  $('.desaparece_botao').click( function() {
    $('.desaparece_botao').hide(700);
  });
});
