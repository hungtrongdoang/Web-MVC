
use master
Drop Database QLLAPTOP3
----------
create Database QLLAPTOP3
GO
use QLLAPTOP3
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
	Anh VARCHAR(50),
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
VALUES (N'Trần', N'10 Hồ Chí Minh', N'098713245', N'dqhoa', N'hoa', '05/21/1991', N'dqphat@gmail.com')



/****** NHUCAU    ******/

INSERT NHUCAU(TenNhucau) VALUES (N'LAPTOP GAMING')
INSERT NHUCAU(TenNhucau) VALUES (N'LAPTOP Văn phòng')
INSERT NHUCAU(TenNhucau) VALUES (N'LAPTOP Doanh nhân')
INSERT NHUCAU(TenNhucau) VALUES (N'LAPTOP WORKSTATION')


/******LAPTOP ******/


INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop Dell Precision 7750', 15000000, N'chiếc laptop được Dell sáng tạo dựa trên những kinh nghiệm dày dạn của hãng trong việc phục vụ nhu cầu game thủ. Không chỉ đảm bảo sức mạnh hiệu năng với con chip Intel thế hệ thứ 10, Dell G3 G3500B còn chinh phục khách hàng ngay từ cái nhìn đầu tiên bởi thiết kế quá đỗi tinh tế của mình', 
'dell1.jpg', 1, 1)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop Dell Precision 5550', 12000000, N'chiếc laptop được Dell sáng tạo dựa trên những kinh nghiệm dày dạn của hãng trong việc phục vụ nhu cầu game thủ. Không chỉ đảm bảo sức mạnh hiệu năng với con chip Intel thế hệ thứ 10, Dell G3 G3500B còn chinh phục khách hàng ngay từ cái nhìn đầu tiên bởi thiết kế quá đỗi tinh tế của mình', 
'dell2.jpg', 2, 2)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop Dell Latitude 5491', 20000000, N'chiếc laptop được Dell sáng tạo dựa trên những kinh nghiệm dày dạn của hãng trong việc phục vụ nhu cầu game thủ. Không chỉ đảm bảo sức mạnh hiệu năng với con chip Intel thế hệ thứ 10, Dell G3 G3500B còn chinh phục khách hàng ngay từ cái nhìn đầu tiên bởi thiết kế quá đỗi tinh tế của mình', 
'dell3.jpg', 3, 4)
select * from LAPTOP
INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop Lenovo Thinkpad P73', 22000000, N'Lenovo IdeaPad phản hồi mọi thao tác chỉ trong tích tắc với ổ cứng SSD. Lưu trữ thoải mái với dung lượng lớn, lưu được nhiều tựa phim, game hay tài liệu,... mà không lo hết bộ nhớ. Máy cũng có khả năng nâng cấp ổ cứng HDD để lưu trữ được nhiều hơn. ', 
'lenovo1.jpg', 4, 3)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop Lenovo Thinkpad X1 Carbon', 21000000, N'Lenovo IdeaPad phản hồi mọi thao tác chỉ trong tích tắc với ổ cứng SSD. Lưu trữ thoải mái với dung lượng lớn, lưu được nhiều tựa phim, game hay tài liệu,... mà không lo hết bộ nhớ. Máy cũng có khả năng nâng cấp ổ cứng HDD để lưu trữ được nhiều hơn.', 
'lenovo2.jpg', 5, 1)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop Lenovo Thinkpad L390', 24000000, N'chiếc laptop Lenovo Thinkpad L390 được Dell sáng tạo dựa trên những kinh nghiệm dày dạn của hãng trong việc phục vụ nhu cầu game thủ. Không chỉ đảm bảo sức mạnh hiệu năng với con chip Intel thế hệ thứ 10, Dell G3 G3500B còn chinh phục khách hàng ngay từ cái nhìn đầu tiên bởi thiết kế quá đỗi tinh tế của mình', 
'lenovo3.jpg', 6, 2)
select * from LAPTOP

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop Dell Precision 7750', 12000000, N'chiếc laptop được Dell sáng tạo dựa trên những kinh nghiệm dày dạn của hãng trong việc phục vụ nhu cầu game thủ. Không chỉ đảm bảo sức mạnh hiệu năng với con chip Intel thế hệ thứ 10, Dell G3 G3500B còn chinh phục khách hàng ngay từ cái nhìn đầu tiên bởi thiết kế quá đỗi tinh tế của mình', 
'dell1.jpg', 7, 3)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop HP 15 G5', 10000000, N'chiếc laptop được Dell sáng tạo dựa trên những kinh nghiệm dày dạn của hãng trong việc phục vụ nhu cầu game thủ. Không chỉ đảm bảo sức mạnh hiệu năng với con chip Intel thế hệ thứ 10, Dell G3 G3500B còn chinh phục khách hàng ngay từ cái nhìn đầu tiên bởi thiết kế quá đỗi tinh tế của mình', 
'hp1.jpg', 8, 4)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop HP ZBook 15 G3', 8000000, N'chiếc laptop được Dell sáng tạo dựa trên những kinh nghiệm dày dạn của hãng trong việc phục vụ nhu cầu game thủ. Không chỉ đảm bảo sức mạnh hiệu năng với con chip Intel thế hệ thứ 10, Dell G3 G3500B còn chinh phục khách hàng ngay từ cái nhìn đầu tiên bởi thiết kế quá đỗi tinh tế của mình', 
'hp2.jpg', 9, 4)
select * from LAPTOP
INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop HP ZBook 15 G2', 7000000, N'chiếc laptop được Dell sáng tạo dựa trên những kinh nghiệm dày dạn của hãng trong việc phục vụ nhu cầu game thủ. Không chỉ đảm bảo sức mạnh hiệu năng với con chip Intel thế hệ thứ 10, Dell G3 G3500B còn chinh phục khách hàng ngay từ cái nhìn đầu tiên bởi thiết kế quá đỗi tinh tế của mình', 
'hp3.jpg', 10, 1)






