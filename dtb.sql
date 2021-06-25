use master
create database QLLAPTOP
GO
use QLLAPTOP
GO


CREATE TABLE LAPTOP
(
	MALAPTOP INT IDENTITY(1,1),
	TENLAPTOP NVARCHAR(100) NOT NULL,
	MAHANG INT,

	CPU NVARCHAR(50) NOT NULL,
	RAM NVARCHAR(50) NOT NULL,
	OCUNG NVARCHAR(50) NOT NULL,
	MANHINH NVARCHAR(50) NOT NULL,
	CARDMANHINH NVARCHAR(50) NOT NULL,
	CONGKETNOI NVARCHAR(50) NOT NULL,
	HEDIEUHANH NVARCHAR(50) NOT NULL,
	THIETKE NVARCHAR(50) NOT NULL,
	KICHTHUOC NVARCHAR(50) NOT NULL,

	Giaban Decimal(18,0) CHECK (Giaban>=0),
	SoLuongTon int,
	Thoidiemramat datetime,

	CONSTRAINT PK_LAPTOP PRIMARY KEY(MALAPTOP),
	CONSTRAINT FK_HANG FOREIGN KEY(MAHANG) REFERENCES HANG(MAHANG)
)


CREATE TABLE HANG
(
	MAHANG INT IDENTITY(1,1),
	TENHANG NVARCHAR(50) NOT NULL,
	ANHHANG NVARCHAR(100),
	TIEUSU nVarchar(Max),
	CONSTRAINT PK_HANG PRIMARY KEY(Mahang)
)

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
CREATE TABLE CHITIETDONHANG
(
	MaDonHang INT,
	MALAPTOP INT,
	Soluong Int Check(Soluong>0),
	Dongia Decimal(18,0) Check(Dongia>=0),	
	CONSTRAINT PK_CTDH PRIMARY KEY(MaDonHang,MALAPTOP),
)
GO
drop table CHITIETDONTHANG



----------------QUẢN TRỊ-----------------
Create Table Admin
(
	UserAdmin varchar(30) primary key,
	PassAdmin varchar(30) not null,
	Hoten nVarchar(50)
)
Insert into Admin values('admin','123456',N'Hoàng Trọng Dũng')
Insert into Admin values('user','123',N'Dũng')

delete From Admin 
Select * from Admin 

----------------SHOW DATABASE------------------
select * from HANG
select * from LAPTOP
select * from Admin
select * from DONDATHANG
select * from KHACHHANG
select * from CHITIETDONHANG

--------- Nhaplieu: CHITIETDONHANG ----------

/****** DONDATHANG ******/

INSERT DONDATHANG (MaKH, Dathanhtoan,Ngaydat,Ngaygiao,Tinhtranggiaohang) 
VALUES ( 1,0, '10/15/2115', '10/20/2015',0)

INSERT DONDATHANG (MaKH, Dathanhtoan,Ngaydat,Ngaygiao,Tinhtranggiaohang) 
VALUES ( 3,0, '10/05/2114', '10/20/2014',0)
