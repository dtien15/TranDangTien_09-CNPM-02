USE  QLBanHang;

-- 1. --
go
create view view_cau1 as 
SELECT * FROM Sanpham;
go

go
create view view_cau1_ as
SELECT * FROM Hangsx;
go

go
create view view_cau1_1 as
SELECT * FROM Nhanvien;
go

go
create view view_cau1_2 as
SELECT * FROM Nhap;
go

go
create view view_cau1_3 as
SELECT * FROM Xuat;
go 


-- 2.--
go 
CREATE VIEW view_cau2 AS
SELECT Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Sanpham.soluong, Sanpham.mausac, Sanpham.giaban, Sanpham.donvitinh, Sanpham.mota
FROM Sanpham
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
go
-- 3. --
go
create view view_cau3 as
SELECT Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Sanpham.soluong, Sanpham.mausac, Sanpham.giaban, Sanpham.donvitinh, Sanpham.mota
FROM Sanpham
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung'
go
-- 4.--
go
CREATE VIEW Lab2C4 AS
SELECT * FROM nhanvien
WHERE gioitinh = 'Nữ' AND phong = 'Kế toán'
go
-- 5. --
go
create view view_cau5 as
SELECT Nhap.sohdn, Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Nhap.soluongN, Nhap.dongiaN, Nhap.soluongN*Nhap.dongiaN AS tiennhap, Sanpham.mausac, Sanpham.donvitinh, Nhap.ngaynhap, Nhanvien.tennv, Nhanvien.phong
FROM Nhap
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
ORDER BY Nhap.sohdn ASC;
go
-- 6. --
go
create view view_cau6 as
SELECT Xuat.sohdx, Sanpham.masp, Sanpham.tensp, Hangsx.tenhang, Xuat.soluongX, Sanpham.giaban, 
       Xuat.soluongX*Sanpham.giaban AS tienxuat, Sanpham.mausac, Sanpham.donvitinh, Xuat.ngayxuat, 
       Nhanvien.tennv, Nhanvien.phong
FROM Xuat
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
INNER JOIN Nhanvien ON Xuat.manv = Nhanvien.manv
WHERE MONTH(Xuat.ngayxuat) = 10 AND YEAR(Xuat.ngayxuat) = 2018
ORDER BY Xuat.sohdx ASC;
go
-- 7.  --
go
create view view_cau7 as
SELECT sohdn, Sanpham.masp, tensp, soluongN, dongiaN, ngaynhap, tennv, phong
FROM Nhap 
JOIN Sanpham ON Nhap.masp = Sanpham.masp 
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
WHERE Hangsx.tenhang = 'Samsung' AND YEAR(ngaynhap) = 2017;
go
--8. --
go
create view view_cau8 as
SELECT TOP 10 Xuat.sohdx, Sanpham.tensp, Xuat.soluongX
FROM Xuat 
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
WHERE YEAR(Xuat.ngayxuat) = '2023' 
ORDER BY Xuat.soluongX DESC;
go
--9. --
go
create view view_cau9 as
SELECT TOP 10 tenSP, giaBan
FROM SanPham
ORDER BY giaBan DESC;
go
--10. --
go
CREATE VIEW view_cau10 AS
SELECT masp, tensp, tenhang, soluong, mausac, giaban, donvitinh, mota
FROM Sanpham
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung' AND Sanpham.giaban >= 100000 AND Sanpham.giaban <= 500000
go
--11 --
go
create view view_cau11 as
SELECT SUM(soluongN * dongiaN) AS tongtien
FROM Nhap
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'Samsung' AND YEAR(ngaynhap) = 2018
go
--12 --
go
create view view_cau12 as
SELECT SUM(Xuat.soluongX * Sanpham.giaban) AS Tongtien
FROM Xuat
INNER JOIN Sanpham ON Xuat.masp = Sanpham.masp
WHERE Xuat.ngayxuat = '2018-09-02'
go
--13 --
go
create view view_cau13 as
SELECT TOP 1 sohdn, ngaynhap, dongiaN
FROM Nhap
ORDER BY dongiaN DESC
go
--14 --
go
create view view_cau14 as
SELECT TOP 10 Sanpham.tensp, SUM(Nhap.soluongN) AS TongSoLuongN 
FROM Sanpham 
INNER JOIN Nhap ON Sanpham.masp = Nhap.masp 
WHERE YEAR(Nhap.ngaynhap) = 2019 
GROUP BY Sanpham.tensp 
ORDER BY TongSoLuongN DESC
go
--15 --
go
create view view_cau15 as
SELECT Sanpham.masp, Sanpham.tensp
FROM Sanpham
INNER JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
INNER JOIN Nhap ON Sanpham.masp = Nhap.masp
INNER JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
WHERE Hangsx.tenhang = 'Samsung' AND Nhanvien.manv = 'NV01';
go
--16 --
go
create view view_cau16 as
SELECT sohdn, masp, soluongN, ngaynhap
FROM Nhap
WHERE masp = 'SP02' AND manv = 'NV02'
go
--17 --
go
create view view_cau17 as
SELECT Nhanvien.manv, Nhanvien.tennv
FROM Nhanvien
INNER JOIN Xuat ON Nhanvien.manv = Xuat.manv
WHERE Xuat.masp = 'SP02' AND Xuat.ngayxuat = '2020-03-02'
go



