$(function(){
  var search_list = $(".result")

  function buildHTML(company) {
    var html = `<table class = copmany-box>
                 <tr>
                  <th width="150"> 会社名: </th>
                  <th width="150"> ${company.name}</th> 
                 </tr> 
                 <tr>
                  <th width="80"> 住所: </th>
                  <th width="150"> ${company.postcode}</th> 
                 </tr> 
                 <tr>
                 <th width="80"> 電話番号: </th>
                 <th width="150"> ${company.phone_number}</th> 
                </tr> 
                <tr>
                 <th width="80"> 資本金: </th>
                 <th width="150"> ${company.capital}</th> 
                </tr> 
                <tr>
                 <th width="80"> 売上高: </th>
                 <th width="150"> ${company.sale}</th> 
                </tr> 
                <tr>
                <th width="80"> 事業内容: </th>
                <th width="150"> ${company.description}</th> 
               </tr> 
               <tr>
                <th width="80"> 特徴: </th>
                <th width="150"> ${company.characteristic}</th> 
               </tr> 
               <tr>
                <th width="80"> URL: </th>
                <th width="150"> ${company.url}</th> 
               </tr> 
                </table> `
   search_list.append(html);
  }
  function appendErrMsgToHTML(msg) {
    var html = `<div class='.result-a'>${ msg }</div>`
    
   search_list.append(html);
  }

  $("#searching-form").on("keyup", function() {
    var input = $("#searching-form").val();
    $.ajax({
      type: "GET",
      url: "/companies",
      data: { keyword: input },
      dataType: "json"
    })
      .done(function(data){
        search_list.empty(); 
        if (data.length !== 0) {
          data.forEach(function(data){
            buildHTML(data);
          });
        } else if (input.length == 0) {
          return false;
        } else {
          appendErrMsgToHTML("一致する訪問先がありません");
        }
      })
     
   });
})