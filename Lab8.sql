--1. Vi?t th? t?c thêm m?i nhân viên bao g?m các tham s?: manv, tennv, gioitinh, diachi, sodt, email, phong và 1 bi?n Flag, N?u Flag=0 thì nh?p m?i, ng??c l?i thì c?p nh?t thông tin nhân viên theo mã. Hãy ki?m tra:
--- gioitinh nh?p vào có ph?i là Nam ho?c N? không, n?u không tr? v? mã l?i 1. - Ng??c l?i n?u th?a mãn thì cho phép nh?p và tr? v? mã l?i 0..
create proc themMoiNhanV 
@manv nchar(10),@tennv nvarchar(20), @gioitinh nchar(10), @diachi varchar(30),
@sodt varchar(20), @email varchar(30), @phong nvarchar(30), @flag int
as
begin

	--flag 0 và 1 thì ta x? lý
	if(@flag = 0)
	begin

		--Gi?i tính nh?p vào là nam hay n?
		if @gioitinh not in (N'Nam', N'N?')
		begin 
			select 1 as Maloi1
			return
		end

		insert into Nhanvien(manv, tennv, gioitinh, diachi, sodt, email, phong) values 
		(@manv, @tennv, @gioitinh, @diachi, @sodt, @email, @phong)

		select 0 as Maloi0
		return
	end
	else
	begin
		update Nhanvien set manv = @manv, tennv = @tennv, gioitinh = @gioitinh, diachi = @diachi, 
		sodt = @sodt, email = @email, phong = @phong where manv = @manv
	end
end 
go
exec themMoiNhanV N'NV04', N'Ph?m Thúy Nga',N'Nam' , N'??ng Nai', '0975436464', 'gh@gmail.com', N'K? toán', 1
go
--2. Vi?t th? t?c thêm m?i s?n ph?m v?i các tham bi?n masp, tenhang, tensp, soluong, mausac, giaban, donvitinh, mota và 1 bi?n Flag. N?u Flag=0 thì thêm m?i s?n ph?m, ng??c l?i c?p nh?t s?n ph?m. Hãy ki?m tra:
--- N?u tenhang không có trong b?ng hangsx thì tr? v? mã l?i 1 - N?u soluong <0 thì tr? v? mã l?i 2
--- Ng??c l?i tr? v? mã l?i 0.
create proc themSP 
@masp nchar(10), @tenhang nchar(10), @tensp  nvarchar(20), @soluong int, @mausac nvarchar(20),
@giaban money, @donvitinh nchar(10), @mota  nchar(200), @flag int
as begin
	--flag 0 và 1
	if(@flag = 0)
	begin

			--tenhang không có trong hãng sx
		if @tenhang not in (select tenhang from Hangsx)
		begin
			select 1 as N'Mã l?i 1'
		end
		if @soluong < 0
		begin 
			select 2 as N'Mã l?i 2'
		end

		--Thêm vào
		insert into Sanpham(masp, tensp, soluong, mausac, giaban, donvitinh, mota) values 
		(@masp, @tensp, @soluong, @mausac,@giaban, @donvitinh, @mota)

		select 0 as N'Mã l?i 0'
		return
	end
	else
	begin
		update Sanpham set masp = @masp, tensp = @tensp, soluong = @soluong, mausac = @mausac, 
		giaban = @giaban, donvitinh = @donvitinh, mota = @mota where masp = @masp
	end
end
go
exec themSP N'SP07', 'Samsung', N'Plus3000', 50, N'??', 5000000, N'Chi?c', N'Hàng cao c?p', 1
go
--3. Vi?t th? t?c xóa d? li?u b?ng nhanvien v?i tham bi?n là manv. N?u many ch?a có thì tr? v? 1, ng??c l?i xóa nhanvien v?i nhanvien b? xóa là many và tr? v? 0. (L?u ý: xóa nhanvien thì ph?i xóa các b?ng Nhap, Xuat mà nhân viên này tham gia).
create proc xoa_DL @manv varchar(20)
as begin 
	if @manv is null
	begin 
		return 1;
	end
	else 
	begin 
		delete from Nhanvien where manv = @manv
		return 0
	end
end
go
exec xoa_DL 'NV04'
go
--4. Vi?t th? t?c xóa d? li?u b?ng sanpham v?i tham bi?n là masp. N?u masp ch?a có thì tr? v? 1, ng??c l?i xóa sanpham v?i sanpham b? xóa là masp và tr? v? 0. (L?u ý: xóa sanpham thì ph?i xóa các b?ng Nhap, Xuat mà sanpham này cung ?ng).
create proc xoa_SP @masp varchar(20)
as begin 
	if @masp is null
	begin 
		return 1
	end
	else
	begin 
		delete from Nhap where masp in (select masp from Sanpham where masp = @masp)
		delete from Sanpham where masp = @masp
		return 0
	end
