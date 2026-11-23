<?php
require_once 'config/database.php'; require_once 'includes/functions.php'; require_login();
$u=current_user();
$q=$pdo->prepare('SELECT COUNT(*) total, COALESCE(MAX(score),0) best, COALESCE(SUM(score),0) points FROM quiz_results WHERE user_id=?'); $q->execute([$u['id']]); $stats=$q->fetch();
$q=$pdo->prepare('SELECT COUNT(*) FROM quiz_results WHERE user_id=?'); $q->execute([$u['id']]); $count=(int)$q->fetchColumn();
$pageTitle='Dashboard'; require 'includes/header.php';
?>
<div class="page-title"><div class="eyebrow">Dashboard siswa</div><h1>Halo, <?= e($u['name']) ?>! 👋</h1><p>Siap belajar matematika hari ini? Kamu hebat karena terus mencoba.</p></div>
<div class="stats"><div class="stat"><span>KELAS</span><strong><?= e($u['class']??'-') ?></strong></div><div class="stat"><span>KUIS SELESAI</span><strong><?= $count ?></strong></div><div class="stat"><span>NILAI TERBAIK</span><strong><?= (int)$stats['best'] ?></strong></div><div class="stat"><span>TOTAL POIN</span><strong>⭐ <?= (int)$stats['points'] ?></strong></div></div>
<div class="section-head"><div><h2>Mau belajar apa hari ini?</h2><p>Pilih aktivitas favoritmu.</p></div></div>
<div class="grid">
<a class="card" href="materi.php"><div class="icon-tile">📚</div><h3>Materi Belajar</h3><p>Kenali konsep matematika dengan contoh sederhana.</p><span class="badge">Lihat materi →</span></a>
<a class="card" href="kuis.php"><div class="icon-tile tile-yellow">🧠</div><h3>Kuis Matematika</h3><p>Jawab pertanyaan dan dapatkan nilai terbaik.</p><span class="badge">Mulai kuis →</span></a>
<a class="card" href="game.php"><div class="icon-tile tile-purple">🎮</div><h3>Game Berhitung</h3><p>Latihan cepat untuk mengasah kemampuan berhitung.</p><span class="badge">Main sekarang →</span></a>
</div>
<div class="section-head"><div><h2>Target belajarmu</h2><p>Satu langkah kecil setiap hari akan membuatmu semakin pintar.</p></div></div>
<div class="card"><div style="display:flex;justify-content:space-between;gap:10px"><strong>Terus kumpulkan pengalaman!</strong><span class="badge">⭐ <?= (int)$stats['points'] ?> poin</span></div><div class="progress" style="margin-top:14px"><span style="width:<?= min(100,(int)$stats['points']%101) ?>%"></span></div></div>
<?php require 'includes/footer.php'; ?>
