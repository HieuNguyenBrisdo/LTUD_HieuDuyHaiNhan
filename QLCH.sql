---DROP DATABASE QLCH
CREATE DATABASE QLCH

-- Tạo tài khoản admin
CREATE TABLE TAIKHOAN
(
  Taikhoan nvarchar(30) PRIMARY KEY ,
  Matkhau varchar(6),
)
INSERT INTO TAIKHOAN (Taikhoan,Matkhau) VALUES ('admin','admin')

CREATE PROC sp_LoadTaiKhoan
AS
SELECT * FROM TAIKHOAN
GO

CREATE PROC sp_KiemTraTaiKhoan
@Taikhoan nvarchar(30),
@Matkhau varchar(6)
AS
SELECT * FROM TAIKHOAN WHERE Taikhoan = @Taikhoan AND Matkhau = @Matkhau
GO

----- Bang doi mat khau ---- 
CREATE TABLE DOIMATKHAU
(
  Taikhoan nvarchar(30),
  Matkhaucu varchar(6),
  Matkhaumoi varchar(6),
  Nhaplaimatkhaumoi varchar(6), 
)

CREATE PROC sp_Doimatkhau
	@Taikhoan nvarchar(30),
	@Matkhaucu varchar(6),
	@Matkhaumoi varchar(6),
	@Nhaplaimatkhaumoi varchar(6)
AS
SELECT * FROM DOIMATKHAU WHERE Taikhoan = @Taikhoan
GO

--Tao bang nhân viên----
CREATE TABLE NHANVIEN
(
  MANV varchar(10) PRIMARY KEY,
  MACV varchar(10),
  MAKV varchar(10),
  HOTEN nvarchar(30),
  NGSINH date,
  SDT varchar(10),
  DIACHI nvarchar(50),
  SONGAYLAM int,
  LUONGCB float,
  THUONG float,
  TONGLUONG float,
)

----- STORE --------
-- bang nhan vien 
CREATE PROC sp_insertnhanvien
@MANV varchar(10),
@MAKV varchar(10),
@MACV varchar(10),
@HOTEN nvarchar(30),
@NGSINH date,
@SDT varchar(10),
@DIACHI nvarchar(50),
@SONGAYLAM int,
@LUONGCB float,
@THUONG float,
@TONGLUONG float
AS
INSERT INTO NHANVIEN(MANV,MAKV,MACV,HOTEN,NGSINH,SDT,DIACHI,SONGAYLAM,LUONGCB,THUONG,TONGLUONG) VALUES (@MANV,@MAKV,@MACV,@HOTEN,@NGSINH,@SDT,@DIACHI,@SONGAYLAM,@LUONGCB,@THUONG,@TONGLUONG)
GO

CREATE PROC sp_updatenhanvien
@MANV varchar(10),
@MAKV varchar(10),
@MACV varchar(10),
@HOTEN nvarchar(30),
@NGSINH date,
@SDT varchar(10),
@DIACHI nvarchar(50),
@SONGAYLAM int,
@LUONGCB float,
@THUONG float,
@TONGLUONG float
AS
UPDATE  NHANVIEN SET MAKV=@MAKV,MACV=@MACV,HOTEN=@HOTEN,NGSINH=@NGSINH,SDT=@SDT,DIACHI=@DIACHI,SONGAYLAM=@SONGAYLAM,LUONGCB=@LUONGCB,THUONG=@THUONG,TONGLUONG=@TONGLUONG WHERE MANV=@MANV
GO

CREATE PROC sp_searchnhanvien
@HOTEN nvarchar(30)
AS
SELECT * FROM NHANVIEN WHERE HOTEN LIKE '%' + @HOTEN + '%'
GO

CREATE PROC sp_deletenhanvien
@MANV varchar(10)
AS
DELETE NHANVIEN WHERE MANV = @MANV
GO

CREATE PROC sp_loaddulieunhanvien
AS
SELECT * FROM NHANVIEN
GO

--Tao bang khách hàng ----
CREATE TABLE KHACHHANG
(
  MAKH varchar(10)PRIMARY KEY,
  HOTEN nvarchar(30),
  NGSINH date,
  SDT varchar(10),
  DIACHI nvarchar(50),
  NGDK date,
)
---- STORE ----- 
-- bang khachhang
CREATE PROC sp_insertkhachhang
@MAKH varchar(10),
@HOTEN nvarchar(30),
@NGSINH date,
@SDT varchar(10),
@DIACHI nvarchar(50),
@NGDK date
AS
INSERT INTO KHACHHANG (MAKH,HOTEN,NGSINH,SDT,DIACHI,NGDK) VALUES (@MAKH,@HOTEN,@NGSINH,@SDT,@DIACHI,@NGDK)
GO

