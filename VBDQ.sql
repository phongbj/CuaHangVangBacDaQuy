USE [master]
GO
/****** Object:  Database [VBDQEntityDB]    Script Date: 30/11/2022 1:30:28 CH ******/
CREATE DATABASE [VBDQEntityDB]

GO
USE [VBDQEntityDB]
GO
/****** Object:  Table [dbo].[ChiTietPhieuBan]    Script Date: 30/11/2022 1:30:28 CH ******/
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
/****** Object:  Table [dbo].[ChiTietPhieuMua]    Script Date: 30/11/2022 1:30:28 CH ******/
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
/****** Object:  Table [dbo].[DonVi]    Script Date: 30/11/2022 1:30:28 CH ******/
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
/****** Object:  Table [dbo].[KhachHang]    Script Date: 30/11/2022 1:30:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](max) NULL,
	[GioiTinh] [nvarchar](4) NOT NULL,
	[DiaChi] [nvarchar](max) NOT NULL,
	[SoDT] [nvarchar](10) NOT NULL,
	[NgayDK] [datetime] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 30/11/2022 1:30:28 CH ******/
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
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 30/11/2022 1:30:28 CH ******/
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
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 30/11/2022 1:30:28 CH ******/
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
/****** Object:  Table [dbo].[PhieuBan]    Script Date: 30/11/2022 1:30:28 CH ******/
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
/****** Object:  Table [dbo].[PhieuMua]    Script Date: 30/11/2022 1:30:28 CH ******/
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
/****** Object:  Table [dbo].[QuyenHan]    Script Date: 30/11/2022 1:30:28 CH ******/
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
/****** Object:  Table [dbo].[SanPham]    Script Date: 30/11/2022 1:30:28 CH ******/
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
INSERT [dbo].[ChiTietPhieuBan] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'075dbed3-721d-4b12-ab7d-ac77c70c4c82', N'ede350ef-806b-4673-8ba2-4f7454d298cc', N'7ad2dbc4-5c4f-41d2-8a2d-d264a06a1d15', 2)
INSERT [dbo].[ChiTietPhieuBan] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'12966d8a-7291-47b5-9e8c-b97bbfaf1b5c', N'365e5d04-c8d6-4f6a-82b2-9e3958cd0d48', N'1217b7ee-b10a-4dd7-8799-f534ca871ba7', 2)
INSERT [dbo].[ChiTietPhieuBan] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'259576b2-ddc0-4671-a616-3657fbe16950', N'3bf13abe-416b-490e-99df-b8040cd00c38', N'4575ccf2-e48e-42a1-8366-538904b487e0', 2)
INSERT [dbo].[ChiTietPhieuBan] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'271808f4-d798-4cd5-aafd-dd37c2ef20f4', N'1ca5200d-9be2-4ef6-8d8e-a9f11312cb90', N'4508da01-81ef-4c43-b694-316c311c572f', 2)
INSERT [dbo].[ChiTietPhieuBan] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'384b1c3b-f8a1-489a-9bd4-eb5c9ec32b18', N'7bf4070f-9fc8-4afe-90bb-7dc672f8226e', N'd6b403a8-823f-4069-bfdb-e750950c3f6c', 32)
INSERT [dbo].[ChiTietPhieuBan] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'44299e76-1d00-4bdd-875f-432c842ac3ed', N'ede350ef-806b-4673-8ba2-4f7454d298cc', N'4575ccf2-e48e-42a1-8366-538904b487e0', 12)
INSERT [dbo].[ChiTietPhieuBan] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'445db327-27a5-4ab4-a99d-59c4aff0af80', N'1ca5200d-9be2-4ef6-8d8e-a9f11312cb90', N'40c7cd6b-6a8d-40a2-9359-c9ca9734d610', 2)
INSERT [dbo].[ChiTietPhieuBan] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'4dff92dd-aaf0-40fd-8705-27c14690bb99', N'4ed08129-5001-42c6-91c7-c34809f388ba', N'3732f03f-bfc3-4579-a5f7-9ad71e121c67', 2)
INSERT [dbo].[ChiTietPhieuBan] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'4fcf4987-7834-497b-885a-b0dcb46e1b3c', N'ede350ef-806b-4673-8ba2-4f7454d298cc', N'83b64323-a6df-45aa-840c-4c91a8e3240b', 3)
INSERT [dbo].[ChiTietPhieuBan] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'54602e95-2079-4971-a364-c6dd5f9d3022', N'3bf13abe-416b-490e-99df-b8040cd00c38', N'83b64323-a6df-45aa-840c-4c91a8e3240b', 32)
INSERT [dbo].[ChiTietPhieuBan] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'553a7938-07f2-46d5-b54b-d59daa66cf79', N'7bf4070f-9fc8-4afe-90bb-7dc672f8226e', N'bbed544d-79fd-428d-a56e-ecefcfa89f63', 2)
INSERT [dbo].[ChiTietPhieuBan] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'7ca27227-a5d4-4508-a03f-df1221063987', N'3bf13abe-416b-490e-99df-b8040cd00c38', N'7ad2dbc4-5c4f-41d2-8a2d-d264a06a1d15', 32)
INSERT [dbo].[ChiTietPhieuBan] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'8b7a1e67-d883-4e99-aecb-92cf56b4fbae', N'3ecd003c-71ad-4955-9cac-f21a80469865', N'ac89854d-c44b-4f76-ae47-04168199f550', 9)
INSERT [dbo].[ChiTietPhieuBan] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'94267acc-74e2-4181-afde-7b6d9c1be058', N'3ecd003c-71ad-4955-9cac-f21a80469865', N'89f817de-68b1-40cd-8968-fba2f4fc43bd', 12)
INSERT [dbo].[ChiTietPhieuBan] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'9520aea5-b302-42a7-b06c-7b698fb3bb4f', N'4ed08129-5001-42c6-91c7-c34809f388ba', N'83b64323-a6df-45aa-840c-4c91a8e3240b', 3)
INSERT [dbo].[ChiTietPhieuBan] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'9c81f53a-f447-445a-bd8a-a282f654855a', N'3ecd003c-71ad-4955-9cac-f21a80469865', N'b3a9c61d-35ad-490c-8ac3-fbdbe8b0f3be', 2)
INSERT [dbo].[ChiTietPhieuBan] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'9e270c0c-bb53-4d29-a84d-cc1505d5fb82', N'1ca5200d-9be2-4ef6-8d8e-a9f11312cb90', N'3c3055c8-5c88-4cc8-b069-7e26e5706982', 13)
INSERT [dbo].[ChiTietPhieuBan] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'bc0af4eb-c659-475b-bb50-aec90633abdd', N'449ced16-1f48-4ce2-88cc-07e8ab2aead4', N'2ab9009e-4f40-47db-92d9-7acbdb3b0a73', 2)
INSERT [dbo].[ChiTietPhieuBan] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'bf102571-4d93-4e84-8475-7c2cfbb28e62', N'449ced16-1f48-4ce2-88cc-07e8ab2aead4', N'3732f03f-bfc3-4579-a5f7-9ad71e121c67', 3)
INSERT [dbo].[ChiTietPhieuBan] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'e708cdb8-d7cd-4e6d-a725-c5c7d69ddfce', N'4ed08129-5001-42c6-91c7-c34809f388ba', N'ac89854d-c44b-4f76-ae47-04168199f550', 4)
INSERT [dbo].[ChiTietPhieuBan] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'f98bffb4-2ad9-41c6-871f-b03956aafd1d', N'449ced16-1f48-4ce2-88cc-07e8ab2aead4', N'1217b7ee-b10a-4dd7-8799-f534ca871ba7', 1)
INSERT [dbo].[ChiTietPhieuBan] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'fc61ea40-275b-4d56-9793-a6b2b775c98c', N'b3f72cb7-0e1e-49f4-a606-82aa273fe3b8', N'2ab9009e-4f40-47db-92d9-7acbdb3b0a73', 2)
GO
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'0db19a67-1d21-4d08-a6b3-029334f53a29', N'3cf850d5-8bb4-46d0-a3a2-371693af6090', N'2ab9009e-4f40-47db-92d9-7acbdb3b0a73', 23)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'11f698dd-c9fe-4f51-b65d-88233864fd62', N'ddeea133-e0ad-4e25-9652-086acf6d501d', N'89f817de-68b1-40cd-8968-fba2f4fc43bd', 13)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'1288328d-2b92-4fb3-ac8b-6634fb2d73e1', N'3cf850d5-8bb4-46d0-a3a2-371693af6090', N'b3a9c61d-35ad-490c-8ac3-fbdbe8b0f3be', 87)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'141ab82e-7e8e-4278-b87f-bf8e0b31699e', N'6ce27a52-98f7-4fd9-b310-dc49241ee9bf', N'1217b7ee-b10a-4dd7-8799-f534ca871ba7', 100)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'16cecc01-eef9-408b-92f0-c5f04e560f9c', N'694eac38-c998-4a17-802c-c45203e795ac', N'2ab9009e-4f40-47db-92d9-7acbdb3b0a73', 1)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'170db433-f604-4be2-9ff1-bba670b09bb1', N'24f5b2d9-ad68-4749-aeae-50d07e38ed4f', N'4508da01-81ef-4c43-b694-316c311c572f', 64)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'1f4d33d0-7b86-4f3c-a132-e04cde3972f8', N'92713ceb-3ddf-4f9b-86c3-f7160fc89b01', N'7ad2dbc4-5c4f-41d2-8a2d-d264a06a1d15', 12)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'29a1e1b9-52b9-43f6-8a19-5205933fa4d7', N'24f5b2d9-ad68-4749-aeae-50d07e38ed4f', N'4575ccf2-e48e-42a1-8366-538904b487e0', 432)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'2d341055-3c01-4554-86af-ff6a513f17d7', N'4407c3df-4735-4a78-b2dd-347770fb9e82', N'ac89854d-c44b-4f76-ae47-04168199f550', 20)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'2e1472c7-3b06-4301-8f7c-046d62d766a3', N'92713ceb-3ddf-4f9b-86c3-f7160fc89b01', N'd6b403a8-823f-4069-bfdb-e750950c3f6c', 233)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'30865cca-60ff-457e-aefa-b8cc9952d767', N'4407c3df-4735-4a78-b2dd-347770fb9e82', N'4508da01-81ef-4c43-b694-316c311c572f', 30)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'3fa02fbc-9019-464d-861e-3a88cfc1b70f', N'6ce27a52-98f7-4fd9-b310-dc49241ee9bf', N'40c7cd6b-6a8d-40a2-9359-c9ca9734d610', 100)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'42041b1e-13f4-4141-a3d2-6cc8541984b9', N'6ce27a52-98f7-4fd9-b310-dc49241ee9bf', N'3732f03f-bfc3-4579-a5f7-9ad71e121c67', 100)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'4362620d-0cff-4c72-aae8-ddcf6571a859', N'24f5b2d9-ad68-4749-aeae-50d07e38ed4f', N'89f817de-68b1-40cd-8968-fba2f4fc43bd', 343)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'46c026b4-53f2-4182-86cc-eaba3d0c4d2a', N'ddeea133-e0ad-4e25-9652-086acf6d501d', N'b3a9c61d-35ad-490c-8ac3-fbdbe8b0f3be', 21)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'4d63a412-7ff7-406c-b8dd-92bf72afe034', N'58d27818-96e8-46eb-b9d9-4e8ce1b48663', N'2ab9009e-4f40-47db-92d9-7acbdb3b0a73', 100)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'594c58c3-7e35-4559-8683-18fa4ee3c9c9', N'24f5b2d9-ad68-4749-aeae-50d07e38ed4f', N'7ad2dbc4-5c4f-41d2-8a2d-d264a06a1d15', 34)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'5b79b274-25b1-4182-a7bb-440ab7de950d', N'a8b2f5f2-7659-4a1e-8e97-caa96c9a6548', N'ac89854d-c44b-4f76-ae47-04168199f550', 23)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'6335a946-5805-4f4a-a40d-347997435612', N'92713ceb-3ddf-4f9b-86c3-f7160fc89b01', N'83b64323-a6df-45aa-840c-4c91a8e3240b', 21)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'6d66ea82-6abf-4cfa-8cf0-0b4b1443f454', N'5210654c-3d94-457b-bf2f-6e2dd098d736', N'7ad2dbc4-5c4f-41d2-8a2d-d264a06a1d15', 100)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'6e0d60dc-2cda-46aa-9754-18a408b3dbec', N'6ce27a52-98f7-4fd9-b310-dc49241ee9bf', N'2ab9009e-4f40-47db-92d9-7acbdb3b0a73', 100)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'744a48a8-6ba6-4bb8-879c-8ba0aae05d0b', N'92713ceb-3ddf-4f9b-86c3-f7160fc89b01', N'ac89854d-c44b-4f76-ae47-04168199f550', 23)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'7dfb057b-a511-44e9-9a17-3393b62527b3', N'92713ceb-3ddf-4f9b-86c3-f7160fc89b01', N'bbed544d-79fd-428d-a56e-ecefcfa89f63', 23)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'84446f2f-a6ef-4255-8698-bec298195387', N'58d27818-96e8-46eb-b9d9-4e8ce1b48663', N'3732f03f-bfc3-4579-a5f7-9ad71e121c67', 50)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'850c8f17-fa8b-4f1b-bbd0-b8e9acf114f7', N'5210654c-3d94-457b-bf2f-6e2dd098d736', N'3732f03f-bfc3-4579-a5f7-9ad71e121c67', 50)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'89147d53-a39a-4989-bfaa-3cfb35acce24', N'4407c3df-4735-4a78-b2dd-347770fb9e82', N'40c7cd6b-6a8d-40a2-9359-c9ca9734d610', 122)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'8bbf4f5d-9c2a-49e7-9ae0-4650e39f6d3c', N'24f5b2d9-ad68-4749-aeae-50d07e38ed4f', N'40c7cd6b-6a8d-40a2-9359-c9ca9734d610', 123)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'90f2dba6-6fa0-4799-ab0c-f0360a250975', N'92713ceb-3ddf-4f9b-86c3-f7160fc89b01', N'89f817de-68b1-40cd-8968-fba2f4fc43bd', 200)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'9dc14258-46cd-4171-beec-698824512e72', N'6ce27a52-98f7-4fd9-b310-dc49241ee9bf', N'3c3055c8-5c88-4cc8-b069-7e26e5706982', 110)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'9e56e049-1ad0-43ee-a932-fa04fa46b983', N'24f5b2d9-ad68-4749-aeae-50d07e38ed4f', N'83b64323-a6df-45aa-840c-4c91a8e3240b', 434)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'b46da1f2-6c21-4382-8d30-145c281c15f0', N'58d27818-96e8-46eb-b9d9-4e8ce1b48663', N'40c7cd6b-6a8d-40a2-9359-c9ca9734d610', 100)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'b69ada8f-433c-4a10-8e1b-a281a3335021', N'58d27818-96e8-46eb-b9d9-4e8ce1b48663', N'4508da01-81ef-4c43-b694-316c311c572f', 100)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'cdfb684a-0c7b-479a-98e6-c88c05a4fde7', N'3cf850d5-8bb4-46d0-a3a2-371693af6090', N'bbed544d-79fd-428d-a56e-ecefcfa89f63', 132)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'd153d697-20d3-4127-a9de-97e9476479c3', N'7f49db86-e28a-476a-bda9-f84db34803e1', N'2ab9009e-4f40-47db-92d9-7acbdb3b0a73', 2)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'd233e91d-37f6-4a41-bf03-ba10e671f51f', N'a8b2f5f2-7659-4a1e-8e97-caa96c9a6548', N'3c3055c8-5c88-4cc8-b069-7e26e5706982', 1)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'd31de353-ac4b-46d2-8fca-df76181c6b61', N'58d27818-96e8-46eb-b9d9-4e8ce1b48663', N'3c3055c8-5c88-4cc8-b069-7e26e5706982', 20)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'dc831a51-20d4-42a3-b415-056c71cbc3aa', N'92713ceb-3ddf-4f9b-86c3-f7160fc89b01', N'b3a9c61d-35ad-490c-8ac3-fbdbe8b0f3be', 20)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'de04ccb8-9a12-4fd9-8a81-e906e414939e', N'5210654c-3d94-457b-bf2f-6e2dd098d736', N'3c3055c8-5c88-4cc8-b069-7e26e5706982', 50)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'e669a297-16c1-4f30-9fea-58ed032f26d3', N'3cf850d5-8bb4-46d0-a3a2-371693af6090', N'ac89854d-c44b-4f76-ae47-04168199f550', 60)
INSERT [dbo].[ChiTietPhieuMua] ([MaChiTietPhieu], [MaPhieu], [MaSP], [SoLuong]) VALUES (N'f8a61683-3d88-4b18-92c1-d796e60e7318', N'a8b2f5f2-7659-4a1e-8e97-caa96c9a6548', N'89f817de-68b1-40cd-8968-fba2f4fc43bd', 12)
GO
SET IDENTITY_INSERT [dbo].[DonVi] ON 

