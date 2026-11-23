<?php
require_once 'includes/functions.php'; require_login(); $pageTitle='Game Berhitung'; require 'includes/header.php';
?>
<div class="page-title"><div class="eyebrow">Mini game</div><h1>Tantangan Berhitung 🎮</h1><p>Latih kecepatan berhitungmu. Jawab sebanyak mungkin dalam 60 detik!</p></div>
<div class="card quiz-box center"><div class="stats"><div class="stat"><span>WAKTU</span><strong id="time">60</strong></div><div class="stat"><span>SKOR</span><strong id="score">0</strong></div><div class="stat"><span>LEVEL</span><strong id="level">1</strong></div><div class="stat"><span>REKOR SESI</span><strong id="best">0</strong></div></div>
<div class="question" id="problem">Tekan mulai untuk bermain!</div><form id="game-form"><input id="game-answer" type="number" inputmode="numeric" placeholder="Jawabanmu" disabled autocomplete="off"><button class="btn" id="start" type="button" style="margin-top:15px">Mulai Game</button><button class="btn btn-outline" id="submit-answer" type="submit" disabled>Jawab</button></form><p id="feedback" class="muted">Setiap jawaban benar menambah 10 poin.</p></div>
<script>
(()=>{let a=0,b=0,correct=0,score=0,time=60,timer=null,active=false;const $=id=>document.getElementById(id);
function next(){let op=Math.random()<.5?'+':'×';a=Math.floor(Math.random()*12)+1;b=Math.floor(Math.random()*12)+1;correct=op==='+'?a+b:a*b;$('problem').textContent=`${a} ${op} ${b} = ?`;$('game-answer').value='';$('game-answer').focus();}
function end(){active=false;clearInterval(timer);$('problem').textContent='Waktu habis! 🎉';$('feedback').textContent=`Skor akhir: ${score}. Main lagi untuk pecahkan rekor!`;$('start').disabled=false;$('start').textContent='Main Lagi';$('game-answer').disabled=true;$('submit-answer').disabled=true;$('best').textContent=Math.max(score,Number($('best').textContent));}
$('start').onclick=()=>{score=0;time=60;active=true;$('score').textContent=0;$('time').textContent=60;$('start').disabled=true;$('game-answer').disabled=false;$('submit-answer').disabled=false;$('feedback').textContent='Semangat!';next();timer=setInterval(()=>{time--;$('time').textContent=time;if(time<=0)end()},1000)};
$('game-form').onsubmit=e=>{e.preventDefault();if(!active)return;let v=Number($('game-answer').value);if($('game-answer').value==='')return;if(v===correct){score+=10;$('feedback').textContent='Benar! +10 poin ⭐'}else $('feedback').textContent=`Belum tepat. Jawaban: ${correct}`;$('score').textContent=score;$('level').textContent=Math.floor(score/50)+1;next();};
})();
</script>
<?php require 'includes/footer.php'; ?>
