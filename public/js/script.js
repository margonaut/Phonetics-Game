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