INSERT [dbo].[DonVi] ([MaDV], [TenDV]) VALUES (1, N'cái')
INSERT [dbo].[DonVi] ([MaDV], [TenDV]) VALUES (2, N'chỉ')
INSERT [dbo].[DonVi] ([MaDV], [TenDV]) VALUES (3, N'lượng')
INSERT [dbo].[DonVi] ([MaDV], [TenDV]) VALUES (4, N'carat')
SET IDENTITY_INSERT [dbo].[DonVi] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [DiaChi], [SoDT], [NgayDK]) VALUES (1, N'Trần Trọng Hoàng', N'Nam', N'Hồ Chí Minh', N'0923234345', CAST(N'2022-10-21T10:17:21.320' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [DiaChi], [SoDT], [NgayDK]) VALUES (2, N'Bùi Lê Hoài An', N'Nam', N'Đà Nẵng', N'0929812532', CAST(N'2022-10-21T10:17:21.320' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [DiaChi], [SoDT], [NgayDK]) VALUES (3, N'Lý Hồng Phong', N'Nam', N'Thủ Đức', N'0931242564', CAST(N'2022-10-21T10:17:21.320' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [DiaChi], [SoDT], [NgayDK]) VALUES (4, N'Nguyễn Văn A', N'Nam', N'Quận 9, Thành Phố Hồ Chí Minh', N'0912332123', CAST(N'2022-11-16T22:22:04.647' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [DiaChi], [SoDT], [NgayDK]) VALUES (5, N'Lê Thị B', N'Nu', N'Tân Bình, Hồ Chí Minh', N'0913987345', CAST(N'2022-11-17T15:41:52.820' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [DiaChi], [SoDT], [NgayDK]) VALUES (6, N'Đỗ Thị C', N'Nu', N'Phú Nhuận, Hồ Chí Minh', N'0932875235', CAST(N'2022-11-17T15:42:57.940' AS DateTime))
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
INSERT [dbo].[NguoiDung] ([MaND], [TenND], [TenDangNhap], [MatKhau], [MaQH]) VALUES (2, N'An Bùi', N'builehoaian', N'9c600b0cee325636ffbaac14db0841c4', 2)
INSERT [dbo].[NguoiDung] ([MaND], [TenND], [TenDangNhap], [MatKhau], [MaQH]) VALUES (3, N'Nhân viên 1', N'staff1', N'0b8b946432f1ac91f0b07bd5f8df6587', 3)
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SoDT]) VALUES (1, N'Công ty Đá Quý 123', N'Gò Vấp, Hồ Chí Minh', N'0921321122')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SoDT]) VALUES (2, N'Xưởng đúc vàng Linh Trung', N'Linh Trung, Thủ Đức, Hồ Chí Minh', N'0972845928')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SoDT]) VALUES (3, N'Cơ sở Mỹ Nghệ 1', N'Thủ Dầu 1, Bình Dương', N'0912917471')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SoDT]) VALUES (4, N'Cơ sở Mỹ Nghệ 2', N'Thủ Dầu 1', N'0981876123')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SoDT]) VALUES (5, N'Cơ sở Mỹ Nghệ 3', N'Quận 1, Hồ Chí Minh', N'0912987234')
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
GO
INSERT [dbo].[PhieuBan] ([MaPhieu], [NgayLap], [MaKH]) VALUES (N'1ca5200d-9be2-4ef6-8d8e-a9f11312cb90', CAST(N'2022-11-17T17:01:55.517' AS DateTime), 2)
INSERT [dbo].[PhieuBan] ([MaPhieu], [NgayLap], [MaKH]) VALUES (N'365e5d04-c8d6-4f6a-82b2-9e3958cd0d48', CAST(N'2022-11-17T17:07:10.407' AS DateTime), 4)
INSERT [dbo].[PhieuBan] ([MaPhieu], [NgayLap], [MaKH]) VALUES (N'3bf13abe-416b-490e-99df-b8040cd00c38', CAST(N'2022-11-17T17:03:13.863' AS DateTime), 4)
INSERT [dbo].[PhieuBan] ([MaPhieu], [NgayLap], [MaKH]) VALUES (N'3ecd003c-71ad-4955-9cac-f21a80469865', CAST(N'2022-11-17T17:04:02.123' AS DateTime), 5)
INSERT [dbo].[PhieuBan] ([MaPhieu], [NgayLap], [MaKH]) VALUES (N'449ced16-1f48-4ce2-88cc-07e8ab2aead4', CAST(N'2022-11-17T17:00:19.873' AS DateTime), 1)
INSERT [dbo].[PhieuBan] ([MaPhieu], [NgayLap], [MaKH]) VALUES (N'4ed08129-5001-42c6-91c7-c34809f388ba', CAST(N'2022-11-17T17:05:04.463' AS DateTime), 2)
INSERT [dbo].[PhieuBan] ([MaPhieu], [NgayLap], [MaKH]) VALUES (N'7bf4070f-9fc8-4afe-90bb-7dc672f8226e', CAST(N'2022-11-17T17:04:38.003' AS DateTime), 6)
INSERT [dbo].[PhieuBan] ([MaPhieu], [NgayLap], [MaKH]) VALUES (N'b3f72cb7-0e1e-49f4-a606-82aa273fe3b8', CAST(N'2022-11-17T17:08:08.270' AS DateTime), 3)
INSERT [dbo].[PhieuBan] ([MaPhieu], [NgayLap], [MaKH]) VALUES (N'ede350ef-806b-4673-8ba2-4f7454d298cc', CAST(N'2022-11-17T17:02:37.073' AS DateTime), 1)
GO
INSERT [dbo].[PhieuMua] ([MaPhieu], [NgayLap], [MaNCC]) VALUES (N'24f5b2d9-ad68-4749-aeae-50d07e38ed4f', CAST(N'2022-11-17T16:44:38.130' AS DateTime), 3)
INSERT [dbo].[PhieuMua] ([MaPhieu], [NgayLap], [MaNCC]) VALUES (N'3cf850d5-8bb4-46d0-a3a2-371693af6090', CAST(N'2022-11-17T16:46:59.383' AS DateTime), 5)
INSERT [dbo].[PhieuMua] ([MaPhieu], [NgayLap], [MaNCC]) VALUES (N'4407c3df-4735-4a78-b2dd-347770fb9e82', CAST(N'2022-11-17T16:47:30.783' AS DateTime), 2)
INSERT [dbo].[PhieuMua] ([MaPhieu], [NgayLap], [MaNCC]) VALUES (N'5210654c-3d94-457b-bf2f-6e2dd098d736', CAST(N'2022-11-17T16:48:35.597' AS DateTime), 1)
INSERT [dbo].[PhieuMua] ([MaPhieu], [NgayLap], [MaNCC]) VALUES (N'58d27818-96e8-46eb-b9d9-4e8ce1b48663', CAST(N'2022-11-17T16:42:54.767' AS DateTime), 2)
INSERT [dbo].[PhieuMua] ([MaPhieu], [NgayLap], [MaNCC]) VALUES (N'694eac38-c998-4a17-802c-c45203e795ac', CAST(N'2022-11-18T00:10:50.797' AS DateTime), 1)
INSERT [dbo].[PhieuMua] ([MaPhieu], [NgayLap], [MaNCC]) VALUES (N'6ce27a52-98f7-4fd9-b310-dc49241ee9bf', CAST(N'2022-11-17T16:41:38.960' AS DateTime), 1)
INSERT [dbo].[PhieuMua] ([MaPhieu], [NgayLap], [MaNCC]) VALUES (N'7f49db86-e28a-476a-bda9-f84db34803e1', CAST(N'2022-11-17T16:48:55.853' AS DateTime), 3)
INSERT [dbo].[PhieuMua] ([MaPhieu], [NgayLap], [MaNCC]) VALUES (N'92713ceb-3ddf-4f9b-86c3-f7160fc89b01', CAST(N'2022-11-17T16:46:09.990' AS DateTime), 4)
INSERT [dbo].[PhieuMua] ([MaPhieu], [NgayLap], [MaNCC]) VALUES (N'a8b2f5f2-7659-4a1e-8e97-caa96c9a6548', CAST(N'2022-11-17T16:49:31.150' AS DateTime), 1)
INSERT [dbo].[PhieuMua] ([MaPhieu], [NgayLap], [MaNCC]) VALUES (N'ddeea133-e0ad-4e25-9652-086acf6d501d', CAST(N'2022-11-17T16:46:25.603' AS DateTime), 5)
GO
SET IDENTITY_INSERT [dbo].[QuyenHan] ON 

