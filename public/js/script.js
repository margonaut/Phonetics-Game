var phonemes = $('a.phoneme');

phonemes.click(play);

function play() {
  var audio = document.getElementById('sound');
  if (audio.paused) {
      audio.play();
  }else{
      audio.currentTime = 0
  }
}
