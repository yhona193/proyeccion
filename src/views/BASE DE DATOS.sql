USE [PROYECCION_SOCIAL]
GO
/****** Object:  Table [dbo].[aceptacion]    Script Date: 21/08/2022 18:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proyeccion].[Aceptacion](
	[acepResol] [varchar](20) NOT NULL,
	[grupId] [varchar](10) NULL,
	[acepEst] [varchar](10) NULL,
	[acepObs] [varchar](50) NULL,
	[acepFech] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[acepResol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ampliacion]    Script Date: 21/08/2022 18:01:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proyeccion].[Ampliacion](
	[amplId] [varchar](20) NULL,
	[grupId] [varchar](10) NULL,
	[amplEst] [varchar](10) NULL,
	[amplObs] [varchar](50) NULL,
	[amplFech] [date] NULL,
	[amplActFech] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[avance]    Script Date: 21/08/2022 18:01:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proyeccion].[Avance](
	[avanId] [varchar](10) NOT NULL,
	[grupId] [varchar](10) NULL,
	[acepResol] [varchar](20) NULL,
	[avanEst] [varchar](10) NULL,
	[avanObs] [varchar](50) NULL,
	[avanFech] [date] NULL,
	[avanAct] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[avanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[finalizacion]    Script Date: 21/08/2022 18:01:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proyeccion].[Finalizacion](
	[finId] [varchar](20) NULL,
	[grupId] [varchar](10) NULL,
	[finEst] [varchar](10) NULL,
	[finObs] [varchar](50) NULL,
	[finFech] [date] NULL,
	[finActFech] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grupo]    Script Date: 21/08/2022 18:01:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proyeccion].[Grupo](
	[grupId] [varchar](10) NOT NULL,
	[grupNomProyec] [varchar](150) NULL,
	[grupModal] [varchar](15) NULL,
	[grupNom] [varchar](100) NULL,
	[grupAsesor] [varchar](50) NULL,
	[grupLinProy] [varchar](60) NULL,
	[grupFechIni] [date] NULL,
	[grupFechFin] [date] NULL,
	[grupFechReg] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[grupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proyeccion_social]    Script Date: 21/08/2022 18:01:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proyeccion].[ProyeccionSocial](
	[grupId] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rel_grupo]    Script Date: 21/08/2022 18:01:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proyeccion].[relgGrupo](
	[alumId] [varchar](10) NOT NULL,
	[grupId] [varchar](10) NULL,
	[relAlumEst] [bit] NULL,
	[relAlumObs] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[alumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [Proyeccion].[Aceptacion] ([acep_resol], [grup_id], [acep_est], [acep_obs], [acep_fech]) VALUES (N'R1', N'121', N'Aceptado', N'Sin observaciones', CAST(N'2022-08-20' AS Date))
GO
INSERT [Proyeccion].[Aceptacion] ([acep_resol], [grup_id], [acep_est], [acep_obs], [acep_fech]) VALUES (N'R2', N'122', N'Aceptado', N'Observado', CAST(N'2022-08-22' AS Date))
GO
INSERT [Proyeccion].[Aceptacion] ([acep_resol], [grup_id], [acep_est], [acep_obs], [acep_fech]) VALUES (N'R3', N'123', N'Aceptado', N'Sin observaciones', CAST(N'2022-08-23' AS Date))
GO
INSERT [Proyeccion].[Ampliacion] ([ampl_id], [grup_id], [ampl_est], [ampl_obs], [ampl_fech], [ampl_act_fech]) VALUES (N'a1', N'121', N'Aceptado', N' ', CAST(N'2023-03-15' AS Date), CAST(N'2023-04-15' AS Date))
GO
INSERT [Proyeccion].[Ampliacion] ([ampl_id], [grup_id], [ampl_est], [ampl_obs], [ampl_fech], [ampl_act_fech]) VALUES (N'a2', N'121', N'Aceptado', N' ', CAST(N'2023-03-16' AS Date), CAST(N'2023-04-16' AS Date))
GO
INSERT [Proyeccion].[Ampliacion] ([ampl_id], [grup_id], [ampl_est], [ampl_obs], [ampl_fech], [ampl_act_fech]) VALUES (N'a3', N'121', N'Aceptado', N' ', CAST(N'2023-03-17' AS Date), CAST(N'2023-04-17' AS Date))
GO
INSERT [Proyeccion].[Avance] ([avan_id], [grup_id], [acep_resol], [avan_est], [avan_obs], [avan_fech], [avan_act]) VALUES (N'Av1', N'121', N'R1', N'Aceptado ', N' ', CAST(N'2023-01-15' AS Date), CAST(N'2023-02-16' AS Date))
GO
INSERT [Proyeccion].[avance] ([avan_id], [grup_id], [acep_resol], [avan_est], [avan_obs], [avan_fech], [avan_act]) VALUES (N'Av2', N'122', N'R2', N'Aceptado ', N' ', CAST(N'2023-01-15' AS Date), CAST(N'2023-02-16' AS Date))
GO
INSERT [Proyeccion].[avance] ([avan_id], [grup_id], [acep_resol], [avan_est], [avan_obs], [avan_fech], [avan_act]) VALUES (N'Av3', N'123', N'R3', N'Aceptado ', N' ', CAST(N'2023-01-15' AS Date), CAST(N'2023-02-16' AS Date))
GO
INSERT [Proyeccion].[finalizacion] ([fin_id], [grup_id], [fin_est], [fin_obs], [fin_fech], [fin_act_fech]) VALUES (N'f1', N'121', N'Aceptado ', N' ', CAST(N'2023-04-20' AS Date), CAST(N'2023-04-22' AS Date))
GO
INSERT [Proyeccion].[finalizacion] ([fin_id], [grup_id], [fin_est], [fin_obs], [fin_fech], [fin_act_fech]) VALUES (N'f2', N'122', N'Aceptado ', N' ', CAST(N'2023-04-20' AS Date), CAST(N'2023-04-22' AS Date))
GO
INSERT [Proyeccion].[finalizacion] ([fin_id], [grup_id], [fin_est], [fin_obs], [fin_fech], [fin_act_fech]) VALUES (N'f3', N'123', N'Aceptado ', N' ', CAST(N'2023-04-20' AS Date), CAST(N'2023-04-22' AS Date))
GO
INSERT [Proyeccion].[grupo] ([grup_id], [grup_nom_proyec], [grup_modal], [grup_nom], [grup_asesor], [grup_lin_proy], [grup_fech_ini], [grup_fech_fin], [grup_fech_reg]) VALUES (N'121', N'CIBERTEC', N'Monovalente', N'Grupo1', N'Jowel', N'Linea', CAST(N'2022-08-12' AS Date), CAST(N'2022-12-22' AS Date), CAST(N'2022-08-15' AS Date))
GO
INSERT [Proyeccion].[grupo] ([grup_id], [grup_nom_proyec], [grup_modal], [grup_nom], [grup_asesor], [grup_lin_proy], [grup_fech_ini], [grup_fech_fin], [grup_fech_reg]) VALUES (N'122', N'Sistema en Essalud', N'Polivalente', N'Grupo2', N'Gordillo', N'Linea', CAST(N'2022-08-10' AS Date), CAST(N'2022-12-25' AS Date), CAST(N'2022-08-16' AS Date))
GO
INSERT [Proyeccion].[grupo] ([grup_id], [grup_nom_proyec], [grup_modal], [grup_nom], [grup_asesor], [grup_lin_proy], [grup_fech_ini], [grup_fech_fin], [grup_fech_reg]) VALUES (N'123', N'SISTEMICOS', N'Monovalente', N'Grupo3', N'Magno', N'Linea', CAST(N'2022-08-15' AS Date), CAST(N'2022-12-17' AS Date), CAST(N'2022-08-17' AS Date))
GO
INSERT [Proyeccion].[Proyeccion_social] ([grup_id]) VALUES (N'121')
GO
INSERT [Proyeccion].[Proyeccion_social] ([grup_id]) VALUES (N'122')
GO
INSERT [Proyeccion].[Proyeccion_social] ([grup_id]) VALUES (N'123')
GO
INSERT [Proyeccion].[Proyeccion_social] ([grup_id]) VALUES (N'121')
GO
INSERT [Proyeccion].[Proyeccion_social] ([grup_id]) VALUES (N'122')
GO
INSERT [Proyeccion].[Proyeccion_social] ([grup_id]) VALUES (N'123')
GO
INSERT [Proyeccion].[rel_grupo] ([alum_id], [grup_id], [rel_alum_est], [rel_alum_obs]) VALUES (N'd20351t', N'121', 1, N'Sin observaciones')
GO
INSERT [Proyeccion].[rel_grupo] ([alum_id], [grup_id], [rel_alum_est], [rel_alum_obs]) VALUES (N'e00256c', N'121', 1, N'Sin observaciones')
GO
INSERT [Proyeccion].[rel_grupo] ([alum_id], [grup_id], [rel_alum_est], [rel_alum_obs]) VALUES (N'j02675b', N'121', 1, N'Sin observaciones')
GO
ALTER TABLE [Proyeccion].[aceptacion]  WITH CHECK ADD FOREIGN KEY([grup_id])
REFERENCES [Proyeccion].[grupo] ([grup_id])
GO
ALTER TABLE [dbo].[ampliacion]  WITH CHECK ADD FOREIGN KEY([grup_id])
REFERENCES [dbo].[grupo] ([grup_id])
GO
ALTER TABLE [dbo].[avance]  WITH CHECK ADD FOREIGN KEY([grup_id])
REFERENCES [dbo].[grupo] ([grup_id])
GO
ALTER TABLE [dbo].[finalizacion]  WITH CHECK ADD FOREIGN KEY([grup_id])
REFERENCES [dbo].[grupo] ([grup_id])
GO
ALTER TABLE [dbo].[Proyeccion_social]  WITH CHECK ADD FOREIGN KEY([grup_id])
REFERENCES [dbo].[grupo] ([grup_id])
GO
ALTER TABLE [dbo].[rel_grupo]  WITH CHECK ADD FOREIGN KEY([grup_id])
REFERENCES [dbo].[grupo] ([grup_id])
GO
