$(function(){
 $('.input-box-btn').on('click',function() {
  let isEmpty = false;
  jQuery('.input-box-date,.input-box-where,.input-box-responder,.report-text').each(function(){
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
});