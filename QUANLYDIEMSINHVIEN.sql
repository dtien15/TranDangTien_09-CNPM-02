Create Database QLDSV go
Use QLDSV
go
-- Tao Bang Mon Hoc --
Create Table MonHoc (
MaMH char(5) primary key, 
TenMH nvarchar(30) not null,
SoTin int not null check ( (SoTin>0)and (SoTin<7) )
)
--- Tao Bang He Dao Tao ---
Create Table HeDT (
MaHeDT char(5) primary key, 
TenHeDT nvarchar(40) not null
)
--- Tao Bang Khoa Hoc ---
Create Table KhoaHoc (
MaKhoaHoc char(5) primary key, 
TenKhoaHoc nvarchar(20) not null
)
--- Tao Bang Khoa --
Create Table Khoa (
MaKhoa char(5) primary key, 
TenKhoa nvarchar(30) not null, 
DiaChi nvarchar(100) not null, 
DienThoai varchar(20) not null
)
-- Tao Bang Lop ---
Create Table Lop (
MaLop char(5) primary key, 
TenLop nvarchar(30) not null,
MaKhoa char(5) foreign key references Khoa (MaKhoa), 
MaHeDT char(5) foreign key references HeDT (MaHeDT),
MaKhoaHoc char(5) foreign key references KhoaHoc (MaKhoaHoc)
)
--- Tao Bang Sinh Vien ---
Create Table SinhVien (
MaSV char(15) primary key, 
TenSV nvarchar(20) , 
GioiTinh bit ,
NgaySinh datetime , 
QueQuan nvarchar(50) ,
MaLop char(5) foreign key references Lop(MaLop)
)
--- Tao Bang Diem ---
Create Table Diem (
MaSV char(15) foreign key references SinhVien(MaSV), 
MaMH char(5) foreign key references MonHoc (MaMH), 
LanHoc int check(LanHoc>0) not null,
DiemLan1 int, 
DiemLan2 int
)


--- Tao login
CREATE LOGIN [AdminQLDSV] WITH PASSWORD = '123'
USE [QLDSV]
CREATE USER [Admin] FOR LOGIN [AdminQLDSV]

DROP LOGIN AdminQLDSV;

