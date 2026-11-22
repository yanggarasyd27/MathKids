# MathKids — Aplikasi Matematika Interaktif

Aplikasi web responsif untuk siswa SD kelas 1–6, dibuat dengan PHP 8+, MySQL, HTML, CSS, dan JavaScript tanpa framework.

## Fitur
- Registrasi dan login siswa, password disimpan menggunakan `password_hash`.
- Role `student` dan `admin`.
- Dashboard siswa dengan statistik hasil kuis.
- Materi berdasarkan kelas 1–6.
- Kuis pilihan ganda dengan penilaian otomatis dan penyimpanan hasil.
- Mini game berhitung 60 detik (skor sesi berjalan di browser).
- Riwayat hasil kuis.
- Panel admin: CRUD materi, tambah/hapus soal, dan rekap siswa.
- Layout responsif untuk ponsel dan desktop.

## Persyaratan
- PHP 8.0 atau lebih baru (PDO MySQL aktif)
- MySQL 5.7+ atau MariaDB 10.4+
- XAMPP / Laragon / LAMP
- Browser modern

## Cara menjalankan dengan XAMPP
1. Ekstrak folder `mathkids` ke `C:\xampp\htdocs\mathkids`.
2. Jalankan Apache dan MySQL dari XAMPP Control Panel.
3. Buka `http://localhost/phpmyadmin`.
4. Pilih menu **Import**, lalu impor `database/mathkids.sql`.
5. Periksa `config/database.php`. Konfigurasi bawaan cocok untuk XAMPP standar (`root`, password kosong, database `mathkids`).
6. Buka `http://localhost/mathkids/`.
7. Daftar akun siswa melalui tombol **Daftar Gratis**.

## Membuat akun admin
Demi keamanan, registrasi publik selalu membuat role `student`. Buat akun biasa melalui halaman daftar, lalu ubah rolenya melalui phpMyAdmin:

```sql
USE mathkids;
UPDATE users SET role='admin', class=NULL WHERE email='email-admin@contoh.com';
```

Logout, kemudian login kembali dengan akun tersebut. Menu **Admin** akan muncul di navigasi.

## Struktur folder
```text
mathkids/
├── admin/                 # Panel admin
├── assets/css/style.css   # UI responsif
├── assets/js/app.js       # Interaksi umum
├── config/database.php    # Koneksi PDO
├── database/mathkids.sql  # Skema + data awal
├── includes/              # Header, footer, helper
├── index.php              # Landing page
├── register.php
├── login.php
├── dashboard.php
├── materi.php
├── kuis.php
├── game.php
└── riwayat.php
```

## Alur database
- `users` menyimpan akun dan role.
- `categories` mengelompokkan materi/soal.
- `materials` menyimpan materi per jenjang kelas.
- `questions` menyimpan soal dan opsi jawaban.
- `quiz_results` menyimpan nilai akhir tiap percobaan.
- `quiz_answers` menyimpan jawaban per soal.

## Catatan pengembangan
- Isi awal materi dan soal adalah contoh untuk demonstrasi. Admin dapat menambah materi dan soal dari panel.
- Game berhitung adalah mini game sisi browser; skor game belum disimpan ke database. Nilai kuis tersimpan permanen.
- Untuk penggunaan produksi, aktifkan HTTPS, gunakan kredensial database khusus (bukan root), batasi percobaan login, tambahkan kebijakan privasi/izin orang tua, dan lakukan backup database.
- Fitur reset kata sandi, verifikasi email, ekspor laporan, dan pengelolaan akun admin lanjutan belum termasuk versi awal ini.
