-- Alternatif Query 1: Menggunakan LEFT JOIN untuk menemukan ketidaksesuaian data

SELECT p.Id_peserta, p.Nama, jp.Nama_jalur, pg.Status_kelulusan, du.Status_daftar_ulang, 
       CASE 
           WHEN du.Status_daftar_ulang IS NULL OR du.Status_daftar_ulang != 'Approved' THEN 'Bermasalah'
           ELSE 'OK'
       END AS Status_verifikasi
FROM pengumuman pg
JOIN pendaftaran pd ON pg.Id_pendaftaran = pd.Id_pendaftaran
JOIN calon_peserta_didik p ON pd.Id_peserta = p.Id_peserta
JOIN jalur_pendaftaran jp ON pd.Id_jalur = jp.Id_jalur
LEFT JOIN daftar_ulang du ON pg.Id_pengumuman = du.Id_pengumuman
WHERE pg.Status_kelulusan = 'Approved'
ORDER BY  jp.Nama_jalur;

-- Alternatif Query 2: Menampilkan peserta yang lolos seleksi tapi daftar ulangnya masih Pending atau tidak ada

SELECT p.Id_peserta, p.Nama, jp.Nama_jalur, pg.Status_kelulusan, du.Status_daftar_ulang
FROM pengumuman pg
JOIN pendaftaran pd ON pg.Id_pendaftaran = pd.Id_pendaftaran
JOIN calon_peserta_didik p ON pd.Id_peserta = p.Id_peserta
JOIN jalur_pendaftaran jp ON pd.Id_jalur = jp.Id_jalur
LEFT JOIN daftar_ulang du ON pg.Id_pengumuman = du.Id_pengumuman
WHERE pg.Status_kelulusan = 'Approved' AND (du.Status_daftar_ulang IS NULL OR du.Status_daftar_ulang = 'Pending')
ORDER BY jp.Nama_jalur;

-- Alternatif Query 3: Menampilkan peserta yang daftar ulang tetapi tidak diterima di pengumuman

SELECT p.Id_peserta, p.Nama, jp.Nama_jalur, du.Status_daftar_ulang, pg.Status_kelulusan
FROM daftar_ulang du
JOIN pengumuman pg ON du.Id_pengumuman = pg.Id_pengumuman
JOIN pendaftaran pd ON pg.Id_pendaftaran = pd.Id_pendaftaran
JOIN calon_peserta_didik p ON pd.Id_peserta = p.Id_peserta
JOIN jalur_pendaftaran jp ON pd.Id_jalur = jp.Id_jalur
WHERE pg.Status_kelulusan != 'Approved' AND du.Status_daftar_ulang = 'Approved'
ORDER BY  jp.Nama_jalur;

-- Konversi ke Operasi Set

-- Query 1 dalam bentuk Operasi Set
SELECT Id_peserta, Nama, Nama_jalur, Status_kelulusan, Status_daftar_ulang, 'Bermasalah' AS Status_verifikasi FROM (
    (SELECT p.Id_peserta, p.Nama, jp.Nama_jalur, pg.Status_kelulusan, du.Status_daftar_ulang FROM pengumuman pg
    JOIN pendaftaran pd ON pg.Id_pendaftaran = pd.Id_pendaftaran
    JOIN calon_peserta_didik p ON pd.Id_peserta = p.Id_peserta
    JOIN jalur_pendaftaran jp ON pd.Id_jalur = jp.Id_jalur
    LEFT JOIN daftar_ulang du ON pg.Id_pengumuman = du.Id_pengumuman
    WHERE pg.Status_kelulusan = 'Approved')
    EXCEPT
    (SELECT p.Id_peserta, p.Nama, jp.Nama_jalur, pg.Status_kelulusan, du.Status_daftar_ulang FROM daftar_ulang du
    JOIN pengumuman pg ON du.Id_pengumuman = pg.Id_pengumuman
    JOIN pendaftaran pd ON pg.Id_pendaftaran = pd.Id_pendaftaran
    JOIN calon_peserta_didik p ON pd.Id_peserta = p.Id_peserta
    JOIN jalur_pendaftaran jp ON pd.Id_jalur = jp.Id_jalur
    WHERE du.Status_daftar_ulang = 'Approved')
) AS hasil
ORDER BY Nama_jalur;


-- Query 2 dalam bentuk Operasi Set

SELECT Id_peserta, Nama, Nama_jalur FROM (
    (SELECT p.Id_peserta, p.Nama, jp.Nama_jalur FROM calon_peserta_didik p
    JOIN pendaftaran pd ON p.Id_peserta = pd.Id_peserta
    JOIN pengumuman pg ON pd.Id_pendaftaran = pg.Id_pendaftaran
    JOIN jalur_pendaftaran jp ON pd.Id_jalur = jp.Id_jalur
    WHERE pg.Status_kelulusan = 'Approved')
    EXCEPT
    (SELECT p.Id_peserta, p.Nama, jp.Nama_jalur FROM daftar_ulang du
    JOIN pengumuman pg ON du.Id_pengumuman = pg.Id_pengumuman
    JOIN pendaftaran pd ON pg.Id_pendaftaran = pd.Id_pendaftaran
    JOIN calon_peserta_didik p ON pd.Id_peserta = p.Id_peserta
    JOIN jalur_pendaftaran jp ON pd.Id_jalur = jp.Id_jalur
    WHERE du.Status_daftar_ulang != 'Pending')
) AS hasil;


