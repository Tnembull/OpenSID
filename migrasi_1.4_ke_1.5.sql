--
-- --------------------------------------------------------
--
-- Mengubah struktur database SID
--
-- --------------------------------------------------------
--

-- Tambah kolom di tabel tweb_penduduk
ALTER TABLE tweb_penduduk ADD cara_kb_id tinyint(2) NULL DEFAULT NULL;

-- Tambah tabel cara_kb
DROP TABLE IF EXISTS tweb_cara_kb;

CREATE TABLE tweb_cara_kb (
  id tinyint(5) NOT NULL AUTO_INCREMENT,
  nama varchar(50) NOT NULL,
  sex tinyint(2),
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO tweb_cara_kb (id, nama, sex) VALUES
  (1, 'Pil', 2),
  (2, 'IUD', 2),
  (3, 'Suntik', 2),
  (4, 'Kondom', 1),
  (5, 'Susuk KB', 2),
  (6, 'Sterilisasi Wanita', 2),
  (7, 'Sterilisasi Pria', 1),
  (99, 'Lainnya', 3);

-- Ubah tanggallahir supaya tidak tampil apabila kosong
ALTER TABLE tweb_penduduk CHANGE tanggallahir tanggallahir DATE NULL DEFAULT NULL;

UPDATE tweb_penduduk SET tanggallahir=NULL
WHERE tanggallahir='0000-00-00' OR tanggallahir='00-00-0000';

