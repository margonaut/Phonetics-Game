// require 'json'

var phonemes = $('a.phoneme');

phonemes.click(playSound);

function playSound() {
  var audio = document.getElementById('sound');
  if (audio.paused) {
      audio.play();
  }else{
      audio.currentTime = 0
  }
}
//
// var submitGroceryItemViaAjax = function(word) {
//   var request = $.ajax({
//     method: "get",
//     url: "/",
//     data: { word: word }
//   });
//
//   request.success(function() {
//     $('ul').append('<li class="item">' + item + '</li>');
//   });
// }
//
//
// $("#new-word").on("click", function(event) {
//   alert("Woo!")
//   event.preventDefault();
//
//   $.get("/new-word.json", function(random_word) {
//     $("#english").text(random_word["english"]);
//   });
// });