---inssert
--- Bang  He  Dao  Tao  -- 
insert  into  HeDT  values('A01',N'Ðại  Học') 
insert  into  HeDT  values('B01',N'Cao  Ðẳng') 
insert  into  HeDT  values('C01',N'Trung  Cấp') 
insert  into  HeDT  values('D01',N'Cao  Hoc')
--  Bang  Ma  Khoa  Hoc  ---
insert  into  KhoaHoc  values('K1',N'Ðại  học  khóa  1') 
insert  into  KhoaHoc  values('K2',N'Ðại  học  khóa  2') 
insert  into  KhoaHoc  values('K3',N'Ðại  học  khóa  3') 
insert  into  KhoaHoc  values('K9',N'Ðại  học  khóa  4') 
insert  into  KhoaHoc  values('K10',N'Ðại  học  khóa  5') 
insert  into  KhoaHoc  values('K11',N'Ðại  học  khóa  6') 
insert  into  KhoaHoc  values('K1',N'Cao  đẳng  khóa  1') 
insert  into  KhoaHoc  values('K2',N'Cao  đẳng  khóa  2') 
insert  into  KhoaHoc  values('K3',N'Cao  đẳng  khóa  3') 
insert  into  KhoaHoc  values('K9',N'Cao  đẳng  khóa  4') 
insert  into  KhoaHoc  values('K10',N'Cao  đẳng  khóa  5') 
insert  into  KhoaHoc  values('K11',N'Cao  đẳng  khóa  6') 
insert  into  KhoaHoc  values('K1',N'Trung  cấp  khóa  1') 
insert  into  KhoaHoc  values('K2',N'Trung  cấp  khóa  2') 
insert  into  KhoaHoc  values('K3',N'Trung  cấp  khóa  3') 
insert  into  KhoaHoc  values('K1',N'Cao  học  khóa  1') 
insert  into  KhoaHoc  values('K2',N'Cao  học  khóa  2')
--  Bang  Khoa  --
insert  into  Khoa  values('CNTT',N'Công  nghệ  thông  tin',N'Tầng  4  nhà  B','0950080000') 
insert  into  Khoa  values('TM',N'Truyền  thông  mạng  máy  tính',N'Tầng  5  nhà B','0950080011')
insert  into  Khoa  values('DT',N'Ðiện  tử',N'Tằng  6  nhà  B','0950080022')
insert  into  Khoa  values('HT',N'Hệ  thống  thông  tin',N'Tằng  3  nhà  B','0950080033')
---  Bang  Lop  --
insert  into  Lop  values('MT1',N'Máy  Tính  1','CNTT','A01','K2') 
insert  into  Lop  values('MT2',N'Máy  Tính  2','CNTT','A01','K2') 
insert  into  Lop  values('MT3',N'Máy  Tính  3','CNTT','A01','K2') 
insert  into  Lop  values('MT4',N'Máy  Tính  4','CNTT','A01','K2') 
insert  into  Lop  values('HT1',N'Hệ  thống  1','HT','A01','K2') 
insert  into  Lop  values('HT2',N'Hệ  thống  2','HT','A01','K2') 
insert  into  Lop  values('HT3',N'Hệ  thống  3','HT','A01','K2') 
insert  into  Lop  values('HT4',N'Hệ  thống  4','HT','A01','K2') 
insert  into  Lop  values('DT1',N'Điện  tử  1','DT','A01','K2')
insert  into  Lop  values('DT2',N'Điện  tử  2','DT','A01','K2')
insert  into  Lop  values('DT3',N'Điện  tử  3','DT','A01','K2')
insert  into  Lop  values('DT4',N'Điện  tử  4','DT','A01','K2') 
insert  into  Lop  values('TM1',N'Truyền  thông  1','TM','A01','K2') 
insert  into  Lop  values('TM2',N'Truyền  thông  2','TM','A01','K2') 
insert  into  Lop  values('TM3',N'Truyền  thông  3','TM','A01','K2') 
insert  into  Lop  values('TM4',N'Truyền  thông  4','TM','A01','K2')
--  Bang  Sinh  Vien  --
insert  into  SinhVien  values('sv1',N'Trần Đăng Tiến',1,'08/27/1989','Khanh Hoa','MT3')
insert  into  SinhVien  values('sv2',N'Dương Hồng Phong',1,'2/08/1989','Dong Thap','MT1')
insert  into  SinhVien  values('sv3',N'Từ Hữu Trung',1,'7/04/1989','Dong Nai','MT2')
insert  into  SinhVien  values('sv4',N'Nguyễn Văn A',1,'7/08/1989','Ho Chi Minh','MT1')
insert  into  SinhVien  values('sv5',N'Nguyễn Văn B',0,'7/08/1989','Ha Noi','MT3')
insert  into  SinhVien  values('sv6',N'Nguyễn Văn C',1,'7/08/1989','Ho Chi Minh','MT3') 
insert  into  SinhVien  values('sv7',N'Nguyễn Văn D',1,'7/08/1989','Ho Chi Minh','MT3') 
insert  into  SinhVien  values('sv8',N'Nguyễn Văn E',1,'7/08/1989','Dong Thap','MT2')
insert  into  SinhVien  values('sv9',N'Nguyễn Văn F',1,'7/08/1989','Dong Thap','MT2')
insert  into  SinhVien  values('sv10',N'Nguyễn Văn G',1,'7/08/1989','Khanh Hoa','MT2')
insert  into  SinhVien  values('sv11',N'Nguyễn Văn H',0,'7/08/1989','Dong Nai','MT4')
insert  into  SinhVien  values('sv12',N'Nguyễn Văn J',0,'7/08/1989','Ho Chi Minh','MT4')
insert  into  SinhVien  values('sv13',N'Nguyễn Văn K',1,'7/08/1989','Dong Nai','MT4')
insert  into  SinhVien  values('sv14',N'Nguyễn Văn L',1,'7/08/1989','Dong Nai','MT1')
insert  into  SinhVien  values('sv15',N'Nguyễn Văn Q',1,'7/08/1989','Dong Nai','DT1')
--  Bang  Mon  Hoc  --
insert  into  MonHoc  values('mh1',N'SQL',5) 
insert  into  MonHoc  values('mh2',N'Java',6)
insert  into  MonHoc  values('mh3',N'Công  Nghệ  phần  mềm',4) 
insert  into  MonHoc  values('mh4',N'Phân  tích  hệ  thống',4) 
insert  into  MonHoc  values('mh5',N'Mạng  máy  tính',5) 
insert  into  MonHoc  values('mh6',N'Chương  trình  dịch',4) 
insert  into  MonHoc  values('mh7',N'Trí  tuệ  nhân  tạo',4) 
insert  into  MonHoc  values('mh8',N'Lập  trình  C#',5) 
insert  into  MonHoc  values('mh9',N'Nhập  môn  CSDL',4) 
insert  into  MonHoc  values('mh10',N'Mạng  máy  tính',5) 
insert  into  MonHoc  values('mh11',N'Quản  trị  mạng',4)
insert  into  MonHoc  values('mh12',N'Giao  thông  thông  minh',5) 
insert  into  MonHoc  values('mh13',N'Lập  trình  hướng  đối  tượng',5) 
insert  into  MonHoc  values('mh14',N'Điện  toán  đám  mây',3)
insert  into  MonHoc  values('mh15',N'An  ninh  mạng',5)
--  Bang  Diem  --
insert  into  Diem(MaSV,MaMH,LanHoc,DiemLan1)  values('sv1','mh1',1,7)
insert  into  Diem(MaSV,MaMH,LanHoc,DiemLan1)  values('sv2','mh1',1,6) 
insert  into  Diem(MaSV,MaMH,LanHoc,DiemLan1)  values('sv3','mh3',1,8)
insert  into  Diem(MaSV,MaMH,LanHoc,DiemLan1,  DiemLan2)values('sv4','mh4',1,4,6) 
insert  into  Diem(MaSV,MaMH,LanHoc,DiemLan1,  DiemLan2)values('sv5','mh3',1,4,5) 
insert  into  Diem(MaSV,MaMH,LanHoc,DiemLan1,  DiemLan2)values('sv6','mh6',1,4,4) 
insert  into  Diem(MaSV,MaMH,LanHoc,DiemLan1,  DiemLan2)  values('sv7','mh14',2,4,6) 
insert  into  Diem(MaSV,MaMH,LanHoc,DiemLan1,  DiemLan2)values('sv8','mh2',2,2,5) 
insert  into  Diem(MaSV,MaMH,LanHoc,DiemLan1)  values('sv9','mh1',3,9)
insert  into  Diem(MaSV,MaMH,LanHoc,DiemLan1)  values('sv10','mh1',1,8)
insert  into  Diem(MaSV,MaMH,LanHoc,DiemLan1,  DiemLan2)values('sv12','mh14',2,3,4) 
insert  into  Diem(MaSV,MaMH,LanHoc,DiemLan1,  DiemLan2)  values('sv11','mh7',3,4,4) 
insert  into  Diem(MaSV,MaMH,LanHoc,DiemLan1)  values('sv13','mh8',1,8)
insert  into  Diem(MaSV,MaMH,LanHoc,DiemLan1,  DiemLan2)values('sv14','mh4',4,2,2) 
insert  into  Diem(MaSV,MaMH,LanHoc,DiemLan1)  values('sv4','mh8',2,8)
insert  into  Diem(MaSV,MaMH,LanHoc,DiemLan1)  values('sv2','mh6',4,9)

