<?php
require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../includes/functions.php';
require_admin();
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    verify_csrf();
    $action = $_POST['action'] ?? '';
    if ($action === 'save') {
        $id = (int) ($_POST['id'] ?? 0);
        $data = [trim($_POST['title']), (int) $_POST['class_level'], (int) $_POST['category_id'], trim($_POST['content']), trim($_POST['example'])];
        if ($id) {
            $q = $pdo->prepare('UPDATE materials SET title=?,class_level=?,category_id=?,content=?,example=? WHERE id=?');
            $q->execute([...$data, $id]);
        } else {
            $q = $pdo->prepare('INSERT INTO materials(title,class_level,category_id,content,example) VALUES(?,?,?,?,?)');
            $q->execute($data);
        }
        flash('Materi berhasil disimpan.');
    }
    if ($action === 'delete') {
        $q = $pdo->prepare('DELETE FROM materials WHERE id=?');
        $q->execute([(int) $_POST['id']]);
        flash('Materi dihapus.');
    }
    redirect('materi.php');
}
$edit = null;
if (isset($_GET['edit'])) {
    $q = $pdo->prepare('SELECT * FROM materials WHERE id=?');
    $q->execute([(int) $_GET['edit']]);
    $edit = $q->fetch();
}
$rows = $pdo->query('SELECT m.*,c.name category_name FROM materials m LEFT JOIN categories c ON c.id=m.category_id ORDER BY m.class_level,m.id')->fetchAll();
$cats = $pdo->query('SELECT * FROM categories ORDER BY name')->fetchAll();
$pageTitle = 'Kelola Materi';
require __DIR__ . '/../includes/header.php';
?>
<div class="page-title">
    <h1>Kelola Materi</h1>
    <p>Tambah atau perbarui materi pembelajaran.</p>
</div>
<div class="card">
    <h3><?= $edit ? 'Edit materi' : 'Tambah materi baru' ?></h3>
    <form method="post"><input type="hidden" name="csrf" value="<?= e(csrf_token()) ?>"><input type="hidden"
            name="action" value="save"><input type="hidden" name="id" value="<?= (int) ($edit['id'] ?? 0) ?>">
        <label>Judul</label><input name="title" required
            value="<?= e($edit['title'] ?? '') ?>"><label>Kelas</label><select
            name="class_level"><?php for ($i = 1; $i <= 6; $i++): ?>
                <option value="<?= $i ?>" <?= (($edit['class_level'] ?? 1) == $i) ? 'selected' : '' ?>>Kelas <?= $i ?></option>
            <?php endfor; ?>
        </select>
        <label>Kategori</label><select name="category_id"><?php foreach ($cats as $c): ?>
                <option value="<?= $c['id'] ?>" <?= (($edit['category_id'] ?? '') == $c['id']) ? 'selected' : '' ?>>
                    <?= e($c['name']) ?>
                </option><?php endforeach; ?>
        </select>
        <label>Isi materi</label><textarea name="content" rows="4"
            required><?= e($edit['content'] ?? '') ?></textarea><label>Contoh (opsional)</label><input name="example"
            value="<?= e($edit['example'] ?? '') ?>"><button class="btn" style="margin-top:15px">Simpan Materi</button>
    </form>
</div>
<div class="section-head">
    <h2>Daftar Materi</h2>
</div>
<div class="table-wrap">
    <table>
        <tr>
            <th>Judul</th>
            <th>Kelas</th>
            <th>Kategori</th>
            <th>Aksi</th>
        </tr><?php foreach ($rows as $r): ?>
            <tr>
                <td><?= e($r['title']) ?></td>
                <td><?= $r['class_level'] ?></td>
                <td><?= e($r['category_name']) ?></td>
                <td class="admin-actions"><a class="badge" href="?edit=<?= $r['id'] ?>">Edit</a>
                    <form method="post" class="inline-form"><input type="hidden" name="csrf"
                            value="<?= e(csrf_token()) ?>"><input type="hidden" name="action" value="delete"><input
                            type="hidden" name="id" value="<?= $r['id'] ?>"><button class="badge"
                            data-confirm="Hapus materi ini?">Hapus</button></form>
                </td>
            </tr><?php endforeach; ?>
    </table>
</div>
<?php require __DIR__ . '/../includes/footer.php'; ?>