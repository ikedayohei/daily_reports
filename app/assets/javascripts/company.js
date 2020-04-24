$(function() {
  $(".up").click(function () {
      $('html,body').animate({ scrollTop: 0 }, 'fast');
      return false;
  });
  $('.company-input-box-btn').on('click',function() {
    let isEmpty = false;
    jQuery('.input-box-name,.input-box-postcode,.input-box-phone_numberr,.input-box-capital.sale-text.description-text').each(function(){
     if(jQuery(this).val() === ''){
      alert("必要な項目が入力されていません。");
      $(this).focus();
      isEmpty = true;
      return false;
      } 
    });
    if(isEmpty)
        return false;
    else
        alert('送信完了！');
   });
})