---upadate
UPDATE SinhVien
SET QueQuan = 'Ho Chi Minh';

--Store procedure 
create procedure themSV
@Masv char(15), @Tensv nvarchar(20), @gioitinh bit, @ngaysinh datetime,
@quequan nvarchar(50), @malop char(5)
as begin
insert into sinhvien values(@Masv,@Tensv,@gioitinh,@ngaysinh,@quequan,@malop)
end
-- thêm sv
themSV 'sv17',N'Nguyễn Văn Tèo',1,'4/3/2002','Khanh Hoa','DT1'
go
select * from sinhvien
--sua 
create procedure suaSV (
@MASV char(15), @TENSV nvarchar(20), @GIOITINH bit, @NGAYSINH DATETIME,
@QUEQUAN nvarchar(50), @MALOP char(5)
)
as
update SINHVIEN set
MASV=@MASV, TENSV=@TENSV,
GIOITINH=@GIOITINH, NGAYSINH=@NGAYSINH, QUEQUAN=@QUEQUAN,
MALOP=@MALOP
where MASV=@MASV
--- Sửa sv có mã sinh viên 'sv17'
suaSV 'sv17','Chí Phèo',1,'3/3/2002','HCM','MT2'
select * from SINHVIEN


create procedure xoaSV 
    @MaSV char(15)
as
begin
    -- Xóa các bản ghi trong bảng Diem liên quan đến sinh viên cần xóa
    delete from Diem
    where MaSV = @MaSV;
    -- Xóa bản ghi trong bảng SinhVien
    delete from SinhVien
    where MaSV = @MaSV;
