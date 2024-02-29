import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application } // abre a interface do admin


//= require jquery
//= require jquery3
//= require jquery_ujs
//= require popper
//= require 'apexcharts'
//= require bootstrap
//= require_tree .

import Swal from 'sweetalert2';
window.Swal = Swal;

$(document).ready('turbolinks:load', function() {
    //Logica
    $('.alert').click('turbolinks:load', function() {
      Swal.fire("funcionando!");
  });
});

$(document).ready('turbolinks:load', function() {
  $('.delete-post').click('turbolinks:load', function() {
    
});
  });

$(document).ready('turbolinks:load', function(){
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
 
    $(".exibir_menu").click('turbolinks:load', function() {
       $(".navbar_mobile").toggle(500);
    });
 
    $(".edit_form").click('turbolinks:load', function() {
       $(".editar_atividade").show(800);
       $(".edit_form").hide();
    });
 });
 
 $(document).ready('turbolinks:load', function(){
 $('#tipo').hide();
   $('#grupo').change('turbolinks:load', function(){
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
 
 $(document).ready('turbolinks:load', function() {
   $('.info_concedente').mouseover(function() {
     $('.rotate_info').show(400);
     $('.div_concedente').show(400);
   });
 
   $('.info_concedente').mouseleave('turbolinks:load', function() {
     $('.rotate_info').hide(200);
     $('.div_concedente').hide(200);
   });
 });

 $(document).ready('turbolinks:load', function() {
   $('.clausulas').hide();
   $('.conteudo').show();
 
   $('.confirmacao_preenchimento').slideDown(300);
   $('.clausulas_conteudo').slideDown(300);
   $('.clausulas_conteudo').css("background-color", "rgba(10,10,10,0.6)");
 
   $('.confirma_preenchimento').click('turbolinks:load', function() {
     $('.confirmacao_preenchimento').slideUp(300);
     $('.clausulas_conteudo').slideUp(300);
   });
 
   $('.avancar').click('turbolinks:load', function() {
     $('.clausulas').show(800);
     $('.clausulas_conteudo').show(800);
     $('.clausulas_conteudo').css("background-color", "rgba(10,10,10,0.6)");
   });
 
   $('.cancelar').click('turbolinks:load', function() {
     $('.clausulas').hide(800);
     $('.clausulas_conteudo').hide(800);
   });
 
   $('.btn1').mouseover('turbolinks:load', function() {
       $('.div_federal').slideDown();
   });
 
   $('.div_federal').mouseleave('turbolinks:load', function() {
       $('.div_federal').slideUp();
   });
 
   $('.btn2').mouseover('turbolinks:load', function() {
       $('.div_federal2').slideDown();
   });
 
   $('.div_federal2').mouseleave('turbolinks:load', function() {
       $('.div_federal2').slideUp();
   });
 
   $('.desaparece_botao').click('turbolinks:load', function() {
     $('.desaparece_botao').hide(700);
   });
 });
 