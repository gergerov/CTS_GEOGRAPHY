USE [CTS_GEOGRAPHY]
GO
/****** Object:  Table [dbo].[spr_airport]    Script Date: 07.08.2023 23:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[spr_airport](
	[id_spr_airport] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[id_spr_city] [int] NOT NULL,
	[airport_iata_code] [nvarchar](4) NOT NULL,
	[airport_name_rus] [nvarchar](255) NULL,
	[airport_name_eng] [nvarchar](255) NOT NULL,
	[airport_latitude] [nvarchar](64) NULL,
	[airport_longtitude] [nvarchar](64) NULL,
	[created] [datetime] NOT NULL,
	[creator] [nvarchar](255) NOT NULL,
	[is_active] [bit] NOT NULL,
 CONSTRAINT [PK_spr_airport] PRIMARY KEY CLUSTERED 
(
	[id_spr_airport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[spr_country]    Script Date: 07.08.2023 23:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[spr_country](
	[id_spr_country] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[country_name] [nvarchar](255) NOT NULL,
	[country_iso_code] [nvarchar](2) NOT NULL,
	[created] [datetime] NOT NULL,
	[creator] [nvarchar](255) NOT NULL,
	[is_active] [bit] NOT NULL,
 CONSTRAINT [PK_spr_country] PRIMARY KEY CLUSTERED 
(
	[id_spr_country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[spr_city]    Script Date: 07.08.2023 23:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[spr_city](
	[id_spr_city] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[id_spr_country] [int] NOT NULL,
	[city_name_rus] [nvarchar](255) NULL,
	[city_name_eng] [nvarchar](255) NOT NULL,
	[created] [datetime] NOT NULL,
	[creator] [nvarchar](255) NOT NULL,
	[is_active] [bit] NOT NULL,
 CONSTRAINT [PK_spr_city] PRIMARY KEY CLUSTERED 
(
	[id_spr_city] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_airport]    Script Date: 07.08.2023 23:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_airport]
AS
SELECT        dbo.spr_airport.id_spr_airport, dbo.spr_airport.airport_iata_code, dbo.spr_airport.airport_name_rus, dbo.spr_airport.airport_name_eng, dbo.spr_airport.airport_latitude, dbo.spr_airport.airport_longtitude, 
                         dbo.spr_city.city_name_rus, dbo.spr_city.city_name_eng, dbo.spr_country.country_name, dbo.spr_country.country_iso_code, dbo.spr_airport.is_active, dbo.spr_city.id_spr_city, dbo.spr_country.id_spr_country
FROM            dbo.spr_airport INNER JOIN
                         dbo.spr_city ON dbo.spr_airport.id_spr_city = dbo.spr_city.id_spr_city INNER JOIN
                         dbo.spr_country ON dbo.spr_city.id_spr_country = dbo.spr_country.id_spr_country
WHERE        (dbo.spr_airport.is_active = 1)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_airport_iata_code]    Script Date: 07.08.2023 23:07:08 ******/
CREATE NONCLUSTERED INDEX [idx_airport_iata_code] ON [dbo].[spr_airport]
(
	[airport_iata_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [INDEXES]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_airport_name_eng]    Script Date: 07.08.2023 23:07:08 ******/
CREATE NONCLUSTERED INDEX [idx_airport_name_eng] ON [dbo].[spr_airport]
(
	[airport_name_eng] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [INDEXES]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_airport_name_rus]    Script Date: 07.08.2023 23:07:08 ******/
CREATE NONCLUSTERED INDEX [idx_airport_name_rus] ON [dbo].[spr_airport]
(
	[airport_name_rus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [INDEXES]
GO
/****** Object:  Index [idx_is_active]    Script Date: 07.08.2023 23:07:08 ******/
CREATE NONCLUSTERED INDEX [idx_is_active] ON [dbo].[spr_airport]
(
	[is_active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [INDEXES]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_city_name_eng]    Script Date: 07.08.2023 23:07:08 ******/
CREATE NONCLUSTERED INDEX [idx_city_name_eng] ON [dbo].[spr_city]
(
	[city_name_eng] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [INDEXES]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_city_name_rus]    Script Date: 07.08.2023 23:07:08 ******/
CREATE NONCLUSTERED INDEX [idx_city_name_rus] ON [dbo].[spr_city]
(
	[city_name_rus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [INDEXES]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_country_iso_code]    Script Date: 07.08.2023 23:07:08 ******/
CREATE NONCLUSTERED INDEX [idx_country_iso_code] ON [dbo].[spr_country]
(
	[country_iso_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [INDEXES]
GO
ALTER TABLE [dbo].[spr_airport] ADD  CONSTRAINT [DF_spr_airport_created]  DEFAULT (getdate()) FOR [created]
GO
ALTER TABLE [dbo].[spr_airport] ADD  CONSTRAINT [DF_spr_airport_creator]  DEFAULT (suser_sname()) FOR [creator]
GO
ALTER TABLE [dbo].[spr_airport] ADD  CONSTRAINT [DF_spr_airport_is_active]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[spr_city] ADD  CONSTRAINT [DF_spr_city_created]  DEFAULT (getdate()) FOR [created]
GO
ALTER TABLE [dbo].[spr_city] ADD  CONSTRAINT [DF_spr_city_creator]  DEFAULT (suser_sname()) FOR [creator]
GO
ALTER TABLE [dbo].[spr_city] ADD  CONSTRAINT [DF_spr_city_is_active]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[spr_country] ADD  CONSTRAINT [DF_spr_country_created]  DEFAULT (getdate()) FOR [created]
GO
ALTER TABLE [dbo].[spr_country] ADD  CONSTRAINT [DF_spr_country_creator]  DEFAULT (suser_sname()) FOR [creator]
GO
ALTER TABLE [dbo].[spr_country] ADD  CONSTRAINT [DF_spr_country_is_active]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[spr_airport]  WITH CHECK ADD  CONSTRAINT [FK_spr_airport_spr_city] FOREIGN KEY([id_spr_city])
REFERENCES [dbo].[spr_city] ([id_spr_city])
GO
ALTER TABLE [dbo].[spr_airport] CHECK CONSTRAINT [FK_spr_airport_spr_city]
GO
ALTER TABLE [dbo].[spr_city]  WITH CHECK ADD  CONSTRAINT [FK_spr_city_spr_country] FOREIGN KEY([id_spr_country])
REFERENCES [dbo].[spr_country] ([id_spr_country])
GO
ALTER TABLE [dbo].[spr_city] CHECK CONSTRAINT [FK_spr_city_spr_country]
GO
/****** Object:  StoredProcedure [dbo].[ext#airport_import]    Script Date: 07.08.2023 23:07:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ext#airport_import]
	@airport_iata_code nvarchar(4),
	@airport_name_rus nvarchar(255),
	@airport_name_eng nvarchar(255),
	@airport_latitude nvarchar(255),
	@airport_longtitude nvarchar(255),
	@city_name_rus nvarchar(255),
	@city_name_eng nvarchar(255),
	@country_name_rus nvarchar(255),
	@country_iso_code nvarchar(255)
AS
-- =============================================
-- Author:		<GGaev>
-- Create date: <070823>
-- Description:	<Импорт географии из csv>
-- =============================================
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  declare 
    @id_spr_country int,
    @id_spr_city int
  begin try
    -- поиск страны
    select @id_spr_country = id_spr_country
	  from dbo.spr_country
	  where country_iso_code = @country_iso_code
	    and is_active = 1;
    -- если не нашли, создаем
    if @id_spr_country is null
    begin
      insert into dbo.spr_country (country_name, country_iso_code)
      values (@country_name_rus, @country_iso_code);
      set @id_spr_country = SCOPE_IDENTITY();
    end
    -- поиск города
    select @id_spr_city = id_spr_city
    from dbo.spr_city
    where is_active = 1
      and id_spr_country = @id_spr_country
      and city_name_rus = @city_name_rus
      and city_name_eng = @city_name_eng;
    -- если нет, создаем
    if @id_spr_city is null
    begin
      insert into dbo.spr_city (id_spr_country, city_name_rus, city_name_eng)
      values (@id_spr_country, @city_name_rus, @city_name_eng);
      set @id_spr_city = SCOPE_IDENTITY();
    end
    -- если нет аэропорта, создаём
    if not exists(select 1 from dbo.spr_airport where is_active = 1 and id_spr_city = @id_spr_city and airport_iata_code = @airport_iata_code and airport_name_eng = @airport_name_eng)
    begin
      insert into dbo.spr_airport (id_spr_city, airport_iata_code, airport_name_rus, airport_name_eng, airport_latitude, airport_longtitude)
      values (@id_spr_city, @airport_iata_code, @airport_name_rus, @airport_name_eng, @airport_latitude, @airport_longtitude);
    end
    else
    begin
      return (1); -- уже существует
    end
    return (0);
  end try
  begin catch
    ;throw
    return (-1);
  end catch

	

END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[28] 2[12] 3) )"
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
         Begin Table = "spr_airport"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 307
               Right = 267
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "spr_city"
            Begin Extent = 
               Top = 6
               Left = 260
               Bottom = 306
               Right = 447
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "spr_country"
            Begin Extent = 
               Top = 6
               Left = 449
               Bottom = 305
               Right = 652
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
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2745
         Alias = 900
         Table = 1170
         Output = 3120
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 2910
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_airport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_airport'
GO

USE [CTS_GEOGRAPHY]
GO

/****** Object:  StoredProcedure [dbo].[api#airports]    Script Date: 10.08.2023 3:10:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[api#airports]
  @point_code nvarchar(4) = null,
	@point_name nvarchar(255) = null,
  @page int = 0,
  @size int = 24
AS
-- =============================================
-- Author:		<GGaev>
-- Create date: <100823>
-- Description:	<аэропорты для api>
-- =============================================
BEGIN

	SET NOCOUNT ON;

  begin try
    set @point_name = '%'+isnull(@point_name,'')+'%';
    select 
      va.airport_iata_code,
      va.airport_name_eng,
      va.airport_name_rus,
      va.city_name_eng,
      va.city_name_rus,
      va.country_iso_code,
      va.country_name,
      va.airport_latitude,
      va.airport_longtitude
    from dbo.v_airport as va
    where va.airport_iata_code like '%'+isnull(@point_code,'')+'%' 
    and   (
          va.airport_name_eng like @point_name
      or  va.airport_name_rus like @point_name
      or  va.city_name_eng like @point_name
      or  va.city_name_rus like @point_name
    )
    order by 
      va.airport_name_rus,
      va.airport_name_eng
    offset @page*@size rows
    FETCH FIRST @size ROWS ONLY
    return (0);
  end try
  begin catch
    ;throw
    return (-1);
  end catch

	

END
GO




USE [master]
GO
ALTER DATABASE [CTS_GEOGRAPHY] SET  READ_WRITE 
GO
