CREATE DATABASE QuanLyDeAn
ON PRIMARY
  (NAME = QuanLyDeAn_Data,
   FILENAME = 'D:\HoTenSV\QuanLyDeAn_Data.mdf',
   SIZE = 20MB,
   MAXSIZE = 1000MB,
   FILEGROWTH = 1MB)
LOG ON
  (NAME = QuanLyDeAn_Log,
   FILENAME = 'D:\HoTenSV\QuanLyDeAn_Log.ldf',
   SIZE = 6MB,
   MAXSIZE = 20MB,
   FILEGROWTH = 5%);
 
USE QuanLyDeAn;
GO
CREATE TABLE PHANCONG (
  MaNV varchar(9) NOT NULL,
  MaDA varchar(2) NOT NULL,
  ThoiGian numeric(18,0) NULL,
  PRIMARY KEY (MaNV, MaDA)
);

CREATE TABLE NHANVIEN (
  MaNV varchar(9) PRIMARY KEY,
  HoNV nvarchar(50) NULL,
  TenLot nvarchar(30) NULL,
  TenNV nvarchar(30) NULL,
  NgSinh smalldatetime NULL,
  DiaChi nvarchar(150) NULL,
  Phai nvarchar(3) NULL,
  Luong numeric(18,0) NULL,
  Phong varchar(2)NULL
);

CREATE TABLE DEAN (
  MaDA varchar(2) PRIMARY KEY,
  TenDa nvarchar(50) NULL,
  DDiemDA varchar(20) NULL
);

CREATE TABLE PHONGBAN (
	MaPhg  varchar(2) PRIMARY KEY,
	TenPhg nvarchar(20) NULL
);

CREATE TABLE THANNHAN (
	MaNV VARCHAR(9) PRIMARY KEY,
	TenTN VARCHAR(20) PRIMARY KEY,
	NgaySinh smalldatetime NULL,
	Phai VARCHAR(3) NULL,
	QuanHe VARCHAR(15) NULL
);

/** **/

ALTER TABLE PHONGBAN
ALTER COLUMN TenPhg nvarchar(30);

/** **/

ALTER TABLE DEAN
ALTER COLUMN DDiemDA nvarchar(20);

/** **/

ALTER TABLE THANNHAN
ALTER COLUMN TenTN nvarchar(20),
ALTER COLUMN Phai nvarchar(3),
ALTER COLUMN QuanHe nvarchar(15);

BEGIN /** NHANVIEN **/
	ALTER TABLE NHANVIEN
	NOCHECK CONSTRAINT ALL
	INSERT INTO NHANVIEN (MaNV, HONV, TenLot, TenNV, NgSinh, DiaChi, PHAI, LUONG, Phong)
	VALUES (123, N'Đinh', N'Bá', N'Tiến', '27/02/1982', N'Mộ Đức', N'Nam', null, 4)
	INSERT INTO NHANVIEN (MaNV, HONV, TenLot, TenNV, NgSinh, DiaChi, PHAI, LUONG, Phong)
	VALUES (234, N'Nguyễn', N'Thanh', N'Tùng', '12/08/1956', N'Sơn Tịnh', N'Nam', null, 5)
	INSERT INTO NHANVIEN (MaNV, HONV, TenLot, TenNV, NgSinh, DiaChi, PHAI, LUONG, Phong)
	VALUES (345, N'Bùi', N'Thúy', N'Vũ', null, N'Tư Nghĩa', N'Nữ', null, 4)
	INSERT INTO NHANVIEN (MaNV, HONV, TenLot, TenNV, NgSinh, DiaChi, PHAI, LUONG, Phong)
	VALUES (345, N'Lê', N'Thị', N'Nhân', '12/07/1962', N'Mộ Đức', N'Nữ', null, 4)
	INSERT INTO NHANVIEN (MaNV, HONV, TenLot, TenNV, NgSinh, DiaChi, PHAI, LUONG, Phong)
	VALUES (567, N'Nguyễn', N'Mạnh', N'Hùng', '25/03/1985', N'Sơn Tịnh', N'Nam', null, 5)
	INSERT INTO NHANVIEN (MaNV, HONV, TenLot, TenNV, NgSinh, DiaChi, PHAI, LUONG, Phong)
	VALUES (678, N'Trần', N'Hồng', N'Quang', null, N'Bình Sơn', N'Nam', null, 5)
	INSERT INTO NHANVIEN (MaNV, HONV, TenLot, TenNV, NgSinh, DiaChi, PHAI, LUONG, Phong)
	VALUES (789, N'Trần', N'Thanh', N'Tâm', '17/06/1972', N'TP Quảng Ngãi', N'Nam', null, 5)
	INSERT INTO NHANVIEN (MaNV, HONV, TenLot, TenNV, NgSinh, DiaChi, PHAI, LUONG, Phong)
	VALUES (890, N'Cao', N'Thanh', N'Huyền', null, N'Tư Nghĩa', N'Nữ', null, 1)
	INSERT INTO NHANVIEN (MaNV, HONV, TenLot, TenNV, NgSinh, DiaChi, PHAI, LUONG, Phong)
	VALUES (901, N'Vương', N'Ngọc', N'Huyền', '12/12/1982', N'Mộ Đức', N'Nam', null, 1)
	ALTER TABLE NHANVIEN
	CHECK CONSTRAINT ALL
