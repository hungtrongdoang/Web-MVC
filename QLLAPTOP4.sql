
use master
Drop Database QLLAPTOP4
----------
create Database QLLAPTOP4
GO
use QLLAPTOP4
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
/*********CHI TIET LAPTOP*******/

CREATE TABLE CHITIETLAPTOP
(
	MaLAPTOP INT IDENTITY(1,1),
	MaHang INT,
	CPU nvarchar(100),
	GPU nvarchar(100),
	RAM nvarchar(100),
	Hardware nvarchar(100),
	Man_Hinh nvarchar(100),
	Pin nvarchar(100),
	CONSTRAINT PK_LAPTOP_CHITIETLAPTOP FOREIGN KEY(MaLAPTOP) REFERENCES LAPTOP(MaLAPTOP),
	CONSTRAINT FK_HANG_CHITIETLAPTOP FOREIGN KEY(MaHang) REFERENCES HANG(MaHang)
)
GO



/*******NHAP LIEU*********/
/****** HANG******/
INSERT HANG(TenHANG) VALUES (N'HP')
INSERT HANG(TenHANG) VALUES (N'DELL')
INSERT HANG(TenHANG) VALUES (N'LENOVO')
INSERT HANG(TenHANG) VALUES (N'ACER')
INSERT HANG(TenHANG) VALUES (N'MSI')
INSERT HANG(TenHANG) VALUES (N'ASUS')



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

