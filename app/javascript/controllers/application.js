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
  var tam = $(window).width();

  if (tam >= 1024){
    $("nav").show();
    $(".exibir_menu").hide();
    $(".navbar_mobile").hide();
  } else {
    $(".exibir_menu").show();
    $(".navbar_mobile").hide();  // Garante que a barra de navegação móvel não seja exibida na inicialização
    $("nav").css("position", "fixed");
  }

  $(document).on('click', '.exibir_menu', function() {
     $(".navbar_mobile").toggle(500);
  });

  $(document).on('click', '.edit_form', function() {
     $(".editar_atividade").show(800);
     $(".edit_form").hide();
  });
});

jQuery(function() { 
  $('#tipo').hide();
  $(document).on('change', '#grupo', function(){
      ValidaTipo();
  });
  ValidaTipo();
});

function ValidaTipo() {
  if ($('#grupo').val() == 0 || $('#grupo').val() == 10) {
      $('#tipo').show();
  } else {
      $('#tipo').hide();
  }
}

jQuery(function() { 
  $(document).on('mouseover', '.info_concedente', function() {
      $('.rotate_info').show(400);
      $('.div_concedente').show(400);
  });

  $(document).on('mouseleave', '.info_concedente', function() {
      $('.rotate_info').hide(200);
      $('.div_concedente').hide(200);
  });
});

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



 