CREATE PROC sp_updatenkhachhang
@MAKH varchar(10),
@HOTEN nvarchar(30),
@NGSINH date,
@SDT varchar(10),
@DIACHI nvarchar(50),
@NGDK date
AS
UPDATE KHACHHANG SET HOTEN=@HOTEN,NGSINH=@NGSINH,SDT=@SDT,DIACHI=@DIACHI,NGDK=@NGDK WHERE MAKH=@MAKH
GO

CREATE PROC sp_searchkhachhang
@HOTEN nvarchar(30)
AS
SELECT * FROM KHACHHANG WHERE HOTEN LIKE '%' + @HOTEN + '%'
GO

CREATE PROC sp_deletekhachhang
@MAKH varchar(10)
AS
DELETE KHACHHANG WHERE MAKH=@MAKH
GO

CREATE PROC sp_loaddulieukhachhang
AS
SELECT * FROM KHACHHANG
GO


--Tao bang san pham----
CREATE TABLE SANPHAM
(
  MASP varchar(10)PRIMARY KEY,
  TENSP nvarchar(30),
  XUATXU nvarchar(20),
  SOLUONG int,
  DONGIA float,
  SOLUONGBAN int,
  THANHTIEN float,
  TONKHO int,
)
--- STORE ----
-- bang s?n ph?m
CREATE PROC sp_insertsanpham
@MASP varchar(10),
@TENSP nvarchar(30),
@XUATXU nvarchar(20),
@SOLUONG int,
@DONGIA float,
@SOLUONGBAN int,
@THANHTIEN float,
@TONKHO int
AS
INSERT INTO SANPHAM (MASP,TENSP,XUATXU,SOLUONG,DONGIA,SOLUONGBAN,THANHTIEN,TONKHO) VALUES (@MASP,@TENSP,@XUATXU,@SOLUONG,@DONGIA,@SOLUONGBAN,@THANHTIEN,@TONKHO)
GO

CREATE PROC sp_updatesanpham
@MASP varchar(10),
@TENSP nvarchar(30),
@XUATXU nvarchar(20),
@SOLUONG int,
@DONGIA float,
@SOLUONGBAN int,
@THANHTIEN float,
@TONKHO int
AS
UPDATE SANPHAM SET TENSP=@TENSP,XUATXU=@XUATXU,SOLUONG=@SOLUONG,DONGIA=@DONGIA,SOLUONGBAN=@SOLUONGBAN,THANHTIEN=@THANHTIEN,TONKHO=@TONKHO WHERE MASP=@MASP
GO

CREATE PROC sp_searchsanpham
@TENSP nvarchar(30)
AS
SELECT * FROM SANPHAM WHERE TENSP LIKE '%' + @TENSP + '%'
GO

CREATE PROC sp_deletesanpham
@MASP varchar(10)
AS
DELETE SANPHAM WHERE MASP=@MASP
GO

CREATE PROC sp_loaddulieusanpham
AS
SELECT * FROM SANPHAM
GO

--Tao bang hóa don--
CREATE TABLE HOADON
(
  MAHD varchar(10) PRIMARY KEY,
  MAKH varchar(10),
  MANV varchar(10),
  NGAYHD date, 
  TONGTIEN float,
)
-- bang hóa don
CREATE PROC sp_inserthoadon
@MAHD varchar(10),
@MAKH  varchar(10),
@MANV  varchar(10),
@NGAYHD date,
@TONGTIEN float
AS
INSERT INTO HOADON (MAHD,MAKH,MANV,NGAYHD,TONGTIEN) VALUES (@MAHD,@MAKH,@MANV,@NGAYHD,@TONGTIEN)
GO

CREATE PROC sp_updatehoadon
@MAHD varchar(10),
@MAKH  varchar(10),
@MANV  varchar(10),
@NGAYHD date,
@TONGTIEN float
AS
UPDATE HOADON SET MAKH=@MAKH,MANV=@MANV,NGAYHD=@NGAYHD,TONGTIEN=@TONGTIEN WHERE MAHD=@MAHD
GO

CREATE PROC sp_deletehoadon
@MAHD  varchar(10)
AS
DELETE HOADON WHERE MAHD=@MAHD
GO

CREATE PROC sp_searchhoadon
@MAHD  varchar(10)
AS
SELECT * FROM HOADON WHERE MAHD=@MAHD
GO


CREATE PROC sp_loaddulieuhoadon
AS
SELECT * FROM HOADON
GO

--TAo bAng chi tiết hóa don----
CREATE TABLE CTHD
(
  MAHD varchar(10),
  MASP varchar(10),
  SOLUONG int,
  DONGIA float,
  THANHTIEN float,
)
----STORE----
-- bang công thUc hóa don
CREATE PROC sp_insertchitiethoadon
@MAHD varchar(10),
@MASP varchar(10),
@SOLUONG int,
@DONGIA float,
@THANHTIEN float
AS
INSERT INTO CTHD (MAHD,MASP,SOLUONG,DONGIA,THANHTIEN) VALUES (@MAHD,@MASP,@SOLUONG,@DONGIA,@THANHTIEN)
GO

