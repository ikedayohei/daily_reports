$(function(){
  function buildHTML(comment){
    var html =` <table class = comment-box>
                 <tr>
                  <th>投稿者:<th>
                  <th>${comment.user_name}<th>
                  <th>::${comment.content}<th>
                 <tr>
                <table> `
    return html
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault()
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments').append(html);
      $('.comments').animate({ scrollTop: $('.comments')[0].scrollHeight});
      $('.com-text').val('');
      $('.com-input-box-btn').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
    });
  });