/***HP***/
INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop HP Pavilion x360 14-dw1016TU 2H3Q0PAp', 14490000, N'Toát lên sự cao cấp nhờ thiết kế mỏng nhẹ, đường nét mạnh mẽ nhưng không kém phần tinh tế. Độ mỏng ấn tượng chỉ 19 mm và 1.65 kg thỏa sức dịch chuyển, cực kì phù hợp với nhu cầu di chuyển thường xuyên của giới trẻ hiện đại.', 'HP1.jpg', 1, 2)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop HP Pavilion Gaming 15-dk1086TX', 21950000 , N'HP Pavilion Gaming 15 2020 cải thiện khả năng chơi game mạnh mẽ với card đồ họa GeForce GTX 1650Ti 4GB và bộ xử lý Intel® Core i7-10750H đa nhân thế hệ mới nhất, hỗ trợ bởi bộ nhớ RAM DDR4 2933MHz (nâng cấp được tối đa 32GB) có thể đáp ứng các ứng dụng và trò chơi chuyên sâu', 'HP2.jpg', 1, 1)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop HP Pavilion x360 14-dw1016TU 2H3Q0PAp', 14490000, N'Toát lên sự cao cấp nhờ thiết kế mỏng nhẹ, đường nét mạnh mẽ nhưng không kém phần tinh tế. Độ mỏng ấn tượng chỉ 19 mm và 1.65 kg thỏa sức dịch chuyển, cực kì phù hợp với nhu cầu di chuyển thường xuyên của giới trẻ hiện đại.', 'HP3.jpg', 1, 2)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop HP ZBook Studio G7 (8YP49AV)', 84990000, N'Kết xuất hoặc trực quan hóa theo giời gian thực, cộng tác từ xa và thậm chí chơi game ở bất cứ đâu. Sức mạnh vượt trội chưa từng thấy trong một thiết kế nhỏ gọn', 'HP4.jpg', 1, 4)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop HP EliteBook X360 1040 G7 (230P8PA)', 48990000, N'Kết xuất hoặc trực quan hóa theo giời gian thực, cộng tác từ xa và thậm chí chơi game ở bất cứ đâu. Sức mạnh vượt trội chưa từng thấy trong một thiết kế nhỏ gọn', 'HP5.jpg', 1, 4)
/***dell***/
INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop Dell Gaming G7 7500 (G7500B)',  31990000, N'Dell G7 7500 có nhiều cải tiến về thiết kế, kích thước máy được thu gọn đi, kích thước nhẹ hơn nhưng không kém phần hầm hố so với 2019. Phần bản lề của G7 7500 giờ đây với thiết kế mới hơn để lộ một phần không gian với màn hình trông nó có chút gì hiện đại, độc đáo hơn hẳn.', 'DELL1.jpg', 2, 1)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop Dell Inspiron 5502 (N5502A)', 25990000 , N'Máy tính xách tay Dell Inspiron 5502 được trang bị vi xử lý Intel core i thế hệ 11 mới nhất cung cấp hiệu năng tuyệt vời và tối ưu, mang đến khả năng phản hồi nhanh và đa nhiệm liền mạch', 'DELL2.jpg', 2, 2)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop Dell Latitude 3520 (70251603)', 13990000, N'Toát lên sự cao cấp nhờ thiết kế mỏng nhẹ, đường nét mạnh mẽ nhưng không kém phần tinh tế. Độ mỏng ấn tượng chỉ 19 mm và 1.65 kg thỏa sức dịch chuyển, cực kì phù hợp với nhu cầu di chuyển thường xuyên của giới trẻ hiện đại.', 'DELL3.jpg', 2, 3)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop Dell Vostro 5402 (V5402A)', 22990000, N'Laptop Dell Vostro 5402 được trang bị bộ vi xử lý Intel Core i thế hệ 11 mới nhất với bốn nhân và tám luồng với hiệu suất tuyệt vời ', 'DELL4.jpg', 2, 4)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop Dell Vostro 5502 (NT0X01)', 21990000, N'Dell Vostro 15 5502 sở hữu kích thước gọn, nhẹ và đường viền khung của màn hình được thiết kế từ nhựa cứng siêu dày, riêng phần bề mặt phía bên dưới phủ một lớp sơn giả nhôm. Cũng chính vì vậy mà trọng lượng của Laptop Dell Vostro 5502 NT0X01 chỉ có 1.64Kg dễ dàng mang đi bất cứ đâu.', 'DELL5.jpg', 2, 4)
/****LENOVO****/
INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop Lenovo Legion 7 16ACHG6 (82N60039VN)',  79990000, N'Laptop Lenovo Legion 7 có nhiều cải tiến về thiết kế, kích thước máy được thu gọn đi, kích thước nhẹ hơn nhưng không kém phần hầm hố so với 2019. Phần bản lề của G7 7500 giờ đây với thiết kế mới hơn để lộ một phần không gian với màn hình trông nó có chút gì hiện đại, độc đáo hơn hẳn.', 'LENOVO1.jpg', 3, 1)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop Lenovo Yoga Slim 9 14ITL5 (82D1004JVN)', 49990000 , N'Máy tính xách tay Laptop Lenovo Yoga Slim 9 được trang bị vi xử lý Intel core i thế hệ 11 mới nhất cung cấp hiệu năng tuyệt vời và tối ưu, mang đến khả năng phản hồi nhanh và đa nhiệm liền mạch', 'LENOVO2.jpg', 3, 2)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop Lenovo Legion 5 15ITH6H (82JH002WVN)', 4199000, N'Laptop Lenovo Legion 5 toát lên sự cao cấp nhờ thiết kế mỏng nhẹ, đường nét mạnh mẽ nhưng không kém phần tinh tế. Độ mỏng ấn tượng chỉ 19 mm và 1.65 kg thỏa sức dịch chuyển, cực kì phù hợp với nhu cầu di chuyển thường xuyên của giới trẻ hiện đại.', 'LENOVO3.jpg', 3, 3)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop Lenovo IdeaPad Gaming 3 15ACH6 (82K2008VVN)', 25490000, N'Laptop Dell Vostro 5402 được trang bị bộ vi xử lý Intel Core i thế hệ 11 mới nhất với bốn nhân và tám luồng với hiệu suất tuyệt vời ', 'LENOVO4.jpg', 3, 3)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop Lenovo IdeaPad 5 14ALC05 (82LM004DVN)', 17690000, N'Lenovo IdeaPad 5 sở hữu kích thước gọn, nhẹ và đường viền khung của màn hình được thiết kế từ nhựa cứng siêu dày, riêng phần bề mặt phía bên dưới phủ một lớp sơn giả nhôm. Cũng chính vì vậy mà trọng lượng của Laptop Dell Vostro 5502 NT0X01 chỉ có 1.64Kg dễ dàng mang đi bất cứ đâu.', 'LENOVO5.jpg', 3, 4)
/****ACER****/
INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop Acer Predator Helios 300 PH315-53-78TN',  41990000, N'Acer Predator Helios 300 có nhiều cải tiến về thiết kế, kích thước máy được thu gọn đi, kích thước nhẹ hơn nhưng không kém phần hầm hố so với 2019. Phần bản lề của G7 7500 giờ đây với thiết kế mới hơn để lộ một phần không gian với màn hình trông nó có chút gì hiện đại, độc đáo hơn hẳn.', 'ACER1.jpg', 4, 1)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop Acer Nitro 5 AN515-57-5831', 32990000 , N'Máy tính xách tay Acer Nitro 5 được trang bị vi xử lý Intel core i thế hệ 11 mới nhất cung cấp hiệu năng tuyệt vời và tối ưu, mang đến khả năng phản hồi nhanh và đa nhiệm liền mạch', 'ACER2.jpg', 4, 2)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop Acer Swift 5 Evo SF514-55TA-59N4', 27990000, N' Acer Swift 5 Evo toát lên sự cao cấp nhờ thiết kế mỏng nhẹ, đường nét mạnh mẽ nhưng không kém phần tinh tế. Độ mỏng ấn tượng chỉ 19 mm và 1.65 kg thỏa sức dịch chuyển, cực kì phù hợp với nhu cầu di chuyển thường xuyên của giới trẻ hiện đại.', 'ACER3.jpg', 4, 3)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop Acer Swift 3 SF314-511-56G1', 20990000, N'Laptop Acer Swift 3 được trang bị bộ vi xử lý Intel Core i thế hệ 11 mới nhất với bốn nhân và tám luồng với hiệu suất tuyệt vời ', 'ACER4.jpg', 4, 3)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop Acer Aspire 7 A715-41G-R150', 18990000, N'Laptop Acer Aspire 7 A715-41G-R150 sở hữu kích thước gọn, nhẹ và đường viền khung của màn hình được thiết kế từ nhựa cứng siêu dày, riêng phần bề mặt phía bên dưới phủ một lớp sơn giả nhôm. Cũng chính vì vậy mà trọng lượng của Laptop Dell Vostro 5502 NT0X01 chỉ có 1.64Kg dễ dàng mang đi bất cứ đâu.', 'ACER5.jpg', 4, 4)

