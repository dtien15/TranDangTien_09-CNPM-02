-- lab5.1
CREATE FUNCTION dbo.showSan_pham()
RETURNS TABLE
AS
RETURN
SELECT *
FROM Sanpham;
-- lab5.2
CREATE FUNCTION TinhTongGiaTriNhap(@namx INT, @namy INT)
RETURNS MONEY
AS
BEGIN
    DECLARE @tongGiaTriNhap MONEY
    SELECT @tongGiaTriNhap = SUM(dongiaN * soluongN)
    FROM Nhap
    WHERE YEAR(ngaynhap) >= @namx AND YEAR(ngaynhap) <= @namy
    RETURN @tongGiaTriNhap
END
-- lab 5.3
CREATE FUNCTION ThongKeSoLuongNhapXuat(@tenSP NVARCHAR(50), @nam INT)
RETURNS INT
AS
BEGIN
    DECLARE @soLuongNhapXuat INT

    SELECT @soLuongNhapXuat = SUM(COALESCE(n.SoluongN, 0) - COALESCE(x.SoluongX, 0))
    FROM SanPham sp
    LEFT JOIN Nhap n ON sp.MaSP = n.MaSP
    LEFT JOIN Xuat x ON sp.MaSP = x.MaSP AND YEAR(x.NgayXuat) = @nam
    WHERE sp.TenSP = @tenSP AND YEAR(n.NgayNhap) = @nam

    RETURN @soLuongNhapXuat
END
-- lab 5.4
CREATE FUNCTION TinhTongGiaTriNhapNgay(@ngayX DATE, @ngayY DATE)
RETURNS MONEY
AS
BEGIN
    DECLARE @tongGiaTriNhap MONEY

    SELECT @tongGiaTriNhap = SUM(dongiaN * soluongN)
    FROM Nhap
    WHERE ngaynhap >= @ngayX AND ngaynhap <= @ngayY

    RETURN @tongGiaTriNhap
END
-- lab 5.5
CREATE FUNCTION fn_TongGiaTriXuat(@tenHang NVARCHAR(20), @nam INT)
RETURNS MONEY
AS
BEGIN
  DECLARE @tongGiaTriXuat MONEY;
  SELECT @tongGiaTriXuat = SUM(S.giaban * X.soluongX)
  FROM Xuat X
  JOIN Sanpham S ON X.masp = S.masp
  JOIN Hangsx H ON S.mahangsx = H.mahangsx
  WHERE H.tenhang = @tenHang AND YEAR(X.ngayxuat) = @nam;
  RETURN @tongGiaTriXuat;
END;

--lab 5.6
CREATE FUNCTION fn_ThongKeNhanVienTheoPhong (@tenPhong NVARCHAR(30))
RETURNS TABLE
AS
RETURN
    SELECT phong, COUNT(manv) AS soLuongNhanVien
    FROM Nhanvien
    WHERE phong = @tenPhong
    GROUP BY phong;
-- lab 5.7
CREATE FUNCTION sp_xuat_trong_ngay(@ten_sp NVARCHAR(20), @ngay_xuat DATE)
RETURNS INT
AS
BEGIN
  DECLARE @so_luong_xuat INT
  SELECT @so_luong_xuat = SUM(soluongX)
  FROM Xuat x JOIN Sanpham sp ON x.masp = sp.masp
  WHERE sp.tensp = @ten_sp AND x.ngayxuat = @ngay_xuat
  RETURN @so_luong_xuat
END
-- lab 5.8
CREATE FUNCTION SoDienThoaiNV (@InvoiceNumber NCHAR(10))
RETURNS NVARCHAR(20)
AS
BEGIN
  DECLARE @EmployeePhone NVARCHAR(20)
  SELECT @EmployeePhone = Nhanvien.sodt
  FROM Nhanvien
  INNER JOIN Xuat ON Nhanvien.manv = Xuat.manv
  WHERE Xuat.sohdx = @InvoiceNumber
  RETURN @EmployeePhone
END
-- lab 5.9
CREATE FUNCTION ThongKeSoLuongThayDoi(@tenSP NVARCHAR(20), @nam INT)
RETURNS INT
AS
BEGIN
  DECLARE @tongNhapXuat INT;
  SET @tongNhapXuat = (
SELECT COALESCE(SUM(nhap.soluongN), 0) + COALESCE(SUM(xuat.soluongX), 0) AS tongSoLuong
    FROM Sanpham sp
    LEFT JOIN Nhap nhap ON sp.masp = nhap.masp
    LEFT JOIN Xuat xuat ON sp.masp = xuat.masp
    WHERE sp.tensp = @tenSP AND YEAR(nhap.ngaynhap) = @nam AND YEAR(xuat.ngayxuat) = @nam
  );
  RETURN @tongNhapXuat;
END;
-- lab 5.10--
CREATE FUNCTION ThongkeSoluongSanphamHangsx(@tenhang NVARCHAR(20))
RETURNS INT
AS
BEGIN
    DECLARE @soluong INT;

    SELECT @soluong = SUM(soluong)
    FROM Sanpham sp JOIN Hangsx hs ON sp.mahangsx = hs.mahangsx
    WHERE hs.tenhang = @tenhang;

    RETURN @soluong;
END;