USE [QLBanHang]
GO
SELECT * FROM view_cau1
SELECT * FROM view_cau1_
SELECT * FROM view_cau1_1
SELECT * FROM view_cau1_2
SELECT * FROM view_cau1_3
SELECT * FROM view_cau2
SELECT * FROM view_cau3
SELECT * FROM view_cau4
SELECT * FROM view_cau5
SELECT * FROM view_cau6
SELECT * FROM view_cau7
SELECT * FROM view_cau8
SELECT * FROM view_cau9
SELECT * FROM view_cau10
SELECT * FROM view_cau11
SELECT * FROM view_cau12
SELECT * FROM view_cau13
SELECT * FROM view_cau14
SELECT * FROM view_cau15
SELECT * FROM view_cau16
SELECT * FROM view_cau17
go






--lab2.2--
--câu 1
go
CREATE VIEW Lab_2_2_C_1 AS
SELECT Hangsx.tenhang, COUNT(Sanpham.masp) AS SoLuongLoaiSP
FROM Hangsx
JOIN Sanpham ON Hangsx.mahangsx = Sanpham.mahangsx
GROUP BY Hangsx.tenhang;

go
go
Select * from Lab_2_2_C_1
go
--câu 2
go
CREATE VIEW Lab_2_2_C_2 AS
SELECT Sanpham.tensp, SUM(Nhap.soluongN * Nhap.dongiaN) AS TongTienNhap
FROM Sanpham
JOIN Nhap ON Sanpham.masp = Nhap.masp
WHERE YEAR(Nhap.ngaynhap) = 2018
GROUP BY Sanpham.tensp;

go
go
Select * from Lab_2_2_C_2
go
--câu 3
go
CREATE VIEW Lab_2_2_C_3 AS
SELECT Sanpham.tensp, SUM(Xuat.soluongX) AS TongSoLuongXuat
FROM Sanpham
JOIN Xuat ON Sanpham.masp = Xuat.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE Hangsx.tenhang = 'samsung' AND YEAR(Xuat.ngayxuat) = 2018
GROUP BY Sanpham.tensp
HAVING SUM(Xuat.soluongX) > 10000

go
go
Select * from Lab_2_2_C_3
go
--câu 4
go
CREATE VIEW Lab_2_2_C_4 AS
SELECT Nhanvien.phong, COUNT(Nhanvien.manv) AS SoLuongNam
FROM Nhanvien
WHERE Nhanvien.gioitinh = 'Nam'
GROUP BY Nhanvien.phong;

go
go
Select * from Lab_2_2_C_4
go
--câu 5
go
CREATE VIEW Lab_2_2_C_5 AS
SELECT Hangsx.tenhang, SUM(Nhap.soluongN) AS TongSoLuongNhap
FROM Hangsx
JOIN Sanpham ON Hangsx.mahangsx = Sanpham.mahangsx
JOIN Nhap ON Sanpham.masp = Nhap.masp
WHERE YEAR(Nhap.ngaynhap) = 2018
GROUP BY Hangsx.tenhang;

go
go
Select * from Lab_2_2_C_5
go
--câu 6
go
CREATE VIEW Lab_2_2_C_6 AS
SELECT Nhanvien.tennv, SUM(Sanpham.giaban * Xuat.soluongX) AS TongTienXuat
FROM Nhanvien
JOIN Xuat ON Nhanvien.manv = Xuat.manv
JOIN Sanpham ON Xuat.masp = Sanpham.masp
WHERE YEAR(Xuat.ngayxuat) = 2018
GROUP BY Nhanvien.tennv;

go
go
Select * from Lab_2_2_C_6
go
--câu 7
go
CREATE VIEW Lab_2_2_C_7 AS
SELECT Nhanvien.tennv, SUM(Nhap.soluongN * Nhap.dongiaN) AS TongTienNhap
FROM Nhanvien
JOIN Nhap ON Nhanvien.manv = Nhap.manv
WHERE MONTH(Nhap.ngaynhap) = 8 AND YEAR(Nhap.ngaynhap) = 2018
GROUP BY Nhanvien.tennv
HAVING SUM(Nhap.soluongN * Nhap.dongiaN) > 100000;

go
go
Select * from Lab_2_2_C_7
go
--câu 8
go
CREATE VIEW Lab_2_2_C_8 AS
SELECT *
FROM Sanpham
WHERE NOT EXISTS (
    SELECT *
    FROM Xuat
    WHERE Sanpham.masp = Xuat.masp
);

go
go
Select * from Lab_2_2_C_8
go
--câu 9
go
CREATE VIEW Lab_2_2_C_9 AS
SELECT DISTINCT Sanpham.*
FROM Sanpham
INNER JOIN Nhap ON Sanpham.masp = Nhap.masp
INNER JOIN Xuat ON Sanpham.masp = Xuat.masp
WHERE YEAR(Nhap.ngaynhap) = 2018 AND YEAR(Xuat.ngayxuat) = 2018;

go
go
Select * from Lab_2_2_C_9
go
--câu 10
go
CREATE VIEW Lab_2_2_C_10 AS
SELECT DISTINCT Nhanvien.*
FROM Nhanvien
INNER JOIN Nhap ON Nhanvien.manv = Nhap.manv
INNER JOIN Xuat ON Nhanvien.manv = Xuat.manv;

go
go
Select * from Lab_2_2_C_10
go
--câu 11
go
CREATE VIEW Lab_2_2_C_11 AS
	SELECT *
FROM Nhanvien
WHERE Nhanvien.manv NOT IN (SELECT DISTINCT manv FROM Nhap)
  AND Nhanvien.manv NOT IN (SELECT DISTINCT manv FROM Xuat);
go
go
Select * from Lab_2_2_C_11
go