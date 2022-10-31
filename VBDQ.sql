USE [master]
GO
/****** Object:  Database [VBDQEntityDB]    Script Date: 30/10/2022 1:15:36 pm ******/
CREATE DATABASE [VBDQEntityDB]
GO
USE [VBDQEntityDB]
GO
/****** Object:  Table [dbo].[ChiTietPhieuBan]    Script Date: 30/10/2022 1:15:36 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuBan](
	[MaChiTietPhieu] [nvarchar](128) NOT NULL,
	[MaPhieu] [nvarchar](128) NOT NULL,
	[MaSP] [nvarchar](128) NOT NULL,
	[SoLuong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTietPhieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietPhieuMua]    Script Date: 30/10/2022 1:15:36 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuMua](
	[MaChiTietPhieu] [nvarchar](128) NOT NULL,
	[MaPhieu] [nvarchar](128) NOT NULL,
	[MaSP] [nvarchar](128) NOT NULL,
	[SoLuong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTietPhieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonVi]    Script Date: 30/10/2022 1:15:36 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonVi](
	[MaDV] [int] IDENTITY(1,1) NOT NULL,
	[TenDV] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 30/10/2022 1:15:36 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](max) NULL,
	[GioiTinh] [varchar](10) NOT NULL,
	[DiaChi] [varchar](100) NULL,
	[SoDT] [varchar](15) NOT NULL,
	[NgayDK] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 30/10/2022 1:15:36 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoaiSP] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiSP] [nvarchar](max) NULL,
	[LoiNhuan] [decimal](2, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 30/10/2022 1:15:36 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[MaND] [int] IDENTITY(1,1) NOT NULL,
	[TenND] [nvarchar](max) NULL,
	[TenDangNhap] [nvarchar](max) NULL,
	[MatKhau] [nvarchar](max) NULL,
	[MaQH] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 30/10/2022 1:15:36 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](max) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[SoDT] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuBan]    Script Date: 30/10/2022 1:15:36 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuBan](
	[MaPhieu] [nvarchar](128) NOT NULL,
	[NgayLap] [datetime] NULL,
	[MaKH] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuMua]    Script Date: 30/10/2022 1:15:36 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuMua](
	[MaPhieu] [nvarchar](128) NOT NULL,
	[NgayLap] [datetime] NULL,
	[MaNCC] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuyenHan]    Script Date: 30/10/2022 1:15:36 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyenHan](
	[MaQH] [int] IDENTITY(1,1) NOT NULL,
	[TenQH] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaQH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 30/10/2022 1:15:36 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [nvarchar](128) NOT NULL,
	[TenSP] [nvarchar](max) NULL,
	[DonGia] [money] NULL,
	[MaLoaiSP] [int] NOT NULL,
	[MaDV] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'1', N'1', N'1', 120)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'10', N'3', N'10', 434)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'2', N'1', N'2', 320)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'3', N'1', N'3', 400)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'4', N'2', N'4', 600)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'5', N'2', N'5', 500)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'6', N'2', N'6', 322)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'7', N'3', N'7', 435)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'8', N'3', N'8', 655)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'9', N'3', N'9', 77)
GO
SET IDENTITY_INSERT [dbo].[DonVi] ON 

INSERT [dbo].[DonVi] ([MaDV], [TenDV]) VALUES (1, N'cái')
INSERT [dbo].[DonVi] ([MaDV], [TenDV]) VALUES (2, N'chỉ')
INSERT [dbo].[DonVi] ([MaDV], [TenDV]) VALUES (3, N'lượng')
INSERT [dbo].[DonVi] ([MaDV], [TenDV]) VALUES (4, N'carat')
SET IDENTITY_INSERT [dbo].[DonVi] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [DiaChi], [SoDT], [NgayDK]) VALUES (42, N'Hoàng', N'Nu', N'hcm', N'03423423', CAST(N'2022-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [DiaChi], [SoDT], [NgayDK]) VALUES (46, N'Hoang', N'Nam', N'hn', N'023564234', CAST(N'2022-02-10T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiSanPham] ON 

INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [LoiNhuan]) VALUES (1, N'Nhẫn', CAST(0.22 AS Decimal(2, 2)))
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [LoiNhuan]) VALUES (2, N'Vòng tay', CAST(0.30 AS Decimal(2, 2)))
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [LoiNhuan]) VALUES (3, N'Vòng cổ', CAST(0.17 AS Decimal(2, 2)))
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [LoiNhuan]) VALUES (4, N'Vàng miếng', CAST(0.13 AS Decimal(2, 2)))
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [LoiNhuan]) VALUES (5, N'Đá quý', CAST(0.33 AS Decimal(2, 2)))
SET IDENTITY_INSERT [dbo].[LoaiSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([MaND], [TenND], [TenDangNhap], [MatKhau], [MaQH]) VALUES (1, N'ADMIN', N'admin', N'db69fc039dcbd2962cb4d28f5891aae1', 1)
INSERT [dbo].[NguoiDung] ([MaND], [TenND], [TenDangNhap], [MatKhau], [MaQH]) VALUES (2, N'An Bùi', N'builehoaian', N'3f9522b5b2bf39683f32e7dd1c4fcca3', 1)
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SoDT]) VALUES (1, N'Bùi An', N'Thủ Đức', N'0123321123')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SoDT]) VALUES (2, N'Vẫn là Bùi An', N'Bình Dương', N'0321321123')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SoDT]) VALUES (3, N'Vẫn là Bùi Ann nhưng có 2 chữ n', N'Đà Nẵng', N'0423234432')
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
GO
INSERT [dbo].[PhieuMua] ([MaPhieu], [NgayLap], [MaNCC]) VALUES (N'1', CAST(N'2022-10-21T10:17:21.320' AS DateTime), 1)
INSERT [dbo].[PhieuMua] ([MaPhieu], [NgayLap], [MaNCC]) VALUES (N'2', CAST(N'2022-10-21T10:17:21.320' AS DateTime), 2)
INSERT [dbo].[PhieuMua] ([MaPhieu], [NgayLap], [MaNCC]) VALUES (N'3', CAST(N'2022-10-21T10:17:21.320' AS DateTime), 3)
GO
SET IDENTITY_INSERT [dbo].[QuyenHan] ON 

INSERT [dbo].[QuyenHan] ([MaQH], [TenQH]) VALUES (1, N'Admin')
INSERT [dbo].[QuyenHan] ([MaQH], [TenQH]) VALUES (2, N'Nhân viên')
SET IDENTITY_INSERT [dbo].[QuyenHan] OFF
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [MaLoaiSP], [MaDV]) VALUES (N'1', N'Nhẫn 101', 1232122.7000, 1, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [MaLoaiSP], [MaDV]) VALUES (N'10', N'Nhẫn ruby', 912302.2000, 5, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [MaLoaiSP], [MaDV]) VALUES (N'2', N'Nhẫn 102', 322.2000, 1, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [MaLoaiSP], [MaDV]) VALUES (N'3', N'Vòng 101', 7289.7000, 2, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [MaLoaiSP], [MaDV]) VALUES (N'4', N'Vòng 102', 32802.2000, 2, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [MaLoaiSP], [MaDV]) VALUES (N'5', N'Vòng 103', 12122.7000, 3, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [MaLoaiSP], [MaDV]) VALUES (N'6', N'Vòng 104', 902.2000, 3, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [MaLoaiSP], [MaDV]) VALUES (N'7', N'Vàng tây 95', 1123.0000, 4, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [MaLoaiSP], [MaDV]) VALUES (N'8', N'Vòng ta 99', 1200.2000, 4, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [MaLoaiSP], [MaDV]) VALUES (N'9', N'Nhẫn saphire', 2313.2200, 5, 4)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KhachHan__BC3D04C9A6DAB398]    Script Date: 30/10/2022 1:15:36 pm ******/
ALTER TABLE [dbo].[KhachHang] ADD UNIQUE NONCLUSTERED 
(
	[SoDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KhachHang] ADD  DEFAULT (getdate()) FOR [NgayDK]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ((0)) FOR [DonGia]
GO
ALTER TABLE [dbo].[ChiTietPhieuBan]  WITH CHECK ADD FOREIGN KEY([MaPhieu])
REFERENCES [dbo].[PhieuBan] ([MaPhieu])
GO
ALTER TABLE [dbo].[ChiTietPhieuBan]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietPhieuMua]  WITH CHECK ADD FOREIGN KEY([MaPhieu])
REFERENCES [dbo].[PhieuMua] ([MaPhieu])
GO
ALTER TABLE [dbo].[ChiTietPhieuMua]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD FOREIGN KEY([MaQH])
REFERENCES [dbo].[QuyenHan] ([MaQH])
GO
ALTER TABLE [dbo].[PhieuBan]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[PhieuMua]  WITH CHECK ADD FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaDV])
REFERENCES [dbo].[DonVi] ([MaDV])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaLoaiSP])
REFERENCES [dbo].[LoaiSanPham] ([MaLoaiSP])
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD CHECK  (([GioiTinh]='Nu' OR [GioiTinh]='Nam'))
GO
USE [master]
GO
ALTER DATABASE [VBDQEntityDB] SET  READ_WRITE 
GO
