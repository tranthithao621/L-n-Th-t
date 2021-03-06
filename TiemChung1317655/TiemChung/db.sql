USE [FPT]
GO
/****** Object:  StoredProcedure [dbo].[Proc_TimKiemVacxin]    Script Date: 3/1/2017 5:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Proc_TimKiemVacxin](
	@Tuoi int,
	@MaLoaiVacxin int,
	@TenVacxin nvarchar(100)
)as
	begin
	declare @query nvarchar(4000)
	declare @define nvarchar(4000)
	
	set @query = 'select distinct Vacxin.*,LoaiVacxin.TenLoaiVacxin FROM Vacxin,LoaiVacxin,CTVacXin where Vacxin.MaLoaiVacxin = LoaiVacxin.MaLoaiVacxin and CTVacXin.MaVacxin = Vacxin.MaVacxin';
	if(@tuoi is not null and @tuoi > -1)
		set @query = @query + ' and  (TuoiToiThieu <= @tuoi and TuoiToiDa >= @tuoi)'
	if(@MaLoaiVacxin is not null)
		set @query = @query + ' and  (LoaiVacxin.MaLoaiVacxin = @MaLoaiVacxin)'
	if(@TenVacxin is not null)
		set @query = @query + ' and  TenVacxin LIKE @TenVacxin'
	print @query
	set @define =  '@Tuoi int,
	@MaLoaiVacxin int,
	@TenVacxin nvarchar(100)'
	Execute sp_Executesql @query,@define,@Tuoi,@MaLoaiVacxin,@TenVacxin

	end

GO
/****** Object:  Table [dbo].[CTVacXin]    Script Date: 3/1/2017 5:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTVacXin](
	[MaVacxin] [int] NOT NULL,
	[HanSuDung] [date] NULL,
	[GiaBan] [int] NULL,
	[XuatXu] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
	[SoLuongConLai] [int] NULL,
	[MaLoNhap] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_CTVacXin_1] PRIMARY KEY CLUSTERED 
(
	[MaLoNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DangKi]    Script Date: 3/1/2017 5:16:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangKi](
	[MaKH] [int] NOT NULL,
	[MaVacxin] [int] NOT NULL,
	[NgayDat] [date] NOT NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_DangKi] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC,
	[MaVacxin] ASC,
	[NgayDat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 3/1/2017 5:16:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[Tuoi] [int] NULL,
	[Email] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Sodt] [nvarchar](50) NULL,
	[GioiTinh] [bit] NULL,
	[TenDangNhap] [nvarchar](50) NULL,
 CONSTRAINT [PK_Khachhang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LichSuTiemPhong]    Script Date: 3/1/2017 5:16:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichSuTiemPhong](
	[MaKH] [int] NOT NULL,
	[MaVacxin] [int] NOT NULL,
	[NgayTiem] [date] NOT NULL,
	[NgayTaiTiem] [date] NULL,
	[LanTiem] [int] NULL,
	[GiaBan] [int] NULL,
	[GhiChu] [nvarchar](100) NULL,
 CONSTRAINT [PK_LichSuTiemPhong_1] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC,
	[MaVacxin] ASC,
	[NgayTiem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiVacxin]    Script Date: 3/1/2017 5:16:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiVacxin](
	[MaLoaiVacxin] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiVacxin] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiVacxin] PRIMARY KEY CLUSTERED 
(
	[MaLoaiVacxin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 3/1/2017 5:16:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTaiKhoan] [nvarchar](50) NOT NULL,
	[TenDangNhap] [varchar](10) NOT NULL,
	[MatKhau] [varchar](50) NULL,
	[Quyen] [bit] NULL,
 CONSTRAINT [PK_TaiKhoan_1] PRIMARY KEY CLUSTERED 
(
	[MaTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vacxin]    Script Date: 3/1/2017 5:16:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vacxin](
	[MaVacxin] [int] IDENTITY(1,1) NOT NULL,
	[TenVacxin] [nvarchar](50) NULL,
	[MaLoaiVacxin] [int] NULL,
	[TuoiToiThieu] [int] NULL,
	[TuoiToiDa] [int] NULL,
	[SoMui] [int] NULL,
 CONSTRAINT [PK_Vacxin] PRIMARY KEY CLUSTERED 
(
	[MaVacxin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[TK_SoLuongVacxinTheoNgay]    Script Date: 3/1/2017 5:16:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TK_SoLuongVacxinTheoNgay]
AS
SELECT        dbo.Vacxin.TenVacxin, COUNT(dbo.Vacxin.MaVacxin) AS SoLuong, dbo.Vacxin.MaVacxin, dbo.DangKi.NgayDat
FROM            dbo.DangKi INNER JOIN
                         dbo.Vacxin ON dbo.DangKi.MaVacxin = dbo.Vacxin.MaVacxin
WHERE        (dbo.DangKi.TrangThai = 0)
GROUP BY dbo.Vacxin.TenVacxin, dbo.Vacxin.MaVacxin, dbo.DangKi.TrangThai, dbo.DangKi.NgayDat


GO
/****** Object:  View [dbo].[TK_VacxinDaTiem]    Script Date: 3/1/2017 5:16:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TK_VacxinDaTiem]
AS
SELECT        TOP (100) PERCENT dbo.Vacxin.TenVacxin, COUNT(dbo.Vacxin.MaVacxin) AS SoLuong, dbo.Vacxin.MaVacxin
FROM            dbo.LichSuTiemPhong INNER JOIN
                         dbo.Vacxin ON dbo.LichSuTiemPhong.MaVacxin = dbo.Vacxin.MaVacxin
GROUP BY dbo.Vacxin.TenVacxin, dbo.Vacxin.MaVacxin
ORDER BY SoLuong


GO
/****** Object:  View [dbo].[View_1]    Script Date: 3/1/2017 5:16:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        dbo.Vacxin.MaVacxin, dbo.Vacxin.TenVacxin, dbo.CTVacXin.HanSuDung, dbo.CTVacXin.SoLuong
FROM            dbo.CTVacXin INNER JOIN
                         dbo.Vacxin ON dbo.CTVacXin.MaVacxin = dbo.Vacxin.MaVacxin




GO
/****** Object:  View [dbo].[View_2]    Script Date: 3/1/2017 5:16:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_2]
AS
SELECT        MaVacxin, SUM(SoLuong) AS sl
FROM            dbo.CTVacXin
GROUP BY MaVacxin




GO
/****** Object:  View [dbo].[View_3]    Script Date: 3/1/2017 5:16:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_3]
AS
SELECT        COUNT(dbo.LichSuTiemPhong.MaVacxin) AS soluong, dbo.Vacxin.TenVacxin, dbo.LichSuTiemPhong.NgayTiem, dbo.LichSuTiemPhong.MaVacxin
FROM            dbo.LichSuTiemPhong INNER JOIN
                         dbo.Vacxin ON dbo.LichSuTiemPhong.MaVacxin = dbo.Vacxin.MaVacxin
GROUP BY dbo.LichSuTiemPhong.MaVacxin, dbo.Vacxin.TenVacxin, dbo.LichSuTiemPhong.NgayTiem




GO
/****** Object:  View [dbo].[View_4]    Script Date: 3/1/2017 5:16:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_4]
AS
SELECT        dbo.Vacxin.MaVacxin, dbo.Vacxin.TenVacxin, dbo.CTVacXin.HanSuDung, dbo.CTVacXin.SoLuong
FROM            dbo.CTVacXin INNER JOIN
                         dbo.Vacxin ON dbo.CTVacXin.MaVacxin = dbo.Vacxin.MaVacxin
WHERE        (dbo.CTVacXin.HanSuDung <= GETDATE())




GO
/****** Object:  View [dbo].[View_5]    Script Date: 3/1/2017 5:16:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_5]
AS
SELECT        dbo.LichSuTiemPhong.MaVacxin, dbo.Vacxin.TenVacxin, COUNT(dbo.LichSuTiemPhong.MaVacxin) AS soluong
FROM            dbo.LichSuTiemPhong INNER JOIN
                         dbo.Vacxin ON dbo.LichSuTiemPhong.MaVacxin = dbo.Vacxin.MaVacxin
GROUP BY dbo.LichSuTiemPhong.MaVacxin, dbo.Vacxin.TenVacxin




GO
/****** Object:  View [dbo].[View_6]    Script Date: 3/1/2017 5:16:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_6]
AS
SELECT DISTINCT dbo.KhachHang.MaKH, dbo.KhachHang.TenKH, dbo.Vacxin.TenVacxin, dbo.DangKi.NgayDat, dbo.LichSuTiemPhong.NgayTaiTiem
FROM            dbo.DangKi INNER JOIN
                         dbo.KhachHang ON dbo.DangKi.MaKH = dbo.KhachHang.MaKH INNER JOIN
                         dbo.LichSuTiemPhong ON dbo.KhachHang.MaKH = dbo.LichSuTiemPhong.MaKH INNER JOIN
                         dbo.Vacxin ON dbo.DangKi.MaKH = dbo.Vacxin.MaVacxin AND dbo.LichSuTiemPhong.MaVacxin = dbo.Vacxin.MaVacxin




GO
/****** Object:  View [dbo].[View_7]    Script Date: 3/1/2017 5:16:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_7]
AS
SELECT DISTINCT dbo.KhachHang.MaKH, dbo.KhachHang.TenKH, dbo.Vacxin.TenVacxin, dbo.DangKi.NgayDat, dbo.LichSuTiemPhong.NgayTiem
FROM            dbo.DangKi INNER JOIN
                         dbo.KhachHang ON dbo.DangKi.MaKH = dbo.KhachHang.MaKH INNER JOIN
                         dbo.LichSuTiemPhong ON dbo.KhachHang.MaKH = dbo.LichSuTiemPhong.MaKH INNER JOIN
                         dbo.Vacxin ON dbo.DangKi.MaKH = dbo.Vacxin.MaVacxin AND dbo.LichSuTiemPhong.MaVacxin = dbo.Vacxin.MaVacxin




GO
SET IDENTITY_INSERT [dbo].[CTVacXin] ON 

INSERT [dbo].[CTVacXin] ([MaVacxin], [HanSuDung], [GiaBan], [XuatXu], [SoLuong], [SoLuongConLai], [MaLoNhap]) VALUES (1023, CAST(0x0E3E0B00 AS Date), 75000, N'Việt Nam', 50, 50, 1014)
INSERT [dbo].[CTVacXin] ([MaVacxin], [HanSuDung], [GiaBan], [XuatXu], [SoLuong], [SoLuongConLai], [MaLoNhap]) VALUES (1023, CAST(0x0E3E0B00 AS Date), 85000, N'Mỹ', 30, 30, 1015)
INSERT [dbo].[CTVacXin] ([MaVacxin], [HanSuDung], [GiaBan], [XuatXu], [SoLuong], [SoLuongConLai], [MaLoNhap]) VALUES (1024, CAST(0x883C0B00 AS Date), 55000, N'Việt Nam', 50, 50, 1016)
INSERT [dbo].[CTVacXin] ([MaVacxin], [HanSuDung], [GiaBan], [XuatXu], [SoLuong], [SoLuongConLai], [MaLoNhap]) VALUES (1025, CAST(0x883C0B00 AS Date), 45000, N'Việt Nam', 90, 90, 1017)
INSERT [dbo].[CTVacXin] ([MaVacxin], [HanSuDung], [GiaBan], [XuatXu], [SoLuong], [SoLuongConLai], [MaLoNhap]) VALUES (1026, CAST(0xD93D0B00 AS Date), 120000, N'Hà Lan', 20, 1, 1018)
INSERT [dbo].[CTVacXin] ([MaVacxin], [HanSuDung], [GiaBan], [XuatXu], [SoLuong], [SoLuongConLai], [MaLoNhap]) VALUES (1027, CAST(0x0E3E0B00 AS Date), 60000, N'Việt Nam', 80, 80, 1019)
INSERT [dbo].[CTVacXin] ([MaVacxin], [HanSuDung], [GiaBan], [XuatXu], [SoLuong], [SoLuongConLai], [MaLoNhap]) VALUES (1028, CAST(0x0E3E0B00 AS Date), 50000, N'Việt Nam', 30, 30, 1020)
INSERT [dbo].[CTVacXin] ([MaVacxin], [HanSuDung], [GiaBan], [XuatXu], [SoLuong], [SoLuongConLai], [MaLoNhap]) VALUES (1029, CAST(0x0E3E0B00 AS Date), 150000, N'Nhật', 15, 15, 1021)
INSERT [dbo].[CTVacXin] ([MaVacxin], [HanSuDung], [GiaBan], [XuatXu], [SoLuong], [SoLuongConLai], [MaLoNhap]) VALUES (1030, CAST(0x0E3E0B00 AS Date), 130000, N'Bỉ', 30, 30, 1022)
INSERT [dbo].[CTVacXin] ([MaVacxin], [HanSuDung], [GiaBan], [XuatXu], [SoLuong], [SoLuongConLai], [MaLoNhap]) VALUES (1031, CAST(0x0E3E0B00 AS Date), 120000, N'Việt Nam', 40, 40, 1023)
INSERT [dbo].[CTVacXin] ([MaVacxin], [HanSuDung], [GiaBan], [XuatXu], [SoLuong], [SoLuongConLai], [MaLoNhap]) VALUES (1032, CAST(0x0E3E0B00 AS Date), 70000, N'Trung quốc', 20, 20, 1024)
INSERT [dbo].[CTVacXin] ([MaVacxin], [HanSuDung], [GiaBan], [XuatXu], [SoLuong], [SoLuongConLai], [MaLoNhap]) VALUES (1033, CAST(0x0E3E0B00 AS Date), 90000, N'Pháp', 10, 10, 1025)
INSERT [dbo].[CTVacXin] ([MaVacxin], [HanSuDung], [GiaBan], [XuatXu], [SoLuong], [SoLuongConLai], [MaLoNhap]) VALUES (1034, CAST(0xA13C0B00 AS Date), 250000, N'Úc', 20, 20, 1026)
INSERT [dbo].[CTVacXin] ([MaVacxin], [HanSuDung], [GiaBan], [XuatXu], [SoLuong], [SoLuongConLai], [MaLoNhap]) VALUES (1035, CAST(0x0E3E0B00 AS Date), 100000, N'Việt Nam', 15, 15, 1027)
INSERT [dbo].[CTVacXin] ([MaVacxin], [HanSuDung], [GiaBan], [XuatXu], [SoLuong], [SoLuongConLai], [MaLoNhap]) VALUES (1035, CAST(0x0E3E0B00 AS Date), 120000, N'Úc', 20, 20, 1028)
INSERT [dbo].[CTVacXin] ([MaVacxin], [HanSuDung], [GiaBan], [XuatXu], [SoLuong], [SoLuongConLai], [MaLoNhap]) VALUES (1024, CAST(0x0E3E0B00 AS Date), 70000, N'Bỉ', 10, 10, 1029)
INSERT [dbo].[CTVacXin] ([MaVacxin], [HanSuDung], [GiaBan], [XuatXu], [SoLuong], [SoLuongConLai], [MaLoNhap]) VALUES (1036, CAST(0x0E3E0B00 AS Date), 110000, N'Việt Nam', 20, 20, 1030)
INSERT [dbo].[CTVacXin] ([MaVacxin], [HanSuDung], [GiaBan], [XuatXu], [SoLuong], [SoLuongConLai], [MaLoNhap]) VALUES (1036, CAST(0x0E3E0B00 AS Date), 120000, N'Nhật', 30, 30, 1031)
INSERT [dbo].[CTVacXin] ([MaVacxin], [HanSuDung], [GiaBan], [XuatXu], [SoLuong], [SoLuongConLai], [MaLoNhap]) VALUES (1037, CAST(0x0E3E0B00 AS Date), 55000, N'Việt Nam', 50, 50, 1032)
INSERT [dbo].[CTVacXin] ([MaVacxin], [HanSuDung], [GiaBan], [XuatXu], [SoLuong], [SoLuongConLai], [MaLoNhap]) VALUES (1038, CAST(0x0E3E0B00 AS Date), 75000, N'Canada', 20, 20, 1033)
INSERT [dbo].[CTVacXin] ([MaVacxin], [HanSuDung], [GiaBan], [XuatXu], [SoLuong], [SoLuongConLai], [MaLoNhap]) VALUES (1039, CAST(0x0E3E0B00 AS Date), 50000, N'Việt Nam', 40, 40, 1034)
INSERT [dbo].[CTVacXin] ([MaVacxin], [HanSuDung], [GiaBan], [XuatXu], [SoLuong], [SoLuongConLai], [MaLoNhap]) VALUES (1040, CAST(0x0E3E0B00 AS Date), 60000, N'Trung quốc', 30, 30, 1035)
INSERT [dbo].[CTVacXin] ([MaVacxin], [HanSuDung], [GiaBan], [XuatXu], [SoLuong], [SoLuongConLai], [MaLoNhap]) VALUES (1040, CAST(0x0E3E0B00 AS Date), 70000, N'Việt Nam', 50, 50, 1036)
INSERT [dbo].[CTVacXin] ([MaVacxin], [HanSuDung], [GiaBan], [XuatXu], [SoLuong], [SoLuongConLai], [MaLoNhap]) VALUES (1041, CAST(0x0E3E0B00 AS Date), 30000, N'Việt Nam', 20, 20, 1037)
INSERT [dbo].[CTVacXin] ([MaVacxin], [HanSuDung], [GiaBan], [XuatXu], [SoLuong], [SoLuongConLai], [MaLoNhap]) VALUES (1042, CAST(0x0E3E0B00 AS Date), 69000, N'Nhật', 45, 45, 1038)
INSERT [dbo].[CTVacXin] ([MaVacxin], [HanSuDung], [GiaBan], [XuatXu], [SoLuong], [SoLuongConLai], [MaLoNhap]) VALUES (1043, CAST(0x0E3E0B00 AS Date), 200000, N'Pháp', 50, 50, 1039)
INSERT [dbo].[CTVacXin] ([MaVacxin], [HanSuDung], [GiaBan], [XuatXu], [SoLuong], [SoLuongConLai], [MaLoNhap]) VALUES (1044, CAST(0x0E3E0B00 AS Date), 100000, N'Hà Lan', 20, 20, 1040)
INSERT [dbo].[CTVacXin] ([MaVacxin], [HanSuDung], [GiaBan], [XuatXu], [SoLuong], [SoLuongConLai], [MaLoNhap]) VALUES (1045, CAST(0x0E3E0B00 AS Date), 250000, N'Nhật', 5, 5, 1041)
INSERT [dbo].[CTVacXin] ([MaVacxin], [HanSuDung], [GiaBan], [XuatXu], [SoLuong], [SoLuongConLai], [MaLoNhap]) VALUES (1046, CAST(0x0E3E0B00 AS Date), 65000, N'Việt Nam', 20, 20, 1042)
SET IDENTITY_INSERT [dbo].[CTVacXin] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [Tuoi], [Email], [DiaChi], [Sodt], [GioiTinh], [TenDangNhap]) VALUES (16, N'Trần Thanh Tài', 21, NULL, N'Huế', N'01206242344', 1, N'test')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [Tuoi], [Email], [DiaChi], [Sodt], [GioiTinh], [TenDangNhap]) VALUES (17, N'Huỳnh Tăng Tiến', 21, NULL, N'Huế', N'01202441233', 1, N'')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [Tuoi], [Email], [DiaChi], [Sodt], [GioiTinh], [TenDangNhap]) VALUES (18, N'Trần Thị Thảo', 21, NULL, N'Huế ', N'09854555222', 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [Tuoi], [Email], [DiaChi], [Sodt], [GioiTinh], [TenDangNhap]) VALUES (19, N'Hoàng Văn Nhân ', 21, NULL, N'Quảng Nam', N'09966655555', 1, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [Tuoi], [Email], [DiaChi], [Sodt], [GioiTinh], [TenDangNhap]) VALUES (20, N'Bùi Văn Hải', 21, NULL, N'Huế', N'0122446688', 1, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [Tuoi], [Email], [DiaChi], [Sodt], [GioiTinh], [TenDangNhap]) VALUES (21, N'Phan Thanh Minh', 18, NULL, N'Quảng Trị', N'0975584841', 0, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [Tuoi], [Email], [DiaChi], [Sodt], [GioiTinh], [TenDangNhap]) VALUES (22, N'Lê Thành Công', 29, NULL, N'Huế', N'0965442154', 1, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [Tuoi], [Email], [DiaChi], [Sodt], [GioiTinh], [TenDangNhap]) VALUES (23, N'Nguyễn Thành Tâm', 25, NULL, N'Đà Nẵng', N'0121114455', 1, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [Tuoi], [Email], [DiaChi], [Sodt], [GioiTinh], [TenDangNhap]) VALUES (24, N'Nguyễn Công Việt Mỹ', 35, NULL, N'Huế', N'0122333222', 1, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [Tuoi], [Email], [DiaChi], [Sodt], [GioiTinh], [TenDangNhap]) VALUES (25, N'Đào Minh Hoàng', 15, NULL, N'A Lưới', N'0122446688', 1, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [Tuoi], [Email], [DiaChi], [Sodt], [GioiTinh], [TenDangNhap]) VALUES (26, N'Dương Đình Long', 25, NULL, N'Huế', N'0903578372', 1, NULL)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[LoaiVacxin] ON 

INSERT [dbo].[LoaiVacxin] ([MaLoaiVacxin], [TenLoaiVacxin]) VALUES (37, N'Phòng Bệnh Lao')
INSERT [dbo].[LoaiVacxin] ([MaLoaiVacxin], [TenLoaiVacxin]) VALUES (38, N'Phòng Bệnh Viêm Gan B')
INSERT [dbo].[LoaiVacxin] ([MaLoaiVacxin], [TenLoaiVacxin]) VALUES (39, N'Phòng Bệnh Viêm Gan A')
INSERT [dbo].[LoaiVacxin] ([MaLoaiVacxin], [TenLoaiVacxin]) VALUES (40, N'Phòng các bệnh do H.INFLUENZAE TYP B')
INSERT [dbo].[LoaiVacxin] ([MaLoaiVacxin], [TenLoaiVacxin]) VALUES (41, N'Phòng Bệnh Viêm Gan A+B')
INSERT [dbo].[LoaiVacxin] ([MaLoaiVacxin], [TenLoaiVacxin]) VALUES (45, N'4 Bệnh: Bạch hầu, ho gà, uốn ván, bại liệt')
INSERT [dbo].[LoaiVacxin] ([MaLoaiVacxin], [TenLoaiVacxin]) VALUES (46, N'5 Bệnh: Bạch hầu, ho gà, uốn ván, bại liệt, typ b')
INSERT [dbo].[LoaiVacxin] ([MaLoaiVacxin], [TenLoaiVacxin]) VALUES (47, N'Phòng bệnh uốn ván')
INSERT [dbo].[LoaiVacxin] ([MaLoaiVacxin], [TenLoaiVacxin]) VALUES (48, N'3 Bệnh: Sởi, quai bị, rubella')
INSERT [dbo].[LoaiVacxin] ([MaLoaiVacxin], [TenLoaiVacxin]) VALUES (49, N'Phòng bệnh thủy đậu')
INSERT [dbo].[LoaiVacxin] ([MaLoaiVacxin], [TenLoaiVacxin]) VALUES (50, N'Phòng các nhiễm trùng, viêm phổi')
INSERT [dbo].[LoaiVacxin] ([MaLoaiVacxin], [TenLoaiVacxin]) VALUES (51, N'Phòng bệnh viêm màng não')
INSERT [dbo].[LoaiVacxin] ([MaLoaiVacxin], [TenLoaiVacxin]) VALUES (52, N'Phòng bệnh viêm não Nhật Bản')
INSERT [dbo].[LoaiVacxin] ([MaLoaiVacxin], [TenLoaiVacxin]) VALUES (53, N'Phòng bệnh Dại')
INSERT [dbo].[LoaiVacxin] ([MaLoaiVacxin], [TenLoaiVacxin]) VALUES (54, N'Phòng virus HPV')
SET IDENTITY_INSERT [dbo].[LoaiVacxin] OFF
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenDangNhap], [MatKhau], [Quyen]) VALUES (N'1', N'admin', N'admin', 1)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenDangNhap], [MatKhau], [Quyen]) VALUES (N'2', N'test', N'test', 0)
SET IDENTITY_INSERT [dbo].[Vacxin] ON 

INSERT [dbo].[Vacxin] ([MaVacxin], [TenVacxin], [MaLoaiVacxin], [TuoiToiThieu], [TuoiToiDa], [SoMui]) VALUES (1023, N'BCG', 37, 5, 20, 2)
INSERT [dbo].[Vacxin] ([MaVacxin], [TenVacxin], [MaLoaiVacxin], [TuoiToiThieu], [TuoiToiDa], [SoMui]) VALUES (1024, N'ENGERIX B ( Người lớn )', 38, 20, 50, 3)
INSERT [dbo].[Vacxin] ([MaVacxin], [TenVacxin], [MaLoaiVacxin], [TuoiToiThieu], [TuoiToiDa], [SoMui]) VALUES (1025, N'ENGERIX B ( Trẻ em )', 38, 1, 20, 2)
INSERT [dbo].[Vacxin] ([MaVacxin], [TenVacxin], [MaLoaiVacxin], [TuoiToiThieu], [TuoiToiDa], [SoMui]) VALUES (1026, N'r-HB Vax', 38, 1, 20, 2)
INSERT [dbo].[Vacxin] ([MaVacxin], [TenVacxin], [MaLoaiVacxin], [TuoiToiThieu], [TuoiToiDa], [SoMui]) VALUES (1027, N'AVAXIM ( Trẻ em )', 39, 1, 20, 2)
INSERT [dbo].[Vacxin] ([MaVacxin], [TenVacxin], [MaLoaiVacxin], [TuoiToiThieu], [TuoiToiDa], [SoMui]) VALUES (1028, N'AVAXIM ( Người lớn )', 39, 20, 50, 2)
INSERT [dbo].[Vacxin] ([MaVacxin], [TenVacxin], [MaLoaiVacxin], [TuoiToiThieu], [TuoiToiDa], [SoMui]) VALUES (1029, N'HAVAX', 39, 1, 30, 2)
INSERT [dbo].[Vacxin] ([MaVacxin], [TenVacxin], [MaLoaiVacxin], [TuoiToiThieu], [TuoiToiDa], [SoMui]) VALUES (1030, N'ACT-HIB', 40, 1, 30, 2)
INSERT [dbo].[Vacxin] ([MaVacxin], [TenVacxin], [MaLoaiVacxin], [TuoiToiThieu], [TuoiToiDa], [SoMui]) VALUES (1031, N'TWINRIX A+B', 41, 20, 50, 3)
INSERT [dbo].[Vacxin] ([MaVacxin], [TenVacxin], [MaLoaiVacxin], [TuoiToiThieu], [TuoiToiDa], [SoMui]) VALUES (1032, N'TETRAXIM', 45, 5, 50, 4)
INSERT [dbo].[Vacxin] ([MaVacxin], [TenVacxin], [MaLoaiVacxin], [TuoiToiThieu], [TuoiToiDa], [SoMui]) VALUES (1033, N'PENTAXIM', 46, 5, 50, 2)
INSERT [dbo].[Vacxin] ([MaVacxin], [TenVacxin], [MaLoaiVacxin], [TuoiToiThieu], [TuoiToiDa], [SoMui]) VALUES (1034, N'AT', 47, 1, 10, 2)
INSERT [dbo].[Vacxin] ([MaVacxin], [TenVacxin], [MaLoaiVacxin], [TuoiToiThieu], [TuoiToiDa], [SoMui]) VALUES (1035, N'TETAVAX', 47, 1, 10, 3)
INSERT [dbo].[Vacxin] ([MaVacxin], [TenVacxin], [MaLoaiVacxin], [TuoiToiThieu], [TuoiToiDa], [SoMui]) VALUES (1036, N'TRIMOVAC', 48, 1, 5, 2)
INSERT [dbo].[Vacxin] ([MaVacxin], [TenVacxin], [MaLoaiVacxin], [TuoiToiThieu], [TuoiToiDa], [SoMui]) VALUES (1037, N'M.M.R', 48, 1, 5, 2)
INSERT [dbo].[Vacxin] ([MaVacxin], [TenVacxin], [MaLoaiVacxin], [TuoiToiThieu], [TuoiToiDa], [SoMui]) VALUES (1038, N'PRIORIX', 48, 1, 5, 2)
INSERT [dbo].[Vacxin] ([MaVacxin], [TenVacxin], [MaLoaiVacxin], [TuoiToiThieu], [TuoiToiDa], [SoMui]) VALUES (1039, N'VARIVAX', 49, 1, 20, 2)
INSERT [dbo].[Vacxin] ([MaVacxin], [TenVacxin], [MaLoaiVacxin], [TuoiToiThieu], [TuoiToiDa], [SoMui]) VALUES (1040, N'VARILRIX', 49, 1, 15, 2)
INSERT [dbo].[Vacxin] ([MaVacxin], [TenVacxin], [MaLoaiVacxin], [TuoiToiThieu], [TuoiToiDa], [SoMui]) VALUES (1041, N'OKAVAX', 49, 1, 15, 2)
INSERT [dbo].[Vacxin] ([MaVacxin], [TenVacxin], [MaLoaiVacxin], [TuoiToiThieu], [TuoiToiDa], [SoMui]) VALUES (1042, N'PNEUMO 24', 50, 1, 20, 2)
INSERT [dbo].[Vacxin] ([MaVacxin], [TenVacxin], [MaLoaiVacxin], [TuoiToiThieu], [TuoiToiDa], [SoMui]) VALUES (1043, N'MENINGO', 51, 20, 50, 3)
INSERT [dbo].[Vacxin] ([MaVacxin], [TenVacxin], [MaLoaiVacxin], [TuoiToiThieu], [TuoiToiDa], [SoMui]) VALUES (1044, N'JEVAX', 52, 10, 20, 3)
INSERT [dbo].[Vacxin] ([MaVacxin], [TenVacxin], [MaLoaiVacxin], [TuoiToiThieu], [TuoiToiDa], [SoMui]) VALUES (1045, N'VERORAB', 53, 2, 80, 3)
INSERT [dbo].[Vacxin] ([MaVacxin], [TenVacxin], [MaLoaiVacxin], [TuoiToiThieu], [TuoiToiDa], [SoMui]) VALUES (1046, N'GARDASIL', 54, 20, 50, 2)
SET IDENTITY_INSERT [dbo].[Vacxin] OFF
ALTER TABLE [dbo].[CTVacXin]  WITH CHECK ADD  CONSTRAINT [FK_CTVacXin_Vacxin] FOREIGN KEY([MaVacxin])
REFERENCES [dbo].[Vacxin] ([MaVacxin])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CTVacXin] CHECK CONSTRAINT [FK_CTVacXin_Vacxin]
GO
ALTER TABLE [dbo].[DangKi]  WITH CHECK ADD  CONSTRAINT [FK_DangKi_CTVacXin] FOREIGN KEY([MaVacxin])
REFERENCES [dbo].[CTVacXin] ([MaLoNhap])
GO
ALTER TABLE [dbo].[DangKi] CHECK CONSTRAINT [FK_DangKi_CTVacXin]
GO
ALTER TABLE [dbo].[DangKi]  WITH CHECK ADD  CONSTRAINT [FK_DangKi_Khachhang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DangKi] CHECK CONSTRAINT [FK_DangKi_Khachhang]
GO
ALTER TABLE [dbo].[LichSuTiemPhong]  WITH CHECK ADD  CONSTRAINT [FK_LichSuTiemPhong_Khachhang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LichSuTiemPhong] CHECK CONSTRAINT [FK_LichSuTiemPhong_Khachhang]
GO
ALTER TABLE [dbo].[LichSuTiemPhong]  WITH CHECK ADD  CONSTRAINT [FK_LichSuTiemPhong_Vacxin] FOREIGN KEY([MaVacxin])
REFERENCES [dbo].[Vacxin] ([MaVacxin])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LichSuTiemPhong] CHECK CONSTRAINT [FK_LichSuTiemPhong_Vacxin]
GO
ALTER TABLE [dbo].[Vacxin]  WITH CHECK ADD  CONSTRAINT [FK_Vacxin_LoaiVacxin] FOREIGN KEY([MaLoaiVacxin])
REFERENCES [dbo].[LoaiVacxin] ([MaLoaiVacxin])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Vacxin] CHECK CONSTRAINT [FK_Vacxin_LoaiVacxin]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DangKi"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Vacxin"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 2880
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TK_SoLuongVacxinTheoNgay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TK_SoLuongVacxinTheoNgay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "LichSuTiemPhong"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Vacxin"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 135
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TK_VacxinDaTiem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TK_VacxinDaTiem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CTVacXin"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Vacxin"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 135
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CTVacXin"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 233
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "LichSuTiemPhong"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Vacxin"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 135
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CTVacXin"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Vacxin"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 135
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "LichSuTiemPhong"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 197
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Vacxin"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 188
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_5'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_5'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DangKi"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 189
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KhachHang"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 135
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LichSuTiemPhong"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 161
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Vacxin"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 135
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      En' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_6'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'd
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_6'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_6'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DangKi"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KhachHang"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 187
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LichSuTiemPhong"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 176
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Vacxin"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 135
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      En' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_7'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'd
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_7'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_7'
GO