/****MSI****/
INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop MSI Modern 14 B11MO-418VN',  14690000, N'MSI Modern 14 có nhiều cải tiến về thiết kế, kích thước máy được thu gọn đi, kích thước nhẹ hơn nhưng không kém phần hầm hố so với 2019. Phần bản lề của G7 7500 giờ đây với thiết kế mới hơn để lộ một phần không gian với màn hình trông nó có chút gì hiện đại, độc đáo hơn hẳn.', 'MSI1.jpg', 5, 1)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop MSI Bravo 15 B5DD-027VN', 21990000
 , N'Máy tính xách tay MSI Bravo 15 được trang bị vi xử lý Intel core i thế hệ 11 mới nhất cung cấp hiệu năng tuyệt vời và tối ưu, mang đến khả năng phản hồi nhanh và đa nhiệm liền mạch', 'MSI2.jpg', 5, 2)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop MSI GL65 Leopard 10SCXK-093VN', 22990000, N' MSI GL65 Leopard toát lên sự cao cấp nhờ thiết kế mỏng nhẹ, đường nét mạnh mẽ nhưng không kém phần tinh tế. Độ mỏng ấn tượng chỉ 19 mm và 1.65 kg thỏa sức dịch chuyển, cực kì phù hợp với nhu cầu di chuyển thường xuyên của giới trẻ hiện đại.', 'MSI3.jpg', 5, 3)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop MSI Prestige 14 Evo A11M-089VN', 27490000, N'Laptop MSI Prestige 14 Evo được trang bị bộ vi xử lý Intel Core i thế hệ 11 mới nhất với bốn nhân và tám luồng với hiệu suất tuyệt vời ', 'MSI4.jpg', 4, 2)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop MSI Katana GF66 11UC-641VN', 29990000, N'Laptop MSI Katana sở hữu kích thước gọn, nhẹ và đường viền khung của màn hình được thiết kế từ nhựa cứng siêu dày, riêng phần bề mặt phía bên dưới phủ một lớp sơn giả nhôm. Cũng chính vì vậy mà trọng lượng của Laptop Dell Vostro 5502 NT0X01 chỉ có 1.64Kg dễ dàng mang đi bất cứ đâu.', 'MSI5.jpg', 5, 2)
