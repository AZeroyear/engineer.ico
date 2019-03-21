$('form').submit(function(event) {
  event.preventDefault();
  var $form = $(this);
  var $button = $form.find('button');
  $.ajax({
    url: $form.attr('action'),
    type: $form.attr('method'),
    data: $form.serialize(),
    dataType: "text",
    timeout: 10000,
    beforeSend: function(xhr, settings) {
      $button.attr('disabled', true);
    },
    complete: function(xhr, textStatus) {
      $button.attr('disabled', false);
    },
    success: function(result, textStatus, xhr) {
      dataType: "json",
      $('#new').empty();
      $('#new').append(result);
      $("html,body").animate({scrollTop:$('#top').offset().top-100});
    },
    error: function(xhr, textStatus, error) {
      alert('NG...');
    }
  });
});

$(document).on('change', 'select', function(){
  var val = $('select option:selected').data('value');
  console.log(val)
  $('#result').empty();
  $('#result').append(val);
})