/****** DONDATHANG ******/

INSERT DONDATHANG (MaKH, Dathanhtoan,Ngaydat,Ngaygiao,Tinhtranggiaohang) 
VALUES ( 1,0, '10/15/2115', '10/20/2015',0)

INSERT DONDATHANG (MaKH, Dathanhtoan,Ngaydat,Ngaygiao,Tinhtranggiaohang) 
VALUES ( 3,0, '10/05/2114', '10/20/2014',0)

/******CHITIETDONHANG ******/
INSERT CHITIETDONTHANG (MaDonHang,MALAPTOP,SOLUONG, Dongia) VALUES (1, 1, 1, 15000000)
INSERT CHITIETDONTHANG (MaDonHang,MALAPTOP,SOLUONG, Dongia) VALUES (1, 2, 3, 12000000)
INSERT CHITIETDONTHANG (MaDonHang,MALAPTOP,SOLUONG, Dongia) VALUES (1, 3, 1, 20000000)
INSERT CHITIETDONTHANG (MaDonHang,MALAPTOP,SOLUONG, Dongia) VALUES (2, 4, 3, 22000000)
INSERT CHITIETDONTHANG (MaDonHang,MALAPTOP,SOLUONG, Dongia) VALUES (2, 5, 1, 21000000)
INSERT CHITIETDONTHANG (MaDonHang,MALAPTOP,SOLUONG, Dongia) VALUES (2, 6, 3, 24000000)
INSERT CHITIETDONTHANG (MaDonHang,MALAPTOP,SOLUONG, Dongia) VALUES (3, 7, 1, 12000000)
INSERT CHITIETDONTHANG (MaDonHang,MALAPTOP,SOLUONG, Dongia) VALUES (3, 8, 3, 10000000)

/*******TAI KHOAN QUAN TRI***************/
Create Table Admin
(
	UserAdmin varchar(30) primary key,
	PassAdmin varchar(30) not null,
	Hoten nVarchar(50)
)
Insert into Admin values('admin','123456',N'Hoàng Trọng Dũng')
Insert into Admin values('user','123456',N'Nguyễn Trần Phát')

delete From Admin 
Select * from Admin 