end
-- Xóa sv có msv: sv17
xoaSV 'sv17' select * from sinhvien

create procedure hienthiSV as
select * from SINHVIEN
-- Hiển thị bản sinh viên
hienthiSV
create PROCEDURE themLOP (
@MALOP char(5),@TENLOP nvarchar(30), @MAKHOA CHAR(5), @MaHeDT CHAR(5),@MaKhoaHoc CHAR(5)
) 
AS
BEGIN
insert into LOP (
MALOP, TENLOP, MAKHOA,MaHeDT,MaKhoaHoc)
values (@MALOP,@TENLOP,@MAKHOA,@MaHeDT,@MaKhoaHoc) END
--Them lop
themLOP 'TM6',N'Truyền thông và mạng máy tính','TM','A01','K2'
select * from LOP
create procedure suaLOP (
@MALOP char(5), @TENLOP nvarchar(30), @MAKHOA CHAR(5), @MaHeDT CHAR(5),
@MaKhoaHoc CHAR(5)
)
as

update LOP set
MALOP=@MALOP, TENLOP=@TENLOP,
MAKHOA=@MAKHOA,
MaHeDT=@MaHeDT,
MaKhoaHoc=@MaKhoaHoc where MALOP=@MALOP
--- Sửa lớp có mã lớp 'TM6'
suaLOP 'TM6',N'Hệ quản trị cơ sở dữ liệu','TM','A01','K2'
select * from LOP
-----
create procedure xoaLOP 
@MALOP char(5)
as
delete from LOP where MALOP=@MALOP
--  xoa lop TM6
xoaLOP 'TM6'
select * from LOP
--hien thi
create proc hienthiLOP as
select * from LOP

hienthiLOP
---them mon
create PROCEDURE themMONHOC (
@MaMH char(5), @TenMH nvarchar(30), @SoTin INT
) AS
BEGIN
insert into MonHoc(
MAMH, TENMH, SOTIN
)
values (@MAMH,@TENMH,@SOTIN) END
--Them monhoc mh16
themMONHOC 'mh16',N'Hệ quản trị cơ sở dữ liệu',4
select * from MonHoc
---sua mon
create procedure suaMONHOC (
@MaMH char(5), @TenMH nvarchar(30), @SoTin INT
)
as
update MonHoc set
MAMH=@MAMH, TENMH=@TENMH,
SOTIN=@SOTIN
where MAMH=@MAMH
--- Sửa môn học có mã 'mh16'
suaMONHOC 'mh16',N'Hệ quản trị cơ sở dữ liệu nâng cao', 5
select * from MonHoc
--xoa
create procedure xoaMONHOC @MAMH char(5)
as
delete from MonHoc where MAMH=@MAMH

xoaMONHOC 'mh16'
select * from MonHoc
--hoen thi
create proc hienthiMONHOC as
select * from MonHoc

hienthiMONHOC
---them khoa
create PROCEDURE themKHOAHOC (
@MaKhoaHoc char(5),
@TenKhoaHoc nvarchar(20)
)
AS BEGIN
insert into KhoaHoc(
MaKhoaHoc, TenKhoaHoc
)
values (@MaKhoaHoc,@TenKhoaHoc) END
--Them khoa hoc k7
themKHOAHOC 'K7',N'Đại học khóa 7'
select * from KhoaHoc
--sua khoa
create procedure suaKHOAHOC (
@MaKhoaHoc char(5), @TenKhoaHoc nvarchar(20)
)
as
update KhoaHoc set
MaKhoaHoc=@MaKhoaHoc,
TenKhoaHoc=@TenKhoaHoc where MaKhoaHoc=@MaKhoaHoc
--- Sửa khóa học mã k7
suaKHOAHOC 'k7',N'Đại học khóa 10'
select * from KhoaHoc
---xoa
create procedure xoaKHOAHOC @MaKhoaHoc char(5)
as
delete from KhoaHoc
where MaKhoaHoc=@MaKhoaHoc
-- Xóa khóa mã k7
xoaKHOAHOC 'k7'
select * from KhoaHoc
---hein thi
create proc hienthiKHOAHOC as
select * from KhoaHoc

