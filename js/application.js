$(document).ready(function(){
    $('.marginalia').click(function(){
      $('[data-glossed-by="marginalia"],.marginalia').removeClass('active');
      if (!$(this).hasClass('active')){
      $(this).add('[data-glossed-by="marginalia"][data-marginalia-id="'+$(this).data('marginalia-id')+'"]').addClass('active');
      }
    });
    $('[data-glossed-by="marginalia"]').click(function(){
      $('[data-glossed-by="marginalia"],.marginalia').removeClass('active');
      if (!$(this).hasClass('active')){
      $(this).add('.marginalia[data-marginalia-id="'+$(this).data('marginalia-id')+'"]').addClass('active');
      }
    });
  $('button#toggle-all-interlinear').click(function(){
    if ($(this).data('action') === 'show'){
      $('.glossed').popover('show');
      $(this).data('action','hide');
    } else {
      $('.glossed').popover('hide');
      $(this).data('action','show');
    }
  });
  $('button[data-action="zoom-image"]').click(function(){
    var scale = $('.ms-image[data-scale]').data('scale') || 0;
    switch ($(this).data('direction')){
      case 'in':
        scale *= 1.8;
        break;
      case 'out':
        scale *= 0.5;
        break;
    }
    console.log(scale);
    $('.ms-image').data('scale',scale);
    $('.ms-image').css('transform','scale('+scale+')');
  });
  $('.ms-image').on('dragstart',function(e){
    console.log(e.pageX,e.pageY);
  });
  $('#transcription br').replaceWith(' | ');
  $('[data-toggle="popover"]').popover({trigger:'click'});

  
  $('#welcome-splash').modal('show');
  $('.note').each(function(i){
    var note = {
      author: $(this).data('author'),
      type: $(this).data('note-type'),
      content: $(this).html(),
      id: i,
    };
    var noteMarker = $('<span class="note-marker" data-note-id="'+i+'"></span>').text('*').on('click',function(){
      $('.sidebar-note,.note-marker').removeClass('bg-light border border-secondary text-danger');
      $(this).addClass('text-danger');
      $('.sidebar-note[data-note-id="'+i+'"').addClass('bg-light border border-secondary');
    });
    $(this).replaceWith(noteMarker);
  });
  $('#sidebar').on('click','.sidebar-note',function(){
    $('.sidebar-note,.note-marker').removeClass('bg-light border border-secondary text-danger');
    $(this).addClass('bg-light border border-secondary');
    $('.note-marker[data-note-id="'+$(this).data('note-id')+'"').addClass('text-danger');
  });
});


  $('.tile')
    // tile mouse actions (from https://codepen.io/ccrch/pen/yyaraz)
    .on('mouseover', function(){
      $(this).children('.photo').css({'transform': 'scale('+ $(this).attr('data-scale') +')'});
    })
    .on('mouseout', function(){
      $(this).children('.photo').css({'transform': 'scale(1)'});
    })
    
    .on('mousemove', function(e){
      $(this).children('.photo').css({'transform-origin': ((e.pageX - $(this).offset().left) / $(this).width()) * 100 + '% ' + ((e.pageY - $(this).offset().top) / $(this).height()) * 100 +'%'});
    })
    .click(function(e){
        $(this).children('.photo').css({'transform-origin': ((e.pageX))+ ((e.pageY))});
    })/*Trouver une manière de bloquer l'image en cliquant.*/
    
    
    
    // tiles set up
    .each(function(){
      $(this)
        // add a photo container
        .append('<div class="photo"></div>')
        // some text just to show zoom level on current item in this example
        /*.append('<div class="txt"><div class="x">'+ $(this).attr('data-scale') +'x</div>ZOOM ON<br>HOVER</div>')*/
        // set up a background image for each tile based on data-image attribute
        .children('.photo').css({'background-image': 'url('+ $(this).attr('data-image') +')'});
    })
