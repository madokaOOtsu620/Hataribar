/*global $*/
$(function(){
  var count = $(".js-text").text().replace(/\n/g, "改行").length;
  var now_count = 200 - count;
  if (count > 200){
    $(".js-text-count").css("color","orange")
  }

  $(".js-text-count").text("残り" + now_count + "文字");

  $(".js-text").on("keyup", function(){
    var count = $(this).val().replace(/\n/g, "改行").length;
    var now_count = 200 - count;

    if (count > 200){
      $(".js-text-count").css("color", "orange");
    } else{
      $(".js-text-count").css("color", "black");
    }
    $(".js-text-count").text("残り" + now_count + "文字");
  });
});