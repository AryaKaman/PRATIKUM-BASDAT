SQL> create tablespace jagad_07033
  2  datafile 'G:\JAGAD KULIAH\BASDAT\Pratikum\Modul1\jagad_07033.dbf'
  3  size  30M;

SQL> create user arya_07033
  2  identified by 07033 
  3  default tablespace jagad_07033
  4  quota 30m on jagad_07033;

SQL>grant all privileges to Arya_Puspa_07033;

SQL> create table Admin
  2  (
  3  id_admin integer not null,
  5  pass_admin varchar2(15),
  6  nama_admin varchar2(15),
  7  constraint PK_Admin primary key (id_admin));

SQL> create table Costumer
  2  ((
  3  id_cs integer not null, 
  4  usia number(3),
  5  pass_cs varchar2(15),
  6  nama_cs varchar2(15),
  7  alamat varchar2(100),
  8  no_telp number(12),
  9  constraint PK_costumer primary key(id_cs));

SQL> create table Pesawat
  2  (
  3  no_penerbangan varchar2(5) not null,
  4  jam_berangkat date,
  5  jam_tiba date,
  6  kota_tujuan varchar2(15),
  7  tanggal_berangkat date,
  8  maskapai varchar2(15),
  9  constraint PK_pesawat primary key (no_penerbangan));

SQL> create table reservasi
  2  (
  3  id_reservasi integer not null,
  4  id_admin integer,
  5  id_cs integer,
  6  no_penerbangan varchar2(5),
  7  tanggal_pesan date,
  8  jumlah_tiket number(2),
  9  constraint PK_reservasi primary key (id_reservasi),
 10  constraint FK_id_admin foreign key (id_admin)
 11  references admin(id_admin),
 12  constraint FK_id_cs foreign key (id_cs)
 13  references costumer(id_cs),
 14  constraint FK_no_penerbangan foreign key (no_penerbangan)
 15  references pesawat(no_penerbangan));

SQL> create table transaksi
  2  (
  3  id_transaksi integer not null,
  4  id_reservasi integer,
  5  tanggal_bayar date,
  6  jumlah_bayar number(12),
  7  total_bayar number(12),
  8  uang_kembalian number(12),
  9  constraint PK_id_transaksi primary key (id_transaksi),
  10  constraint FK_id_reservasi foreign key (id_reservasi)
 11  references reservasi(id_reservasi));

SQL> create sequence id_transaksi
  2  minvalue 1
  3  maxvalue 999
  4  start with 1
  5  increment by 1
  6  cache 30;

Sequence created.

SQL> alter table admin
  2  rename column id_admin to "07033_id_admin";

Table altered.

SQL> alter table costumer
  2  modify no_telp unique;

Table altered.

SQL> alter table pesawat
  2  modify(harga_tiket varchar2(15));

Table altered.