-- Query 3 dalam bentuk Operasi Set
SELECT Id_peserta, Nama,  Nama_jalur FROM (
    (SELECT p.Id_peserta, p.Nama, jp.Nama_jalur FROM daftar_ulang du
    JOIN pengumuman pg ON du.Id_pengumuman = pg.Id_pengumuman
    JOIN pendaftaran pd ON pg.Id_pendaftaran = pd.Id_pendaftaran
    JOIN calon_peserta_didik p ON pd.Id_peserta = p.Id_peserta
    JOIN jalur_pendaftaran jp ON pd.Id_jalur = jp.Id_jalur
    WHERE du.Status_daftar_ulang = 'Approved')
    EXCEPT
    (SELECT p.Id_peserta, p.Nama, jp.Nama_jalur FROM pengumuman pg
    JOIN pendaftaran pd ON pg.Id_pendaftaran = pd.Id_pendaftaran
    JOIN calon_peserta_didik p ON pd.Id_peserta = p.Id_peserta
    JOIN jalur_pendaftaran jp ON pd.Id_jalur = jp.Id_jalur
    WHERE pg.Status_kelulusan = 'Approved')
) AS hasil;

-- Optimisasi Query 1
SELECT 
    p.Id_peserta, 
    p.Nama, 
    jp.Nama_jalur, 
    pg.Status_kelulusan, 
    COALESCE(du.Status_daftar_ulang, 'Pending') AS Status_daftar_ulang, 
    CASE 
        WHEN COALESCE(du.Status_daftar_ulang, 'Pending') = 'Approved' THEN 'OK'
        ELSE 'Bermasalah'
    END AS Status_verifikasi
FROM pengumuman pg
JOIN pendaftaran pd ON pg.Id_pendaftaran = pd.Id_pendaftaran
JOIN calon_peserta_didik p ON pd.Id_peserta = p.Id_peserta
JOIN jalur_pendaftaran jp ON pd.Id_jalur = jp.Id_jalur
LEFT JOIN daftar_ulang du ON pg.Id_pengumuman = du.Id_pengumuman
WHERE pg.Status_kelulusan = 'Approved'
ORDER BY jp.Nama_jalur;


-- ✅ Lebih efisien dengan COALESCE untuk menangani NULL.
-- ✅ Lebih sederhana dengan kondisi CASE yang lebih ringkas.
-- ✅ Lebih cepat dengan penghapusan kondisi yang tidak perlu.


-- Optimisasi query 2
SELECT 
    p.Id_peserta, 
    p.Nama, 
    jp.Nama_jalur, 
    pg.Status_kelulusan, 
    COALESCE(du.Status_daftar_ulang, 'Pending') AS Status_daftar_ulang
FROM pengumuman pg
JOIN pendaftaran pd ON pg.Id_pendaftaran = pd.Id_pendaftaran
JOIN calon_peserta_didik p ON pd.Id_peserta = p.Id_peserta
JOIN jalur_pendaftaran jp ON pd.Id_jalur = jp.Id_jalur
LEFT JOIN daftar_ulang du ON pg.Id_pengumuman = du.Id_pengumuman
WHERE pg.Status_kelulusan = 'Approved' 
AND COALESCE(du.Status_daftar_ulang, 'Pending') = 'Pending'
ORDER BY jp.Nama_jalur;

-- ✅ Lebih efisien karena COALESCE menggantikan pengecekan NULL.
-- ✅ Lebih sederhana tanpa kondisi yang berulang.


-- optimisasi query 3
SELECT 
    p.Id_peserta, 
    p.Nama, 
    jp.Nama_jalur, 
    du.Status_daftar_ulang
FROM pengumuman pg
JOIN pendaftaran pd ON pg.Id_pendaftaran = pd.Id_pendaftaran
JOIN calon_peserta_didik p ON pd.Id_peserta = p.Id_peserta
JOIN jalur_pendaftaran jp ON pd.Id_jalur = jp.Id_jalur
-- Menggunakan INNER JOIN karena hanya butuh peserta yang sudah daftar ulang
JOIN daftar_ulang du ON pg.Id_pengumuman = du.Id_pengumuman
WHERE pg.Status_kelulusan != 'Approved' 
AND du.Status_daftar_ulang = 'Approved'
ORDER BY jp.Nama_jalur;

-- -- Optimasi yang Dilakukan:
-- Menyesuaikan Urutan JOIN:

-- Jika data daftar ulang hanya terkait dengan pengumuman, maka pengumuman sebaiknya di-join dulu sebelum mengakses tabel lainnya untuk efisiensi.
-- Penghapusan Kolom yang Tidak Diperlukan (Opsional):

-- Jika hanya ingin melihat peserta dengan status tidak diterima (Status_kelulusan != 'Approved') tetapi melakukan daftar ulang, maka pg.Status_kelulusan bisa dihilangkan dari SELECT.
-- Optimasi ORDER BY:

-- Jika urutan Nama_jalur sering digunakan dalam pencarian, pastikan ada index pada jp.Nama_jalur untuk meningkatkan performa sorting.





