$(document).ready(function(){
  /* initialise handlebarsjs templates
  these reference the ids of <script> tags in the HTML file
   */
  $("#includedContent").load("html_subfile/html_output.html",function(){ 
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
});
