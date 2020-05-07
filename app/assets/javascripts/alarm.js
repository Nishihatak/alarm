$(function() {
  var check = '.content__inner__time__alarm__input'; 
  var html =  `<div class="content__inner__alarmstop">
                 <a href="/alarms/new">アラームを止める
                 </a>
              </div>`

  $('check').change(function(){
 
    if ($(this).prop('checked')) {

      //   チェックが入ったら
        $('.content__inner__alarmstop').add();
      //   passwordをテキストに変換
    } else {
      $('.content__inner__alarmstop').removeCladd();
      //   チェックが入っていないときはパスワードのまま
      }
  });
});
