<?php
require_once 'config/database.php'; require_once 'includes/functions.php';
if (is_logged_in()) redirect('dashboard.php');
$errors=[];
if ($_SERVER['REQUEST_METHOD']==='POST') {
 verify_csrf();
 $name=trim($_POST['name']??''); $email=strtolower(trim($_POST['email']??'')); $class=(int)($_POST['class']??0);
 $password=$_POST['password']??'';
 if ($name==='') $errors[]='Nama wajib diisi.';
 if (!filter_var($email,FILTER_VALIDATE_EMAIL)) $errors[]='Email tidak valid.';
 if ($class<1 || $class>6) $errors[]='Pilih kelas 1 sampai 6.';
 if (strlen($password)<8) $errors[]='Kata sandi minimal 8 karakter.';
 if (!$errors) {
  $q=$pdo->prepare('SELECT id FROM users WHERE email=?'); $q->execute([$email]);
  if ($q->fetch()) $errors[]='Email sudah terdaftar.';
  else {
   $q=$pdo->prepare("INSERT INTO users(name,email,password,class,role) VALUES(?,?,?,?,'student')");
   $q->execute([$name,$email,password_hash($password,PASSWORD_DEFAULT),$class]);
   flash('Akun berhasil dibuat. Silakan masuk!'); redirect('login.php');
  }
 }
}
$pageTitle='Daftar'; require 'includes/header.php';
?>
<div class="form-card"><h1>Yuk, bergabung! 🌟</h1><p>Buat akun MathKids dan mulai petualangan matematikamu.</p>
<?php foreach($errors as $err): ?><div class="alert error"><?= e($err) ?></div><?php endforeach; ?>
<form method="post"><input type="hidden" name="csrf" value="<?= e(csrf_token()) ?>">
<label>Nama lengkap</label><input name="name" required maxlength="100" value="<?= e($_POST['name']??'') ?>">
<label>Email</label><input type="email" name="email" required value="<?= e($_POST['email']??'') ?>">
<label>Kelas</label><select name="class" required><option value="">Pilih kelas</option><?php for($i=1;$i<=6;$i++): ?><option value="<?= $i ?>" <?= (($_POST['class']??'')==$i)?'selected':'' ?>>Kelas <?= $i ?></option><?php endfor; ?></select>
<label>Kata sandi (minimal 8 karakter)</label><input type="password" name="password" minlength="8" required>
<button class="btn">Buat Akun</button></form><p class="center" style="margin-top:18px">Sudah punya akun? <a href="login.php" style="color:#3978ed">Masuk</a></p></div>
<?php require 'includes/footer.php'; ?>