/****ASUS****/
INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop ASUS ROG Zephyrus Duo 15 SE GX551QS-HF103T',  109990000, N'Laptop ASUS ROG Zephyrus Duo 15 có nhiều cải tiến về thiết kế, kích thước máy được thu gọn đi, kích thước nhẹ hơn nhưng không kém phần hầm hố so với 2019. Phần bản lề của G7 7500 giờ đây với thiết kế mới hơn để lộ một phần không gian với màn hình trông nó có chút gì hiện đại, độc đáo hơn hẳn.', 'ASUS1.jpg', 6, 1)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop ASUS ROG Strix SCAR 15 G533QM-HF089T', 49990000, N'Máy tính xách tay Laptop ASUS ROG Strix SCAR 15 được trang bị vi xử lý Intel core i thế hệ 11 mới nhất cung cấp hiệu năng tuyệt vời và tối ưu, mang đến khả năng phản hồi nhanh và đa nhiệm liền mạch', 'ASUS2.jpg', 6, 2)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop ASUS TUF Gaming A15 FA506QM-HN005T', 32990000, N' ASUS TUF Gaming A15 toát lên sự cao cấp nhờ thiết kế mỏng nhẹ, đường nét mạnh mẽ nhưng không kém phần tinh tế. Độ mỏng ấn tượng chỉ 19 mm và 1.65 kg thỏa sức dịch chuyển, cực kì phù hợp với nhu cầu di chuyển thường xuyên của giới trẻ hiện đại.', 'ASUS3.jpg', 6, 3)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop ASUS ExpertBook B9400CEA-KC0558T', 28990000, N'Laptop ASUS ExpertBook được trang bị bộ vi xử lý Intel Core i thế hệ 11 mới nhất với bốn nhân và tám luồng với hiệu suất tuyệt vời ', 'ASUS4.jpg', 4, 2)

INSERT LAPTOP(TenLAPTOP, Giaban, Mota,Anh, MaHang, MaNhucau) 
VALUES (N'Laptop ASUS VivoBook M513IA-EJ283T', 18790000, N'Laptop ASUS VivoBook sở hữu kích thước gọn, nhẹ và đường viền khung của màn hình được thiết kế từ nhựa cứng siêu dày, riêng phần bề mặt phía bên dưới phủ một lớp sơn giả nhôm. Cũng chính vì vậy mà trọng lượng của Laptop Dell Vostro 5502 NT0X01 chỉ có 1.64Kg dễ dàng mang đi bất cứ đâu.', 'ASUS5.jpg', 6, 2)

