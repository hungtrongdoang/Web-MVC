use master
Drop Database QLLAPTOP1
----------
create Database QLLAPTOP1
GO
use QLLAPTOP1
GO
CREATE TABLE KHACHHANG
(
	MaKH INT IDENTITY(1,1),
	HoTen nVarchar(50) NOT NULL,
	Taikhoan Varchar(50) UNIQUE,
	Matkhau Varchar(50) NOT NULL,
	Email Varchar(100) UNIQUE,
	DiachiKH nVarchar(200),
	DienthoaiKH Varchar(50),	
	Ngaysinh DATETIME
	CONSTRAINT PK_Khachhang PRIMARY KEY(MaKH)
)
GO

//----------------------
Create Table HANG
(
	MaHang int Identity(1,1),
	TenHANG nvarchar(50) NOT NULL,
	CONSTRAINT PK_HANG PRIMARY KEY(MaHang)
)
GO
Create Table NHUCAU
(
	MaNhucau int identity(1,1),
	TenNhucau nvarchar(50) NOT NULL,
	CONSTRAINT PK_NHUCAU PRIMARY KEY(MaNhucau)
)
GO



CREATE TABLE LAPTOP
(
	MaLAPTOP INT IDENTITY(1,1),
	TenLAPTOP NVARCHAR(100) NOT NULL,
	Giaban Decimal(18,0) CHECK (Giaban>=0),
	Mota NVarchar(Max),
	Anhbia VARCHAR(50),
	Ngaycapnhat DATETIME,
	Soluongton INT,
	MaHang INT,
	MaNhucau INT,
	CONSTRAINT PK_LAPTOP PRIMARY KEY(MaLAPTOP),
	CONSTRAINT FK_HANG FOREIGN KEY(MaHang) REFERENCES HANG(MaHang),
	CONSTRAINT FK_NHUCAU FOREIGN KEY(MaNhucau) REFERENCES NHUCAU(MaNhucau)
)
GO



CREATE TABLE DONDATHANG
(
	MaDonHang INT IDENTITY(1,1),
	Dathanhtoan bit,
	Tinhtranggiaohang  bit,
	Ngaydat Datetime,
	Ngaygiao Datetime,	
	MaKH INT,
	CONSTRAINT FK_Khachhang FOREIGN KEY(MaKH) REFERENCES Khachhang(MaKH),
	CONSTRAINT PK_DonDatHang PRIMARY KEY(MaDonHang)
)
GO
CREATE TABLE CHITIETDONTHANG
(
	MaDonHang INT,
	MaLAPTOP INT,
	Soluong Int Check(Soluong>0),
	Dongia Decimal(18,0) Check(Dongia>=0),	
	CONSTRAINT PK_CTDatHang PRIMARY KEY(MaDonHang,MaLAPTOP),
	CONSTRAINT FK_CHITIETDONHANG_DONDATHANG FOREIGN KEY(MaDonHang) REFERENCES DONDATHANG(MaDonHang),
	CONSTRAINT FK_CHITIETDONHANG_LAPTOP FOREIGN KEY(MALAPTOP) REFERENCES LAPTOP(MaLAPTOP)
)
GO
/****** HANG******/
INSERT HANG(TenHANG) VALUES (N'HP')
INSERT HANG(TenHANG) VALUES (N'DELL')
INSERT HANG(TenHANG) VALUES (N'LENOVO')
INSERT HANG(TenHANG) VALUES (N'ACER')
INSERT HANG(TenHANG) VALUES (N'MSI')
INSERT HANG(TenHANG) VALUES (N'ASUS')
INSERT HANG(TenHANG) VALUES (N'MICROSOFT')
INSERT HANG(TenHANG) VALUES (N'APPLE')
INSERT HANG(TenHANG) VALUES (N'SAMSUNG')
INSERT HANG(TenHANG) VALUES (N'RAZER')



/****** KHACHHANG ******/
INSERT KHACHHANG (Hoten, DiachiKH, DienthoaiKH, Taikhoan, Matkhau, Ngaysinh, Email)
VALUES (N'Hoàng Trọng Dũng', N'10 Hồ Chí Minh', N'0918062755', N'hoangtrongdung', N'123123', '05/02/2000', 'hungtrongdoang@gmail.com')
INSERT KHACHHANG (Hoten, DiachiKH, DienthoaiKH, Taikhoan, Matkhau, Ngaysinh, Email) 
VALUES (N'Nguyễn Trần Phát', N'10 Hồ Chí Minh', N'0917654310', N'nguyentranphat', N'123456', '05/02/2000', N'nguyentranphat@gmail.com')
INSERT KHACHHANG (Hoten, DiachiKH, DienthoaiKH, Taikhoan, Matkhau, Ngaysinh, Email) 
VALUES (N'Trần', N'10 Hồ Chí Minh', N'098713245', N'dqhoa', N'hoa', '05/21/1991', N'123123@gmail.com')
INSERT KHACHHANG (Hoten, DiachiKH, DienthoaiKH, Taikhoan, Matkhau, Ngaysinh, Email) 
VALUES (N'Hoàng Trọn', N'10 Hồ Chí Minh', N'0918544699', N'nnngan', N'ngan', '10/12/1986', N'123123@gmail.com')