hienthiKHOAHOC
------------funtion
create function layDiemSV (@MaSV char(15), @MaMH char(5))
RETURNS TABLE 
AS
RETURN 
(
    SELECT DiemLan1, DiemLan2
    FROM Diem
    WHERE MaSV = @MaSV AND MaMH = @MaMH
)
-- lấy điểm sv mã sv 'sv1' mã môn học 'mh1'
SELECT * FROM layDiemSV('sv4', 'mh4')
----laySinhVien
create function laySinhVienLop (@MaLop char(5))
RETURNS TABLE 
AS
RETURN 
(
    SELECT MaSV, TenSV, GioiTinh, NgaySinh, QueQuan
    FROM SinhVien
    WHERE MaLop = @MaLop
)
-- lấy thông tin  sv có mã lớp Mt4
SELECT * FROM laySinhVienLop('MT4')
----
CREATE FUNCTION LayDanhSachMonHoc (@MaSV char(15))
RETURNS TABLE 
AS
RETURN 
(
    SELECT MonHoc.MaMH, MonHoc.TenMH, Diem.LanHoc, Diem.DiemLan1, Diem.DiemLan2
    FROM Diem
    INNER JOIN MonHoc ON Diem.MaMH = MonHoc.MaMH
    WHERE Diem.MaSV = @MaSV
)
--lấy danh sách môn học của sinh viên có mã sv2
SELECT * FROM LayDanhSachMonHoc('sv2')
-----Trigger
CREATE  TRIGGER  [dbo].[trginsertDiem] on  [dbo].[Diem]
for  INSERT as
declare  @DiemLan1  int declare  @DiemLan2  int
SELECT  @DiemLan1=Inserted.DiemLan1,@DiemLan2=Inserted.DiemLan2 FROM  Inserted
IF  (@DiemLan1  is  null)  or  (@DiemLan1  >=  6) begin
print  'Ban  khong  duoc  nhap  diem  lan  2' Rollback  transaction
END
else
IF  (@DiemLan1  <  0  )  or  (@DiemLan1  >  10)  or  (@DiemLan2  <  0)  or  (@DiemLan2  >  10) begin
print  'Sai  gia  tri  diem' Rollback  transaction   end
else
begin
Print  'qua  trinh  chen  dl  thanh  cong' end
Go
-- Kiểmm tra
INSERT  INTO  Diem  VALUES  ('sv15','mh2',5,14,8) 
INSERT  INTO  Diem  VALUES  ('sv1','mh2',5,-2,8) 
INSERT  INTO  Diem  VALUES  ('sv3','mh5',5,8,8) 
INSERT  INTO  Diem  VALUES  ('sv6','mh3',5,12,24) 
INSERT  INTO  Diem  VALUES  ('sv11','mh7',5,12,24)
Go
SELECT * FROM Diem
---trigger
CREATE TRIGGER trginsert_MonHoc
ON dbo.MonHoc FOR INSERT AS
BEGIN
DECLARE @MaMH CHAR(5)
DECLARE @TenMH NVARCHAR(30) DECLARE @SoTin INT
SELECT @MaMH = Inserted.MaMH, @TenMH = Inserted.TenMH, @SoTin = Inserted.SoTin
FROM Inserted
IF(@MaMH IS NULL OR @TenMH IS NULL OR @SoTin IS NULL) BEGIN
PRINT'Ban phai dien day du thong tin' PRINT'Them du lieu khong thanh cong' ROLLBACK TRAN
END ELSE BEGIN
PRINT'Them du lieu thanh cong'
END
END
--Kiểm tra
INSERT  INTO  MonHoc  VALUES  ('mh19','hệ quản trị cơ sở dữ liệu',2) 
------view
--Danh  sách  sinh  viên  lớp  MT1
CREATE VIEW  DsSVLopMT1
AS
SELECT  MaSV,  TenSV  FROM  dbo.SinhVien  WHERE  MaLop  =  'MT1'
--kết quả
SELECT * FROM  DsSVLopMT1
--
CREATE  VIEW  DsSVGioi
AS
SELECT  MaSV,  DiemLan1  FROM  dbo.Diem WHERE  LanHoc  =  1  AND  DiemLan1  >=8
--Kết  quả
SELECT * FROM  DsSVGioi
---
--Danh  sách  các  khoa 
CREATE  VIEW  DsKhoa 
AS
SELECT  MaKhoa,  TenKhoa  FROM  dbo.Khoa
--Kết  quả
SELECT * FROM  DsKhoa
---
--Danh  sách  các  lớp  trong  trường 
CREATE  VIEW  DsLop
AS
SELECT  MaLop,  TenLop  FROM  lop
--Kết  quả
SELECT * FROM  DsLop
