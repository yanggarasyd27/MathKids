CREATE DATABASE IF NOT EXISTS mathkids CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE mathkids;

CREATE TABLE users (
 id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(100) NOT NULL,
 email VARCHAR(150) NOT NULL UNIQUE,
 password VARCHAR(255) NOT NULL,
 class TINYINT UNSIGNED NULL,
 role ENUM('student','admin') NOT NULL DEFAULT 'student',
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE categories (
 id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(80) NOT NULL UNIQUE,
 description VARCHAR(255) NULL
) ENGINE=InnoDB;

CREATE TABLE materials (
 id INT AUTO_INCREMENT PRIMARY KEY,
 category_id INT NULL,
 title VARCHAR(150) NOT NULL,
 class_level TINYINT UNSIGNED NOT NULL,
 content TEXT NOT NULL,
 example VARCHAR(255) NULL,
 is_published TINYINT(1) NOT NULL DEFAULT 1,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(category_id) REFERENCES categories(id) ON DELETE SET NULL
) ENGINE=InnoDB;

CREATE TABLE questions (
 id INT AUTO_INCREMENT PRIMARY KEY,
 category_id INT NULL,
 question TEXT NOT NULL,
 class_level TINYINT UNSIGNED NOT NULL,
 option_a VARCHAR(255) NOT NULL,
 option_b VARCHAR(255) NOT NULL,
 option_c VARCHAR(255) NOT NULL,
 option_d VARCHAR(255) NOT NULL,
 correct_option ENUM('A','B','C','D') NOT NULL,
 is_published TINYINT(1) NOT NULL DEFAULT 1,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(category_id) REFERENCES categories(id) ON DELETE SET NULL
) ENGINE=InnoDB;

CREATE TABLE quiz_results (
 id INT AUTO_INCREMENT PRIMARY KEY,
 user_id INT NOT NULL,
 score TINYINT UNSIGNED NOT NULL,
 total_questions SMALLINT UNSIGNED NOT NULL,
 correct_answers SMALLINT UNSIGNED NOT NULL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,
 INDEX(user_id,created_at)
) ENGINE=InnoDB;

CREATE TABLE quiz_answers (
 id INT AUTO_INCREMENT PRIMARY KEY,
 result_id INT NOT NULL,
 question_id INT NOT NULL,
 selected_option ENUM('A','B','C','D') NULL,
 is_correct TINYINT(1) NOT NULL DEFAULT 0,
 FOREIGN KEY(result_id) REFERENCES quiz_results(id) ON DELETE CASCADE,
 FOREIGN KEY(question_id) REFERENCES questions(id) ON DELETE CASCADE
) ENGINE=InnoDB;

INSERT INTO categories(name,description) VALUES
('Operasi Hitung','Penjumlahan, pengurangan, perkalian, pembagian'),
('Pecahan','Mengenal pecahan sederhana'),
('Geometri','Bangun datar dan bangun ruang');

INSERT INTO materials(category_id,title,class_level,content,example) VALUES
(1,'Mengenal Penjumlahan',1,'Penjumlahan adalah kegiatan menggabungkan dua kelompok benda atau lebih. Tanda penjumlahan adalah +.','2 + 3 = 5'),
(1,'Mengenal Pengurangan',1,'Pengurangan berarti mengambil sebagian dari jumlah yang ada. Tanda pengurangan adalah −.','5 − 2 = 3'),
(1,'Perkalian sebagai Penjumlahan Berulang',2,'Perkalian adalah penjumlahan berulang dari bilangan yang sama.','3 × 2 = 2 + 2 + 2 = 6'),
(1,'Pembagian Sederhana',3,'Pembagian berarti membagi sesuatu menjadi beberapa kelompok sama banyak.','12 ÷ 3 = 4'),
(2,'Mengenal Pecahan',4,'Pecahan menyatakan bagian dari keseluruhan. Angka atas disebut pembilang dan angka bawah disebut penyebut.','1/2 berarti satu dari dua bagian sama besar'),
(3,'Bangun Datar',5,'Bangun datar adalah bentuk dua dimensi yang memiliki panjang dan lebar. Contohnya persegi, segitiga, dan lingkaran.','Luas persegi = sisi × sisi'),
(3,'Bangun Ruang',6,'Bangun ruang memiliki panjang, lebar, dan tinggi serta menempati ruang. Contohnya kubus dan balok.','Volume kubus = sisi × sisi × sisi');

INSERT INTO questions(category_id,question,class_level,option_a,option_b,option_c,option_d,correct_option) VALUES
(1,'Berapakah hasil 2 + 3?',1,'4','5','6','7','B'),
(1,'Berapakah hasil 7 − 4?',1,'2','3','4','5','B'),
(1,'Berapakah hasil 4 + 5?',2,'8','9','10','11','B'),
(1,'Berapakah hasil 3 × 4?',2,'7','10','12','14','C'),
(1,'Berapakah hasil 20 ÷ 5?',3,'2','3','4','5','C'),
(1,'Berapakah hasil 9 × 8?',4,'63','72','81','89','B'),
(2,'Pecahan yang senilai dengan 1/2 adalah ...',4,'1/3','2/4','3/5','2/3','B'),
(3,'Bangun datar yang memiliki 4 sisi sama panjang adalah ...',5,'Persegi','Segitiga','Lingkaran','Trapesium','A'),
(3,'Kubus memiliki berapa sisi?',6,'4','5','6','8','C');