/****** NHUCAU    ******/

INSERT NHUCAU(TenNhucau) VALUES (N'LAPTOP GAMING')
INSERT NHUCAU(TenNhucau) VALUES (N'LAPTOP Văn phòng')
INSERT NHUCAU(TenNhucau) VALUES (N'LAPTOP Doanh nhân')
INSERT NHUCAU(TenNhucau) VALUES (N'LAPTOP WORKSTATION')
INSERT NHUCAU(TenNhucau) VALUES (N'LAPTOP Chuẩn quân đội')
INSERT NHUCAU(TenNhucau) VALUES (N'LAPTOP Đồ họa')
INSERT NHUCAU(TenNhucau) VALUES (N'LAPTOP Sinh viên')


/******LAPTOP ******/


INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anhbia, MaHang, MaNhucau, Ngaycapnhat, Soluongton) 
VALUES (N'Laptop Dell Precision 7750', 15000000, N'chiếc laptop được Dell sáng tạo dựa trên những kinh nghiệm dày dạn của hãng trong việc phục vụ nhu cầu game thủ. Không chỉ đảm bảo sức mạnh hiệu năng với con chip Intel thế hệ thứ 10, Dell G3 G3500B còn chinh phục khách hàng ngay từ cái nhìn đầu tiên bởi thiết kế quá đỗi tinh tế của mình', 
'dell1.jpg', 7, 1, '10/25/2014', 120)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anhbia, MaHang, MaNhucau, Ngaycapnhat, Soluongton) 
VALUES (N'Dell', 15000000, N'chiếc laptop được Dell sáng tạo dựa trên những kinh nghiệm dày dạn của hãng trong việc phục vụ nhu cầu game thủ. Không chỉ đảm bảo sức mạnh hiệu năng với con chip Intel thế hệ thứ 10, Dell G3 G3500B còn chinh phục khách hàng ngay từ cái nhìn đầu tiên bởi thiết kế quá đỗi tinh tế của mình', 
'dell2.jpg', 7, 1, '10/25/2014', 120)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anhbia, MaHang, MaNhucau, Ngaycapnhat, Soluongton) 
VALUES (N'Dell', 20000000, N'chiếc laptop được Dell sáng tạo dựa trên những kinh nghiệm dày dạn của hãng trong việc phục vụ nhu cầu game thủ. Không chỉ đảm bảo sức mạnh hiệu năng với con chip Intel thế hệ thứ 10, Dell G3 G3500B còn chinh phục khách hàng ngay từ cái nhìn đầu tiên bởi thiết kế quá đỗi tinh tế của mình', 
'dell3.jpg', 7, 1, '10/25/2014', 120)
select * from LAPTOP



/****** DONDATHANG ******/

INSERT DONDATHANG (MaKH, Dathanhtoan,Ngaydat,Ngaygiao,Tinhtranggiaohang) 
VALUES ( 1,0, '10/15/2115', '10/20/2015',0)

INSERT DONDATHANG (MaKH, Dathanhtoan,Ngaydat,Ngaygiao,Tinhtranggiaohang) 
VALUES ( 3,0, '10/05/2114', '10/20/2014',0)

/******CHITIETDONHANG ******/
INSERT CHITIETDONTHANG (MaDonHang,MALAPTOP,SOLUONG, Dongia) VALUES (1, 19, 1, 25000)
INSERT CHITIETDONTHANG (MaDonHang,MALAPTOP,SOLUONG, Dongia) VALUES (1, 15, 3, 50000)
INSERT CHITIETDONTHANG (MaDonHang,MALAPTOP,SOLUONG, Dongia) VALUES (1, 14, 1, 25000)
INSERT CHITIETDONTHANG (MaDonHang,MALAPTOP,SOLUONG, Dongia) VALUES (2, 5, 3, 10000)
INSERT CHITIETDONTHANG (MaDonHang,MALAPTOP,SOLUONG, Dongia) VALUES (2, 9, 1, 15000)
INSERT CHITIETDONTHANG (MaDonHang,MALAPTOP,SOLUONG, Dongia) VALUES (2, 15, 3, 150000)
INSERT CHITIETDONTHANG (MaDonHang,MALAPTOP,SOLUONG, Dongia) VALUES (3, 9, 1, 25000)
INSERT CHITIETDONTHANG (MaDonHang,MALAPTOP,SOLUONG, Dongia) VALUES (3, 10, 3,70000)

/*******TAI KHOAN QUAN TRI***************/
Create Table Admin
(
	UserAdmin varchar(30) primary key,
	PassAdmin varchar(30) not null,
	Hoten nVarchar(50)
)
Insert into Admin values('admin','123456',N'Hoàng Trọng Dũng')
Insert into Admin values('user','123123',N'Nguyễn Trần Phát')

delete From Admin 
Select * from Admin 

SELECT * FROM QLLAPTOP1


