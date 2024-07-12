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


jQuery(function() { 
  $('.clausulas').hide();
  $('.conteudo').show();

  $('.confirmacao_preenchimento').slideDown(300);
  $('.clausulas_conteudo').slideDown(300);
  $('.clausulas_conteudo').css("background-color", "rgba(10,10,10,0.6)");

  $(document).on('click', '.confirma_preenchimento', function() {
      $('.confirmacao_preenchimento').slideUp(300);
      $('.clausulas_conteudo').slideUp(300);
  });
  
  $(document).on('click', '.avancar', function() {
      $('.clausulas').show(800);
      $('.clausulas_conteudo').show(800);
      $('.clausulas_conteudo').css("background-color", "rgba(10,10,10,0.6)");
  });

  $(document).on('click', '.cancelar', function() {
      $('.clausulas').hide(800);
      $('.clausulas_conteudo').hide(800);
  });

  $(document).on('mouseover', '.btn1', function() {
      $('.div_federal').slideDown();
  });

  $(document).on('mouseleave', '.div_federal', function() {
      $('.div_federal').slideUp();
  });

  $(document).on('mouseover', '.btn2', function() {
      $('.div_federal2').slideDown();
  });

  $(document).on('mouseleave', '.div_federal2', function() {
      $('.div_federal2').slideUp();
  });

  $(document).on('click', '.desaparece_botao', function() {
      $('.desaparece_botao').hide(700);
  });
});



 