/*global $*/
/*global length*/
// $(function (){
//   $('#js-text', '#counter').on('keydown keyup keypress change', function(){
//     let countNum = String($(this).val(),length);
//     $('#counter').text(countNum + "文字");
//   });
// });

$(function(){
  $("#js-text1").on("keyup", function() {
  let countNum = String($(this).val().length);
  $("#counter1").text(countNum + "文字");
  });

  $("#js-text2").on("keyup", function() {
  let countNum = String($(this).val().length);
  $("#counter2").text(countNum + "文字");
  });

  $("#js-text3").on("keyup", function() {
  let countNum = String($(this).val().length);
  $("#counter3").text(countNum + "文字");
  });

  $("#js-text4").on("keyup", function() {
  let countNum = String($(this).val().length);
  $("#counter4").text(countNum + "文字");
  });

  $("#js-text5").on("keyup", function() {
  let countNum = String($(this).val().length);
  $("#counter5").text(countNum + "文字");
  });

  $("#js-text6").on("keyup", function() {
  let countNum = String($(this).val().length);
  $("#counter6").text(countNum + "文字");
  });

  $("#js-text7").on("keyup", function() {
  let countNum = String($(this).val().length);
  $("#counter7").text(countNum + "文字");
  });

  $("#js-text8").on("keyup", function() {
  let countNum = String($(this).val().length);
  $("#counter8").text(countNum + "文字");
  });

  $("#js-text9").on("keyup", function() {
  let countNum = String($(this).val().length);
  $("#counter9").text(countNum + "文字");
  });

  $("#js-text10").on("keyup", function() {
  let countNum = String($(this).val().length);
  $("#counter10").text(countNum + "文字");
  });

  $("#js-text11").on("keyup", function() {
  let countNum = String($(this).val().length);
  $("#counter11").text(countNum + "文字");
  });
});