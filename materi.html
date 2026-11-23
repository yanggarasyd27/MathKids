<?php
require_once 'config/database.php'; require_once 'includes/functions.php'; require_login();
$filter=max(1,min(6,(int)($_GET['kelas']??current_user()['class']??1)));
$q=$pdo->prepare('SELECT m.*,c.name category_name FROM materials m LEFT JOIN categories c ON c.id=m.category_id WHERE m.class_level=? AND m.is_published=1 ORDER BY m.id'); $q->execute([$filter]); $materials=$q->fetchAll();
$pageTitle='Materi'; require 'includes/header.php';
?>
<div class="page-title"><div class="eyebrow">Perpustakaan matematika</div><h1>Materi Belajar 📚</h1><p>Pilih kelas untuk melihat materi yang sesuai.</p></div>
<div class="admin-actions"><?php for($i=1;$i<=6;$i++): ?><a class="btn btn-small <?= $i===$filter?'':'btn-outline' ?>" href="?kelas=<?= $i ?>">Kelas <?= $i ?></a><?php endfor; ?></div>
<div class="grid" style="margin-top:20px">
<?php foreach($materials as $m): ?><article class="card"><span class="badge"><?= e($m['category_name']??'Matematika') ?> · Kelas <?= (int)$m['class_level'] ?></span><h3><?= e($m['title']) ?></h3><p><?= nl2br(e($m['content'])) ?></p><?php if($m['example']): ?><div class="alert success">Contoh: <?= e($m['example']) ?></div><?php endif; ?></article><?php endforeach; ?>
<?php if(!$materials): ?><div class="card empty">Belum ada materi untuk kelas ini. Admin dapat menambahkan materi melalui panel admin.</div><?php endif; ?>
</div>
<?php require 'includes/footer.php'; ?>
