<?php
require_once 'config/database.php'; require_once 'includes/functions.php';
if (is_logged_in()) redirect('dashboard.php');
$error='';
if ($_SERVER['REQUEST_METHOD']==='POST') {
 verify_csrf(); $email=strtolower(trim($_POST['email']??'')); $password=$_POST['password']??'';
 $q=$pdo->prepare('SELECT id,name,email,password,class,role FROM users WHERE email=?'); $q->execute([$email]); $u=$q->fetch();
 if ($u && password_verify($password,$u['password'])) {
  session_regenerate_id(true); unset($u['password']); $_SESSION['user']=$u; redirect('dashboard.php');
 } else $error='Email atau kata sandi tidak sesuai.';
}
$pageTitle='Masuk'; require 'includes/header.php';
?>
<div class="form-card"><h1>Selamat datang! 👋</h1><p>Masuk untuk melanjutkan petualangan belajar.</p>
<?php if($error): ?><div class="alert error"><?= e($error) ?></div><?php endif; ?>
<form method="post"><input type="hidden" name="csrf" value="<?= e(csrf_token()) ?>">
<label>Email</label><input type="email" name="email" required autocomplete="username">
<label>Kata sandi</label><input type="password" name="password" required autocomplete="current-password">
<button class="btn">Masuk ke MathKids</button></form><p class="center" style="margin-top:18px">Belum punya akun? <a href="register.php" style="color:#3978ed">Daftar sekarang</a></p></div>
<?php require 'includes/footer.php'; ?>
