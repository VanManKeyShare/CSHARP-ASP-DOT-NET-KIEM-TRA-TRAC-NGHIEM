USE [KiemTraKienThuc]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bai_Kiem_Tra](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten_bai_kiem_tra] [nvarchar](max) NOT NULL,
	[ghi_chu] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_bai_kiem_tra] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bai_Kiem_Tra] ON
INSERT [dbo].[Bai_Kiem_Tra] ([id], [ten_bai_kiem_tra], [ghi_chu]) VALUES (1, N'Kiểm Tra Vật Lý 1 Tiết', N'Ghi Chú 1')
INSERT [dbo].[Bai_Kiem_Tra] ([id], [ten_bai_kiem_tra], [ghi_chu]) VALUES (2, N'Kiểm Tra Hóa Học 1 Tiết', N'Ghi Chú 2')
INSERT [dbo].[Bai_Kiem_Tra] ([id], [ten_bai_kiem_tra], [ghi_chu]) VALUES (3, N'Kiểm Tra Sinh Học 1 Tiết', N'Ghi Chú 3')
INSERT [dbo].[Bai_Kiem_Tra] ([id], [ten_bai_kiem_tra], [ghi_chu]) VALUES (4, N'Kiểm Tra Toán Học 1 Tiết', N'Ghi Chú 4')
SET IDENTITY_INSERT [dbo].[Bai_Kiem_Tra] OFF


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cau_Hoi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_bai_kt] [int] NOT NULL,
	[stt] [int] NOT NULL,
	[tieu_de_cau_hoi] [nvarchar](max) NOT NULL,
	[noi_dung_cau_hoi] [nvarchar](max) NOT NULL,
	[diem] [float] NOT NULL,
 CONSTRAINT [PK_CauHoi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cau_Hoi] ON
INSERT [dbo].[Cau_Hoi] ([id], [id_bai_kt], [stt], [tieu_de_cau_hoi], [noi_dung_cau_hoi], [diem]) VALUES (1, 1, 1, N'Câu hỏi 1', N'Trong các phát biểu dưới đây, phát biểu nào đúng? Chuyển động cơ là:', 3.5)
INSERT [dbo].[Cau_Hoi] ([id], [id_bai_kt], [stt], [tieu_de_cau_hoi], [noi_dung_cau_hoi], [diem]) VALUES (2, 1, 2, N'Câu hỏi 2', N'Hãy chọn câu đúng.', 4.5)
INSERT [dbo].[Cau_Hoi] ([id], [id_bai_kt], [stt], [tieu_de_cau_hoi], [noi_dung_cau_hoi], [diem]) VALUES (3, 1, 3, N'Câu hỏi 3', N'Gia tốc của chuyển động thẳng nhanh dần đều:', 2)
SET IDENTITY_INSERT [dbo].[Cau_Hoi] OFF


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cau_Tra_Loi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_cau_hoi] [int] NOT NULL,
	[stt] [int] NOT NULL,
	[noi_dung_tra_loi_a] [nvarchar](max) NOT NULL,
	[noi_dung_tra_loi_b] [nvarchar](max) NOT NULL,
	[dap_an_dung] [bit] NULL,
 CONSTRAINT [PK_CauTraLoi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cau_Tra_Loi] ON
