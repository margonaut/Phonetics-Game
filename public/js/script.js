var phonemes = $('a.phoneme');

phonemes.click(function() {
    var audio = document.getElementById('sound');
    if (audio.paused) {
        audio.play();
    }else{
        audio.currentTime = 0
    }
});

// function play() {
//   alert("Working!");
//     var audio = document.getElementById('moo');
//     if (audio.paused) {
//         audio.play();
//     }else{
//         audio.currentTime = 0
//     }
// }