END

BEGIN /** PHONGBAN **/
	ALTER TABLE PHONGBAN
	NOCHECK CONSTRAINT ALL
	INSERT INTO PHONGBAN (MaPhg, TenPhg)
	VALUES (1, N'Quản lý')
	INSERT INTO PHONGBAN (MaPhg, TenPhg)
	VALUES (4, N'Điều hành')
	INSERT INTO PHONGBAN (MaPhg, TenPhg)
	VALUES (5, N'Nghiên cứu')
	ALTER TABLE PHONGBAN
	CHECK CONSTRAINT ALL
END

BEGIN /** DEAN **/
	ALTER TABLE DEAN
	NOCHECK CONSTRAINT ALL
	INSERT INTO DEAN (TENDA, DDIEM_DA)
	VALUES (1, N'Nâng cao chất lượng muối', N'Sa Huỳnh')
	INSERT INTO DEAN (TENDA, DDIEM_DA)
	VALUES (10, N'Xây dựng nhà máy chế biến thủy sản', N'Dung Quất')
	INSERT INTO DEAN (TENDA, DDIEM_DA)
	VALUES (2, N'Phát triển hạ tầng mạng', N'TP Quảng Ngãi')
	INSERT INTO DEAN (TENDA, DDIEM_DA)
	VALUES (20, N'Truyền tải cáp mạng', N'TP Quảng Ngãi')
	INSERT INTO DEAN (TENDA, DDIEM_DA)
	VALUES (3, N'Tin học hoâ môi trường', N'Ba Tơ')
	INSERT INTO DEAN (TENDA, DDIEM_DA)
	VALUES (30, N'Đào tạo nhân lực', N'Tịnh Phong')
	ALTER TABLE DEAN
	CHECK CONSTRAINT ALL
END



BEGIN /** PHANCONG **/
	ALTER TABLE PHANCONG
	NOCHECK CONSTRAINT ALL
	INSERT INTO PHANCONG (MaNV, MaDA, ThoiGian)
	VALUES (123, 1, 33)
	INSERT INTO PHANCONG (MaNV, MaDA, ThoiGian)
	VALUES (123, 2, 8)
	INSERT INTO PHANCONG (MaNV, MaDA, ThoiGian)
	VALUES (345, 10, 10)
	INSERT INTO PHANCONG (MaNV, MaDA, ThoiGian)
	VALUES (345, 20, 10)
	INSERT INTO PHANCONG (MaNV, MaDA, ThoiGian)
	VALUES (345, 3, 10)
	INSERT INTO PHANCONG (MaNV, MaDA, ThoiGian)
	VALUES (456, 1, 20)
	INSERT INTO PHANCONG (MaNV, MaDA, ThoiGian)
	VALUES (456, 2, 20)
	INSERT INTO PHANCONG (MaNV, MaDA, ThoiGian)
	VALUES (678, 3, 40)
	INSERT INTO PHANCONG (MaNV, MaDA, ThoiGian)
	VALUES (789, 10, 35)
	INSERT INTO PHANCONG (MaNV, MaDA, ThoiGian)
	VALUES (789, 20, 30)
	INSERT INTO PHANCONG (MaNV, MaDA, ThoiGian)
	VALUES (789, 30, 5)
	ALTER TABLE PHANCONG
	CHECK CONSTRAINT ALL
END



BEGIN /** THANNHAN **/
	ALTER TABLE THANNHAN
	NOCHECK CONSTRAINT ALL
	INSERT INTO THANNHAN (MaNV, TenTN, NgSinh, Phai, QuanHe)
	VALUES (123, N'Châu', '30/10/2005', N'Nữ', N'Con gái')
	INSERT INTO THANNHAN (MaNV, TenTN, NgSinh, Phai, QuanHe)
	VALUES (123, N'Duy', '25/10/2001', N'Nam', N'Con trai')
	INSERT INTO THANNHAN (MaNV, TenTN, NgSinh, Phai, QuanHe)
	VALUES (123, N'Phương', '30/10/1985', N'Nữ', N'Vợ chồng')
	INSERT INTO THANNHAN (MaNV, TenTN, NgSinh, Phai, QuanHe)
	VALUES (234, N'Thanh', '05/04/1980', N'Nữ', N'Con gái')
	INSERT INTO THANNHAN (MaNV, TenTN, NgSinh, Phai, QuanHe)
	VALUES (345, N'Dương', '30/10/1956', N'Nam', N'Con trai')
	INSERT INTO THANNHAN (MaNV, TenTN, NgSinh, Phai, QuanHe)
	VALUES (345, N'Khang', '25/10/1982', N'Nam', N'Con trai')
	INSERT INTO THANNHAN (MaNV, TenTN, NgSinh, Phai, QuanHe)
	VALUES (456, N'Hùng', '01/01/1987', N'Nam', N'Con trai')
	INSERT INTO THANNHAN (MaNV, TenTN, NgSinh, Phai, QuanHe)
	VALUES (901, N'Thương', '05/04/1989', N'Nữ', N'Vợ chồng')
	ALTER TABLE THANNHAN
	CHECK CONSTRAINT ALL
END


USE [master]
GO
EXEC sp_detach_db @dbname = N'QuanLyDeAn', 
    @keepfulltextindexfile = N'true'
GO