end
go
exec xoa_SP 'SP06'
go
--5. T?o th? t?c nh?p li?u cho b?ng H?ngsx, v?i các tham bi?n truy?n vào mahangsx, tenhang, diachi, sodt, email. Hãy ki?m tra xem tenhang ?ã t?n t?i tr??c ?ó hay ch?a, n?u r?i tr? v? mã l?i 1? N?u có r?i thì không cho nh?p và tr? v? mã l?i 0.
create proc nhapHangsx
@mahangsx varchar(20), @tenhang nvarchar(20), @diachi varchar(20), @sodt varchar(20), @email varchar(20)
as begin
	if @tenhang in (select tenhang from Hangsx)
	begin 
		select 1 as N'Mã l?i 1'
	end

	insert into Hangsx (mahangsx, tenhang, diachi, sodt, email) values
	(@mahangsx, @tenhang, @diachi, @sodt, @email)
end
go
--6. Vi?t th? t?c nh?p d? li?u cho b?ng Nhap v?i các tham bi?n sohdn, masp, many, ngaynhap, soluongN, dongiaN. Ki?m tra xem masp có t?n t?i trong b?ng Sanpham hay không, n?u không tr? v? 1? many có t?n t?i trong b?ng nhanvien hay không n?u không tr? v? 2?
--ng??c l?i thì hãy ki?m tra: N?u sohdn ?ã t?n t?i thì c?p nh?t b?ng Nhap theo sohdn, ng??c l?i thêm m?i b?ng Nhap và tr? v? mã l?i 0.
create proc nhapChoNhap
    @sohdn nchar(10),
    @masp nchar(10),
    @manv nchar(10),
    @ngaynhap date,
    @soluongN int,
    @dongiaN money
as
begin

    if @masp not in (select masp from Sanpham where masp = @masp)
    begin
        select 1 as N'Mã l?i 1'
        return
    end

    IF @manv not in (SELECT manv FROM Nhanvien WHERE manv = @manv)
    BEGIN
        select 2 as N'Mã l?i 2' 
        RETURN;
    END

    IF @sohdn in (SELECT sohdn FROM Nhap WHERE sohdn = @sohdn)
    BEGIN
        -- N?u ?ã t?n t?i thì c?p nh?t b?ng Nhap
        UPDATE Nhap 
        SET masp = @masp, manv = @manv, ngaynhap = @ngaynhap, soluongN = @soluongN, dongiaN = @dongiaN 
        WHERE sohdn = @sohdn;
    END
    ELSE
    BEGIN
        -- N?u ch?a t?n t?i thì thêm m?i b?ng Nhap
        INSERT INTO Nhap (sohdn, masp, manv, ngaynhap, soluongN, dongiaN)
        VALUES (@sohdn, @masp, @manv, @ngaynhap, @soluongN, @dongiaN);
    END

    select 0 as N'Mã l?i 0'
	return
END
go
exec nhapChoNhap 'N07', 'SP02', 'NV04', '2020-09-15', 16, 50000
go
--7. Vi?t th? t?c nh?p d? li?u cho b?ng xuat v?i các tham bi?n sohdx, masp, many, ngayxuat, soluongX. Ki?m tra xem masp có t?n t?i trong bàng Sanpham hay không n?u không tr? v? 1? many có t?n t?i trong b?ng nhanvien hay không n?u không tr? v? 2?
--soluongX<= Soluong n?u không tr? v? 3? ng??c l?i thì hãy ki?m tra: N?u sohdx ?ã t?n t?i thì c?p nh?t b?ng Xuat theo sohdx, ng??c l?i thêm m?i b?ng Xuat và tr? v? mã l?i 0
create PROCEDURE xuatSP
    @sohdx nchar(10),
	@masp nchar(10),
    @manv nchar(10),
    @ngayxuat date,
    @soluongX int
AS
BEGIN
    -- Ki?m tra s? t?n t?i c?a masp trong b?ng Sanpham
    IF NOT EXISTS(SELECT masp FROM Sanpham WHERE masp = @masp)
        RETURN 1

    -- Ki?m tra s? t?n t?i c?a many trong b?ng Nhanvien
    IF NOT EXISTS(SELECT manv FROM Nhanvien WHERE manv = @manv)
        RETURN 2

    -- Ki?m tra s? l??ng xu?t không v??t quá s? l??ng t?n kho Soluong
    DECLARE @Soluong int
    SELECT @Soluong = soluong FROM Sanpham WHERE masp = @masp
    IF @soluongX > @Soluong
        RETURN 3

    -- Thêm ho?c c?p nh?t d? li?u vào b?ng Xu?t
    IF EXISTS(SELECT sohdx FROM Xuat WHERE sohdx = @sohdx)
    BEGIN
        UPDATE Xuat
        SET masp = @masp,
            manv = @manv,
            ngayxuat = @ngayxuat,
            soluongX = @soluongX
        WHERE sohdx = @sohdx
    END
    ELSE
    BEGIN
        INSERT INTO Xuat (sohdx, masp, manv, ngayxuat, soluongX)
        VALUES (@sohdx, @masp, @manv, @ngayxuat, @soluongX)
    END

    RETURN 0
END
go
exec xuatSP 'X06', 'SP03', 'NV01', '2020-09-15', 16
go