CREATE PROC sp_updatechitiethoadon
@MAHD varchar(10),
@MASP varchar(10),
@SOLUONG int,
@DONGIA float,
@THANHTIEN float
AS
UPDATE CTHD SET MASP=@MASP,SOLUONG=@SOLUONG,DONGIA=@DONGIA,THANHTIEN=@THANHTIEN WHERE MAHD=@MAHD
GO

CREATE PROC sp_deletechitiethoadon
@MAHD varchar(10)
AS
DELETE CTHD WHERE MAHD=@MAHD
GO

CREATE PROC sp_searchchitiethoadon
@MAHD varchar(10)
AS
DELETE CTHD WHERE MAHD LIKE '%' + @MAHD + '%'
GO

CREATE PROC sp_loadchitiethoadon
AS
SELECT * FROM CTHD
GO

--tao bang chuc vu--
CREATE TABLE CHUCVU
(
  MACV varchar(10)PRIMARY KEY,
  TENCHUCVU varchar(30),
)
-----STORE----
-- bảng chức vụ
CREATE PROC sp_insertchucvu
  @MACV varchar(10),
  @TENCHUCVU varchar(30)
AS
INSERT INTO CHUCVU (MACV,TENCHUCVU) VALUES (@MACV,@TENCHUCVU)
GO

CREATE PROC sp_updatechucvu
  @MACV varchar(10),
  @TENCHUCVU varchar(30)
AS
UPDATE CHUCVU SET TENCHUCVU=@TENCHUCVU WHERE MACV=@MACV
GO

CREATE PROC sp_deletechucvu
  @MACV varchar(10)
AS
DELETE CHUCVU WHERE MACV=@MACV
GO

CREATE PROC sp_loaddulieuchucvu
AS
SELECT * FROM CHUCVU
GO
--Tao bang khu vuc----
CREATE TABLE KHUVUC
(
  MAKV	varchar(10)PRIMARY KEY,
  TENKV varchar(50),
  SDT nvarchar(10),
  DIACHI nvarchar(50),
)
----STORE----
-- bảng khu vuc
CREATE PROC sp_insertkhuvuc
  @MAKV	varchar(10),
  @TENKV varchar(50),
  @SDT nvarchar(10),
  @DIACHI nvarchar(50)
AS
INSERT INTO KHUVUC (MAKV,TENKV,SDT,DIACHI) VALUES (@MAKV,@TENKV,@SDT,@DIACHI)
GO

CREATE PROC sp_updatekhuvuc
  @MAKV	varchar(10),
  @TENKV varchar(50),
  @SDT nvarchar(10),
  @DIACHI nvarchar(50)
AS
UPDATE KHUVUC SET TENKV=@TENKV,SDT=@SDT,DIACHI=@DIACHI WHERE MAKV=@MAKV
GO

CREATE PROC sp_deletekhuvuc
  @MAKV	varchar(10)
AS
DELETE KHUVUC WHERE MAKV=@MAKV
GO

CREATE PROC sp_loaddulieukhuvuc
AS
SELECT * FROM KHUVUC
GO


 ---- Tao bang doanh thu ----
CREATE TABLE DOANHTHU
(
	MAKV varchar(10),
	THANHTIEN float,
	DOANHTHU float,	
)

CREATE PROC sp_loaddulieudoanhthu
AS
SELECT * FROM DOANHTHU
GO

-----tao khoa ngoai bang doi mat khau
ALTER TABLE DOIMATKHAU
ADD CONSTRAINT FK_DOIMATKHAU_TAIKHOAN_Taikhoan FOREIGN KEY (Taikhoan) REFERENCES TAIKHOAN(Taikhoan)
---tao khóa ngoai cho bang nhân viên-----
ALTER TABLE NHANVIEN
ADD CONSTRAINT FK_NHANVIEN_CHUCVU_MACV FOREIGN KEY (MACV) REFERENCES CHUCVU(MACV)

ALTER TABLE NHANVIEN
ADD CONSTRAINT FK_NHANVIEN_KHUVUC_MAKV FOREIGN KEY (MAKV) REFERENCES KHUVUC(MAKV)

---tao khóa ngoai cho bang hóa don-----
ALTER TABLE HOADON
ADD CONSTRAINT FK_HOADON_KHACHHANG_MAKH FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH)

ALTER TABLE HOADON
ADD CONSTRAINT FK_HOADON_NHANVIEN_MANV FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV)

---tao khóa ngoai cho bang công thuc hóa don hóa don-----

ALTER TABLE CTHD
ADD CONSTRAINT FK_CTHD_SANPHAM_MASP FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP)

ALTER TABLE CTHD
ADD CONSTRAINT FK_CTHD_HOADON_MAHD FOREIGN KEY (MAHD) REFERENCES HOADON(MAHD)

---
ALTER TABLE DOANHTHU
ADD CONSTRAINT FK_DOANHTHU_KHUVUC_MAKV FOREIGN KEY (MAKV) REFERENCES KHUVUC(MAKV)