SELECT * FROM CHITIETLAPTOP
/************chi tiet laptop**************/
/***hp*/
INSERT CHITIETLAPTOP(MaHang,CPU,GPU,RAM,Hardware,Man_Hinh,Pin)
VALUES (1,N'Intel Core i3-1115G4',N'Intel UHD Graphics',N'4GB',' SSD 256GB',N'14 inch',N'3 Cell 43WHr')
INSERT CHITIETLAPTOP(MaHang,CPU,GPU,RAM,Hardware,Man_Hinh,Pin)
VALUES (1,N'Intel Core  i7-10750H',N'GTX 1650Ti',N'8GB',' SSD 512GB',N'15.6 inch',N'3 Cell 43WHr')
INSERT CHITIETLAPTOP(MaHang,CPU,GPU,RAM,Hardware,Man_Hinh,Pin)
VALUES (1,N'Intel Core i7-1165G7',N'Intel Iris Xe Graphics',N'16GB',' SSD 256GB',N'14 inch',N'3 Cell 45WHr')
INSERT CHITIETLAPTOP(MaHang,CPU,GPU,RAM,Hardware,Man_Hinh,Pin)
VALUES (1,N'Intel Core i9-10885H',N'VGA Quadro T2000',N'4GB',' SSD1TB',N'15.6 inch',N'3 Cell 83WHr')
INSERT CHITIETLAPTOP(MaHang,CPU,GPU,RAM,Hardware,Man_Hinh,Pin)
VALUES (1,N'Intel Core i7-10510U',N'Intel UHD Graphics ',N'4GB',' SSD 512GB + 32GB  Intel Optane',N'14 inch',N' 4 Cell 78.5WHr')
/***DELL***/
INSERT CHITIETLAPTOP(MaHang,CPU,GPU,RAM,Hardware,Man_Hinh,Pin)
VALUES (2,N'Intel Core i7-10750HX',N'GTX 1660Ti',N'32GB',' SSD 512GB',N'15.6 inch',N'4 Cell 80 WHr')
INSERT CHITIETLAPTOP(MaHang,CPU,GPU,RAM,Hardware,Man_Hinh,Pin)
VALUES (2,N'Intel Core i7-1165G7',N'MX330 2GB',N'16GB',' SSD 512GB',N'15.6 inch',N'4 Cell 63.5 WHr')
INSERT CHITIETLAPTOP(MaHang,CPU,GPU,RAM,Hardware,Man_Hinh,Pin)
VALUES (2,N'Intel Core i3-1115G4',N'Intel UHD Graphics ',N'16GB',' SSD 256GB',N'15.6 inch',N'4 Cell 80 WHr')
INSERT CHITIETLAPTOP(MaHang,CPU,GPU,RAM,Hardware,Man_Hinh,Pin)
VALUES (2,N'Intel Core i5-1135G7',N' MX330 2GB ',N'8GB',' SSD 256GB',N'15.6 inch',N'4 Cell 83WHr')
INSERT CHITIETLAPTOP(MaHang,CPU,GPU,RAM,Hardware,Man_Hinh,Pin)
VALUES (2,N'Intel Core i5-1135G7 ',N'MX330 2GB',N'8GB',' SSD 512GB',N'14 inch',N' 4 Cell 44.5WHr')
/***LENOVO***/
INSERT CHITIETLAPTOP(MaHang,CPU,GPU,RAM,Hardware,Man_Hinh,Pin)
VALUES (3,N'AMD Ryzen 9 5900HX',N'GeForce RTX 3080',N'32GB',' SSD 1TB',N'16 inch',N'4 Cell 80 WHr')
INSERT CHITIETLAPTOP(MaHang,CPU,GPU,RAM,Hardware,Man_Hinh,Pin)
VALUES (3,N'Intel Core  i7-10750H',N'Intel Iris Xe Graphics',N'16GB',' SSD 1TB',N'14 inch',N'4 Cell 63.5 WHr')
INSERT CHITIETLAPTOP(MaHang,CPU,GPU,RAM,Hardware,Man_Hinh,Pin)
VALUES (3,N'AMD Ryzen 7 5800H',N'GeForce RTX 3060 6GB',N'16GB',' SSD 512GB',N'15.6 inch',N'4 Cell 80 WHr')
INSERT CHITIETLAPTOP(MaHang,CPU,GPU,RAM,Hardware,Man_Hinh,Pin)
VALUES (3,N'R7-5700U',N'VGA RTX 3050 4GB',N'8GB',' SSD 512GB',N'15.6 inch',N'4 Cell 83WHr')
INSERT CHITIETLAPTOP(MaHang,CPU,GPU,RAM,Hardware,Man_Hinh,Pin)
VALUES (3,N'i7-1165G7',N' AMD Radeon Graphics',N'8GB',' SSD 512GB',N'14 inch',N' 4 Cell 44.5WHr')
/***ACER***/
INSERT CHITIETLAPTOP(MaHang,CPU,GPU,RAM,Hardware,Man_Hinh,Pin)
VALUES (4,N'i7-10750H',N'VGA RTX 3060 6GB',N'32GB',' SSD 512GB',N'15.6 inch',N'4 Cell 59 WHr')
INSERT CHITIETLAPTOP(MaHang,CPU,GPU,RAM,Hardware,Man_Hinh,Pin)
VALUES (4,N'i5-11400H',N'VGA RTX 3060 6GB',N'16GB',' SSD 512GB',N'15.6 inch',N'4 Cell 57 WHr')
INSERT CHITIETLAPTOP(MaHang,CPU,GPU,RAM,Hardware,Man_Hinh,Pin)
VALUES (4,N'i5-1135G7',N'Intel Iris Xe Graphics ',N'16GB',' SSD 256GB',N'15.6 inch',N'4 Cell 48 WHr')
INSERT CHITIETLAPTOP(MaHang,CPU,GPU,RAM,Hardware,Man_Hinh,Pin)
VALUES (4,N'i5-1135G7',N' Intel Iris Xe Graphics  ',N'8GB',' SSD 256GB',N'14 inch',N'4 Cell 48WHr')
INSERT CHITIETLAPTOP(MaHang,CPU,GPU,RAM,Hardware,Man_Hinh,Pin)
VALUES (4,N'R7-3750H  ',N'VGA GTX 1650Ti 4GB',N'8GB',' SSD 512GB',N'14 inch',N' 4 Cell 44.5 WHr')
/**msi**/
INSERT CHITIETLAPTOP(MaHang,CPU,GPU,RAM,Hardware,Man_Hinh,Pin)
VALUES (5,N'i3-1115G4',N'Intel UHD Graphics',N'8GB',' SSD 512GB',N'15.6 inch',N'3 Cell 59 WHr')
INSERT CHITIETLAPTOP(MaHang,CPU,GPU,RAM,Hardware,Man_Hinh,Pin)
VALUES (5,N'R5-5600H ',N'VGA RX5500M 4GB',N'8GB',' SSD 512GB',N'15.6 inch',N'3 Cell 57 WHr')
INSERT CHITIETLAPTOP(MaHang,CPU,GPU,RAM,Hardware,Man_Hinh,Pin)
VALUES (5,N'i7-10750H',N' VGA GTX 1650 4GB ',N'16GB',' SSD 256GB',N'15.6 inch',N'3 Cell 48 WHr')
INSERT CHITIETLAPTOP(MaHang,CPU,GPU,RAM,Hardware,Man_Hinh,Pin)
VALUES (5,N'i7-1185G7 ',N' Intel Iris Xe Graphics ',N'8GB',' SSD 256GB',N'14 inch',N'3 Cell 48WHr')
INSERT CHITIETLAPTOP(MaHang,CPU,GPU,RAM,Hardware,Man_Hinh,Pin)
VALUES (5,N'i7-11800H ',N'VGA RTX 3050 4GB',N'8GB',' SSD 512GB',N'14 inch',N' 3 Cell 44.5 WHr')
/**ASUS**/
INSERT CHITIETLAPTOP(MaHang,CPU,GPU,RAM,Hardware,Man_Hinh,Pin)
VALUES (6,N'R9-5900HX',N' VGA RTX 3080 16GB',N'8GB',' SSD 2TB',N'15.6 inch',N'4 Cell 90 WHr')
INSERT CHITIETLAPTOP(MaHang,CPU,GPU,RAM,Hardware,Man_Hinh,Pin)
VALUES (6,N'R9-5900HX ',N'VGA RTX 3060 6GB',N'8GB',' SSD 1TB',N'15.6 inch',N'4 Cell 90 WHr')
INSERT CHITIETLAPTOP(MaHang,CPU,GPU,RAM,Hardware,Man_Hinh,Pin)
VALUES (6,N'R7-5800H',N' VGA RTX 3060 6GB ',N'16GB',' SSD 1TB',N'15.6 inch',N'4 Cell 90 WHr')
INSERT CHITIETLAPTOP(MaHang,CPU,GPU,RAM,Hardware,Man_Hinh,Pin)
VALUES (6,N'i5-1135G7  ',N' Intel Iris Xe Graphics ',N'8GB',' SSD 256GB',N'14 inch',N'4 Cell 66WHr Lithium-Polymer')
INSERT CHITIETLAPTOP(MaHang,CPU,GPU,RAM,Hardware,Man_Hinh,Pin)
VALUES (6,N'R7-4700U ',N'AMD Radeon Graphics',N'8GB',' SSD 512GB',N'14 inch',N' 4 Cell 44.5 WHr')
/****** DONDATHANG ******/
SELECT * FROM CHITIETLAPTOP
INSERT DONDATHANG (MaKH, Dathanhtoan,Ngaydat,Ngaygiao,Tinhtranggiaohang) 
VALUES ( 1,0, '10/15/2115', '10/20/2015',0)

INSERT DONDATHANG (MaKH, Dathanhtoan,Ngaydat,Ngaygiao,Tinhtranggiaohang) 
VALUES ( 3,0, '10/05/2114', '10/20/2014',0)

/******CHITIETDONHANG ******/
/** KHOONG SU DUNG CAI CHI TIET DON HANG NAY 
NHUNG MA NOTE LAI DAY 
KHONG SU DUNG CAI CHI TIET DON HANG NAY **/
DELETE FROM CHITIETDONTHANG
INSERT CHITIETDONTHANG (MaDonHang,MALAPTOP,SOLUONG, Dongia) VALUES (1, 1, 1 , 14490000)


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
SELECT * FROM HANG
SELECT * FROM CHITIETDONTHANG
SELECT * FROM CHITIETLAPTOP
SELECT * FROM laptop
SELECT * FROM NHUCAU