INSERT [dbo].[Cau_Tra_Loi] ([id], [id_cau_hoi], [stt], [noi_dung_tra_loi_a], [noi_dung_tra_loi_b], [dap_an_dung]) VALUES (1, 1, 1, N'A', N'Sự thay đổi hướng của vật này so với vật khác theo thời gian.', 0)
INSERT [dbo].[Cau_Tra_Loi] ([id], [id_cau_hoi], [stt], [noi_dung_tra_loi_a], [noi_dung_tra_loi_b], [dap_an_dung]) VALUES (2, 1, 2, N'B', N'Sự thay đổi chiều của vật này so với vật khác theo thời gian.', 0)
INSERT [dbo].[Cau_Tra_Loi] ([id], [id_cau_hoi], [stt], [noi_dung_tra_loi_a], [noi_dung_tra_loi_b], [dap_an_dung]) VALUES (3, 1, 3, N'C', N'Sự thay đổi vị trí của vật này so với vật khác theo thời gian. (Đáp án đúng)', 1)
INSERT [dbo].[Cau_Tra_Loi] ([id], [id_cau_hoi], [stt], [noi_dung_tra_loi_a], [noi_dung_tra_loi_b], [dap_an_dung]) VALUES (4, 1, 4, N'D', N'Sự thay đổi phương của vật này so với vật khác theo thời gian.', 0)
INSERT [dbo].[Cau_Tra_Loi] ([id], [id_cau_hoi], [stt], [noi_dung_tra_loi_a], [noi_dung_tra_loi_b], [dap_an_dung]) VALUES (5, 2, 1, N'A', N'Hệ quy chiếu bao gồm vật làm mốc, hệ toạ độ, mốc thời gian.', 0)
INSERT [dbo].[Cau_Tra_Loi] ([id], [id_cau_hoi], [stt], [noi_dung_tra_loi_a], [noi_dung_tra_loi_b], [dap_an_dung]) VALUES (6, 2, 2, N'B', N'Hệ quy chiếu bao gồm hệ toạ độ, mốc thời gian và đồng hồ.', 0)
INSERT [dbo].[Cau_Tra_Loi] ([id], [id_cau_hoi], [stt], [noi_dung_tra_loi_a], [noi_dung_tra_loi_b], [dap_an_dung]) VALUES (7, 2, 3, N'C', N'Hệ quy chiếu bao gồm vật làm mốc, mốc thời gian và đồng hồ.', 0)
INSERT [dbo].[Cau_Tra_Loi] ([id], [id_cau_hoi], [stt], [noi_dung_tra_loi_a], [noi_dung_tra_loi_b], [dap_an_dung]) VALUES (8, 2, 4, N'D', N'Hệ quy chiếu bao gồm vật làm mốc, hệ toạ độ, mốc thời gian và đồng hồ. (Đáp án đúng)', 1)
INSERT [dbo].[Cau_Tra_Loi] ([id], [id_cau_hoi], [stt], [noi_dung_tra_loi_a], [noi_dung_tra_loi_b], [dap_an_dung]) VALUES (9, 3, 1, N'A', N'Có phương, chiều và độ lớn không đổi. (Đáp án đúng)', 1)
INSERT [dbo].[Cau_Tra_Loi] ([id], [id_cau_hoi], [stt], [noi_dung_tra_loi_a], [noi_dung_tra_loi_b], [dap_an_dung]) VALUES (10, 3, 2, N'B', N'Tăng đều theo thời gian.', 0)
INSERT [dbo].[Cau_Tra_Loi] ([id], [id_cau_hoi], [stt], [noi_dung_tra_loi_a], [noi_dung_tra_loi_b], [dap_an_dung]) VALUES (11, 3, 3, N'C', N'Bao giờ cũng lớn hơn gia tốc của chuyển động chậm dần đều.', 0)
INSERT [dbo].[Cau_Tra_Loi] ([id], [id_cau_hoi], [stt], [noi_dung_tra_loi_a], [noi_dung_tra_loi_b], [dap_an_dung]) VALUES (12, 3, 4, N'D', N'Chỉ có độ lớn không đổi.', 0)
SET IDENTITY_INSERT [dbo].[Cau_Tra_Loi] OFF


ALTER TABLE [dbo].[Cau_Tra_Loi] ADD  CONSTRAINT [DF_CauTraLoi_dap_an_dung]  DEFAULT ((0)) FOR [dap_an_dung]
GO


ALTER TABLE [dbo].[Cau_Hoi]  WITH CHECK ADD  CONSTRAINT [FK_01__Bai_Kiem_Tra__Cau_Hoi] FOREIGN KEY([id_bai_kt])
REFERENCES [dbo].[Bai_Kiem_Tra] ([id])
GO
ALTER TABLE [dbo].[Cau_Hoi] CHECK CONSTRAINT [FK_01__Bai_Kiem_Tra__Cau_Hoi]
GO


ALTER TABLE [dbo].[Cau_Tra_Loi]  WITH CHECK ADD  CONSTRAINT [FK_02__Cau_Hoi__Cau_Tra_Loi] FOREIGN KEY([id_cau_hoi])
REFERENCES [dbo].[Cau_Hoi] ([id])
GO
ALTER TABLE [dbo].[Cau_Tra_Loi] CHECK CONSTRAINT [FK_02__Cau_Hoi__Cau_Tra_Loi]
GO