INSERT [dbo].[QuyenHan] ([MaQH], [TenQH]) VALUES (1, N'Admin')
INSERT [dbo].[QuyenHan] ([MaQH], [TenQH]) VALUES (2, N'Quản lý')
INSERT [dbo].[QuyenHan] ([MaQH], [TenQH]) VALUES (3, N'Nhân viên')
SET IDENTITY_INSERT [dbo].[QuyenHan] OFF
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [MaLoaiSP], [MaDV]) VALUES (N'1217b7ee-b10a-4dd7-8799-f534ca871ba7', N'Nhẫn 102', 1.0000, 1, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [MaLoaiSP], [MaDV]) VALUES (N'2ab9009e-4f40-47db-92d9-7acbdb3b0a73', N'Đá Topaz', 4200002.0000, 5, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [MaLoaiSP], [MaDV]) VALUES (N'3732f03f-bfc3-4579-a5f7-9ad71e121c67', N'Kim cương', 3232210.0000, 1, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [MaLoaiSP], [MaDV]) VALUES (N'3c3055c8-5c88-4cc8-b069-7e26e5706982', N'Vàng Ý 750', 1200000.0000, 1, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [MaLoaiSP], [MaDV]) VALUES (N'40c7cd6b-6a8d-40a2-9359-c9ca9734d610', N'Đá ngọc lục bảo', 2202000.0000, 5, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [MaLoaiSP], [MaDV]) VALUES (N'4508da01-81ef-4c43-b694-316c311c572f', N'Đá ruby', 32122200.0000, 5, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [MaLoaiSP], [MaDV]) VALUES (N'4575ccf2-e48e-42a1-8366-538904b487e0', N'Nhẫn SJC 20', 1223100.0000, 1, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [MaLoaiSP], [MaDV]) VALUES (N'7ad2dbc4-5c4f-41d2-8a2d-d264a06a1d15', N'Đá cẩm thạch', 32100000.0000, 5, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [MaLoaiSP], [MaDV]) VALUES (N'83b64323-a6df-45aa-840c-4c91a8e3240b', N'Đá saphire', 3000000.0000, 1, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [MaLoaiSP], [MaDV]) VALUES (N'89f817de-68b1-40cd-8968-fba2f4fc43bd', N'Nhẫn SJC 22', 213392000.0000, 2, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [MaLoaiSP], [MaDV]) VALUES (N'ac89854d-c44b-4f76-ae47-04168199f550', N'Đá hổ phách', 2310000.0000, 5, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [MaLoaiSP], [MaDV]) VALUES (N'b3a9c61d-35ad-490c-8ac3-fbdbe8b0f3be', N'Vàng Ý 950', 1200000.0000, 1, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [MaLoaiSP], [MaDV]) VALUES (N'bbed544d-79fd-428d-a56e-ecefcfa89f63', N'Vàng trắng 14K', 1020000.0000, 4, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [MaLoaiSP], [MaDV]) VALUES (N'd6b403a8-823f-4069-bfdb-e750950c3f6c', N'Vàng trắng 24K', 8231000.0000, 4, 3)
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
ALTER TABLE [dbo].[PhieuBan]  WITH CHECK ADD  CONSTRAINT [FK_PhieuBan_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[PhieuBan] CHECK CONSTRAINT [FK_PhieuBan_KhachHang]
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
USE [master]
GO
ALTER DATABASE [VBDQEntityDB] SET  READ_WRITE 
GO
