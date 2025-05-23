USE [master]
GO
/****** Object:  Database [Best_Western_plus]    Script Date: 22/05/2025 11:56:27 a. m. ******/
CREATE DATABASE [Best_Western_plus]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Best_Western_plus', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER04\MSSQL\DATA\Best_Western_plus.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Best_Western_plus_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER04\MSSQL\DATA\Best_Western_plus_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Best_Western_plus] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Best_Western_plus].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Best_Western_plus] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Best_Western_plus] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Best_Western_plus] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Best_Western_plus] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Best_Western_plus] SET ARITHABORT OFF 
GO
ALTER DATABASE [Best_Western_plus] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Best_Western_plus] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Best_Western_plus] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Best_Western_plus] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Best_Western_plus] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Best_Western_plus] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Best_Western_plus] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Best_Western_plus] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Best_Western_plus] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Best_Western_plus] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Best_Western_plus] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Best_Western_plus] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Best_Western_plus] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Best_Western_plus] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Best_Western_plus] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Best_Western_plus] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Best_Western_plus] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Best_Western_plus] SET RECOVERY FULL 
GO
ALTER DATABASE [Best_Western_plus] SET  MULTI_USER 
GO
ALTER DATABASE [Best_Western_plus] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Best_Western_plus] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Best_Western_plus] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Best_Western_plus] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Best_Western_plus] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Best_Western_plus] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Best_Western_plus', N'ON'
GO
ALTER DATABASE [Best_Western_plus] SET QUERY_STORE = ON
GO
ALTER DATABASE [Best_Western_plus] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Best_Western_plus]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ID_Cliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[RFC] [char](13) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Telefono] [varchar](20) NULL,
	[Direccion] [varchar](255) NULL,
	[Fecha_Registro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RFC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habitaciones]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitaciones](
	[ID_Habitacion] [int] IDENTITY(1,1) NOT NULL,
	[Numero_Habitacion] [int] NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[Capacidad] [int] NOT NULL,
	[Precio_Noche] [money] NOT NULL,
	[Estado] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Habitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Numero_Habitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservas]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservas](
	[ID_Reserva] [int] IDENTITY(1,1) NOT NULL,
	[ID_Cliente] [int] NOT NULL,
	[ID_Habitacion] [int] NOT NULL,
	[Fecha_CheckIn] [date] NOT NULL,
	[Fecha_CheckOut] [date] NOT NULL,
	[Estado] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Reserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vista_Reservas_Activas]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vista_Reservas_Activas] AS
SELECT R.ID_Reserva, C.Nombre, C.Apellido, H.Numero_Habitacion, R.Fecha_CheckIn, R.Fecha_CheckOut
FROM Reservas R
JOIN Clientes C ON R.ID_Cliente = C.ID_Cliente
JOIN Habitaciones H ON R.ID_Habitacion = H.ID_Habitacion
WHERE R.Estado = 'Confirmada';


GO
/****** Object:  View [dbo].[V_Habitaciones_Disponibles]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[V_Habitaciones_Disponibles] AS
Select top 100 percent 
ID_Habitacion,
Estado
From Habitaciones
Where Estado = 'Disonible';
GO
/****** Object:  View [dbo].[V_Habitaciones_Mantenimiento]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[V_Habitaciones_Mantenimiento] AS
Select top 100 percent 
ID_Habitacion,
Estado
From Habitaciones
Where Estado = 'Mantenimiento';
GO
/****** Object:  Table [dbo].[SalonesEventos]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalonesEventos](
	[ID_Salon] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Capacidad] [int] NOT NULL,
	[Ubicacion] [varchar](100) NOT NULL,
	[Descripcion] [text] NULL,
	[Precio_Hora] [money] NOT NULL,
	[Equipamiento] [text] NULL,
	[Estado] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Salon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservasSalones]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservasSalones](
	[ID_ReservaSalon] [int] IDENTITY(1,1) NOT NULL,
	[ID_Salon] [int] NOT NULL,
	[ID_Cliente] [int] NOT NULL,
	[Fecha_Evento] [date] NOT NULL,
	[Hora_Inicio] [time](7) NOT NULL,
	[Hora_Fin] [time](7) NOT NULL,
	[Tipo_Evento] [varchar](50) NOT NULL,
	[Cantidad_Personas] [int] NOT NULL,
	[Requerimientos_Especiales] [text] NULL,
	[Estado] [varchar](20) NOT NULL,
	[ID_EmpleadoResponsable] [int] NULL,
	[Deposito] [money] NULL,
	[Total] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_ReservaSalon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_EventosProgramados]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Vista de Eventos Programados
CREATE VIEW [dbo].[V_EventosProgramados] AS
SELECT 
    R.ID_ReservaSalon,
    S.Nombre AS Salon,
    C.Nombre + ' ' + C.Apellido AS Cliente,
    R.Fecha_Evento,
    R.Hora_Inicio,
    R.Hora_Fin,
    R.Tipo_Evento,
    R.Cantidad_Personas,
    R.Estado
FROM ReservasSalones R
JOIN SalonesEventos S ON R.ID_Salon = S.ID_Salon
JOIN Clientes C ON R.ID_Cliente = C.ID_Cliente
WHERE R.Estado = 'Confirmada'
AND R.Fecha_Evento >= CAST(GETDATE() AS date)
GO
/****** Object:  View [dbo].[V_SalonesDisponibles]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Vista de Salones Disponibles
CREATE VIEW [dbo].[V_SalonesDisponibles] AS
SELECT S.*
FROM SalonesEventos S
WHERE S.Estado = 'Disponible'
AND NOT EXISTS (
    SELECT 1 FROM ReservasSalones R 
    WHERE R.ID_Salon = S.ID_Salon 
    AND R.Estado = 'Confirmada'
    AND GETDATE() BETWEEN 
        CAST(R.Fecha_Evento AS datetime) + CAST(R.Hora_Inicio AS datetime) 
        AND 
        CAST(R.Fecha_Evento AS datetime) + CAST(R.Hora_Fin AS datetime)
)
GO
/****** Object:  Table [dbo].[Ingredientes]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredientes](
	[ID_Ingrediente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[UnidadMedida] [varchar](20) NOT NULL,
	[StockDisponible] [decimal](10, 2) NOT NULL,
	[ID_Proveedor] [int] NOT NULL,
	[Fecha_UltimaCompra] [date] NULL,
	[Fecha_Caducidad] [date] NOT NULL,
	[Condiciones_Almacenamiento] [varchar](255) NULL,
	[StockMinimo] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Ingrediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recetas]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recetas](
	[ID_Receta] [int] IDENTITY(1,1) NOT NULL,
	[ID_Item] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [text] NULL,
	[TiempoPreparacion] [int] NOT NULL,
	[Instrucciones] [text] NOT NULL,
	[Dificultad] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Receta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecetaIngredientes]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecetaIngredientes](
	[ID_RecetaIngrediente] [int] IDENTITY(1,1) NOT NULL,
	[ID_Receta] [int] NOT NULL,
	[ID_Ingrediente] [int] NOT NULL,
	[Cantidad] [decimal](10, 2) NOT NULL,
	[UnidadMedida] [varchar](20) NOT NULL,
	[Notas] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_RecetaIngrediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID_Item] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [text] NULL,
	[Precio] [money] NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[ID_Pedido] [int] IDENTITY(1,1) NOT NULL,
	[ID_Cliente] [int] NOT NULL,
	[Fecha_Hora] [datetime] NULL,
	[Estado] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallePedido]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallePedido](
	[ID_Detalle] [int] IDENTITY(1,1) NOT NULL,
	[ID_Pedido] [int] NOT NULL,
	[ID_Item] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Subtotal] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_RecetasParaCocina]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_RecetasParaCocina] AS
SELECT 
    P.ID_Pedido,
    DP.ID_Detalle,
    M.Nombre AS ItemMenu,
    R.TiempoPreparacion,
    R.Dificultad,
    R.Instrucciones,
    STUFF((
        SELECT ', ' + ING.Nombre + ' (' + CAST(RI.Cantidad AS VARCHAR) + ' ' + RI.UnidadMedida + ')'
        FROM [dbo].[RecetaIngredientes] RI
        JOIN [dbo].[Ingredientes] ING ON RI.ID_Ingrediente = ING.ID_Ingrediente
        WHERE RI.ID_Receta = R.ID_Receta
        FOR XML PATH('')
    ), 1, 2, '') AS Ingredientes,
    C.Nombre + ' ' + C.Apellido AS Cliente,
    DP.Cantidad,
    P.Fecha_Hora AS FechaPedido,
    'Tiempo estimado: ' + CAST(SUM(R.TiempoPreparacion * DP.Cantidad) OVER (PARTITION BY P.ID_Pedido) AS VARCHAR) + ' minutos' AS TiempoTotalPedido
FROM [dbo].[Pedidos] P
JOIN [dbo].[DetallePedido] DP ON P.ID_Pedido = DP.ID_Pedido
JOIN [dbo].[Menu] M ON DP.ID_Item = M.ID_Item
JOIN [dbo].[Recetas] R ON M.ID_Item = R.ID_Item
JOIN [dbo].[Clientes] C ON P.ID_Cliente = C.ID_Cliente
WHERE P.Estado = 'En preparación'
GO
/****** Object:  View [dbo].[V_AlertasInventario]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Vista para alertas de inventario bajo
CREATE VIEW [dbo].[V_AlertasInventario] AS
SELECT 
    I.ID_Ingrediente,
    I.Nombre AS Ingrediente,
    I.StockDisponible,
    I.StockMinimo,
    CASE 
        WHEN I.StockDisponible < I.StockMinimo THEN 'Crítico'
        WHEN I.StockDisponible < (I.StockMinimo * 1.5) THEN 'Advertencia'
        ELSE 'Normal'
    END AS NivelAlerta
FROM [dbo].[Ingredientes] I
GO
/****** Object:  Table [dbo].[AsignacionMesero]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AsignacionMesero](
	[ID_Asignacion] [int] IDENTITY(1,1) NOT NULL,
	[ID_Pedido] [int] NOT NULL,
	[ID_Mesero] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Asignacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AsistenciaEmpleados]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AsistenciaEmpleados](
	[ID_Asistencia] [int] IDENTITY(1,1) NOT NULL,
	[ID_Empleado] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[HoraEntrada] [time](7) NOT NULL,
	[HoraSalida] [time](7) NULL,
	[Estado] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Asistencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bebidas]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bebidas](
	[ID_Bebida] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[Descripcion] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Bebida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuraciones]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuraciones](
	[ID_Configuracion] [int] IDENTITY(1,1) NOT NULL,
	[Reservas_Online] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Configuracion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConsumoServicios]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsumoServicios](
	[ID_Consumo] [int] IDENTITY(1,1) NOT NULL,
	[ID_Cliente] [int] NOT NULL,
	[ID_Servicio] [int] NOT NULL,
	[Fecha_Consumo] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Consumo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallePedidoBar]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallePedidoBar](
	[ID_Detalle] [int] IDENTITY(1,1) NOT NULL,
	[ID_Pedido] [int] NOT NULL,
	[ID_Bebida] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Subtotal] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[ID_Empleado] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[RFC] [char](13) NOT NULL,
	[Puesto] [varchar](50) NOT NULL,
	[Departamento] [varchar](50) NOT NULL,
	[Fecha_Contratacion] [date] NOT NULL,
	[Salario] [money] NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Telefono] [varchar](20) NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK__Empleado__B7872C900AA742DD] PRIMARY KEY CLUSTERED 
(
	[ID_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__Empleado__A9D1053402AFA177] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__Empleado__CAFFA85E09B9AF96] UNIQUE NONCLUSTERED 
(
	[RFC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Eventos]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Eventos](
	[ID_Evento] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [text] NULL,
	[Fecha] [date] NOT NULL,
	[Hora] [time](7) NOT NULL,
	[Ubicacion] [varchar](255) NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[ID_Organizador] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Evento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturacion]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturacion](
	[ID_Factura] [int] IDENTITY(1,1) NOT NULL,
	[ID_Pago] [int] NOT NULL,
	[Fecha_Factura] [datetime] NULL,
	[Total] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FidelizacionClientes]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FidelizacionClientes](
	[ID_Fidelizacion] [int] IDENTITY(1,1) NOT NULL,
	[ID_Cliente] [int] NOT NULL,
	[PuntosAcumulados] [int] NULL,
	[Nivel] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Fidelizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_Empresa]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_Empresa](
	[Nombre] [varchar](25) NULL,
	[RFC] [varchar](12) NULL,
	[CP] [varchar](8) NULL,
	[Domicilio] [text] NULL,
	[Salario_min] [money] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[ID_Articulo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [text] NULL,
	[Cantidad] [int] NOT NULL,
	[Proveedor] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventarioLicores]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventarioLicores](
	[ID_Ingrediente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Categoria] [varchar](50) NOT NULL,
	[StockDisponible] [decimal](10, 2) NOT NULL,
	[Fecha_Caducidad] [date] NOT NULL,
	[ID_Proveedor] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Ingrediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mantenimiento]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mantenimiento](
	[ID_Mantenimiento] [int] IDENTITY(1,1) NOT NULL,
	[ID_Habitacion] [int] NOT NULL,
	[Tipo] [varchar](100) NOT NULL,
	[Fecha] [datetime] NULL,
	[Descripcion] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Mantenimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meseros]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meseros](
	[ID_Mesero] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[RFC] [char](13) NOT NULL,
	[Fecha_Contratacion] [date] NOT NULL,
	[Salario] [decimal](10, 2) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Telefono] [varchar](20) NULL,
	[Estado] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Mesero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RFC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MobiliarioEventos]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MobiliarioEventos](
	[ID_Mobiliario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[Cantidad_Total] [int] NOT NULL,
	[Cantidad_Disponible] [int] NOT NULL,
	[Condicion] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Mobiliario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificacionesCocina]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificacionesCocina](
	[ID_Notificacion] [int] IDENTITY(1,1) NOT NULL,
	[ID_Pedido] [int] NOT NULL,
	[ID_Item] [int] NULL,
	[Mensaje] [varchar](255) NOT NULL,
	[FechaHora] [datetime] NOT NULL,
	[Estado] [varchar](20) NOT NULL,
	[Prioridad] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Notificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pagos]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagos](
	[ID_Pago] [int] IDENTITY(1,1) NOT NULL,
	[ID_Reserva] [int] NOT NULL,
	[Monto] [money] NOT NULL,
	[Metodo_Pago] [varchar](50) NOT NULL,
	[Fecha_Pago] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PedidosBar]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidosBar](
	[ID_Pedido] [int] IDENTITY(1,1) NOT NULL,
	[ID_Cliente] [int] NOT NULL,
	[Fecha_Hora] [datetime] NULL,
	[Estado] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[ID_Proveedor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Contacto] [varchar](100) NULL,
	[Telefono] [varchar](20) NULL,
	[Email] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuejasSugerencias]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuejasSugerencias](
	[ID_Reporte] [int] IDENTITY(1,1) NOT NULL,
	[ID_Cliente] [int] NOT NULL,
	[Tipo] [varchar](20) NOT NULL,
	[Descripcion] [text] NOT NULL,
	[Fecha_Reporte] [datetime] NULL,
	[Estado] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Reporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReseñasClientes]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReseñasClientes](
	[ID_Reseña] [int] IDENTITY(1,1) NOT NULL,
	[ID_Cliente] [int] NOT NULL,
	[Puntuacion] [int] NULL,
	[Comentario] [text] NULL,
	[Fecha] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Reseña] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservacionMesas]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservacionMesas](
	[ID_Reservacion] [int] IDENTITY(1,1) NOT NULL,
	[ID_Cliente] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Hora] [time](7) NOT NULL,
	[CantidadPersonas] [int] NOT NULL,
	[Estado] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Reservacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicios]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicios](
	[ID_Servicio] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [text] NULL,
	[Precio] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiciosEventos]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiciosEventos](
	[ID_ServicioEvento] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [text] NULL,
	[Precio] [money] NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[Proveedor] [varchar](100) NULL,
	[Disponible] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_ServicioEvento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiciosPorEvento]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiciosPorEvento](
	[ID_ServicioEvento] [int] NOT NULL,
	[ID_ReservaSalon] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Subtotal] [money] NOT NULL,
	[Notas] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_ServicioEvento] ASC,
	[ID_ReservaSalon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketsCocina]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketsCocina](
	[ID_Ticket] [int] IDENTITY(1,1) NOT NULL,
	[ID_Pedido] [int] NOT NULL,
	[ID_DetallePedido] [int] NOT NULL,
	[FechaHora] [datetime] NOT NULL,
	[Estado] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VisitasCorporativas]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VisitasCorporativas](
	[ID_Visita] [int] IDENTITY(1,1) NOT NULL,
	[ID_Cliente] [int] NOT NULL,
	[Empresa] [varchar](100) NOT NULL,
	[Cargo] [varchar](50) NULL,
	[Motivo] [varchar](255) NOT NULL,
	[Fecha_Ingreso] [date] NOT NULL,
	[Fecha_Salida] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Visita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clientes] ADD  DEFAULT (getdate()) FOR [Fecha_Registro]
GO
ALTER TABLE [dbo].[Configuraciones] ADD  DEFAULT ((1)) FOR [Reservas_Online]
GO
ALTER TABLE [dbo].[ConsumoServicios] ADD  DEFAULT (getdate()) FOR [Fecha_Consumo]
GO
ALTER TABLE [dbo].[Empleados] ADD  CONSTRAINT [DF__Empleados__Estad__398D8EEE]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Facturacion] ADD  DEFAULT (getdate()) FOR [Fecha_Factura]
GO
ALTER TABLE [dbo].[FidelizacionClientes] ADD  DEFAULT ((0)) FOR [PuntosAcumulados]
GO
ALTER TABLE [dbo].[Ingredientes] ADD  DEFAULT (getdate()) FOR [Fecha_UltimaCompra]
GO
ALTER TABLE [dbo].[Ingredientes] ADD  DEFAULT ((10.00)) FOR [StockMinimo]
GO
ALTER TABLE [dbo].[Mantenimiento] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
ALTER TABLE [dbo].[Pagos] ADD  DEFAULT (getdate()) FOR [Fecha_Pago]
GO
ALTER TABLE [dbo].[Pedidos] ADD  DEFAULT (getdate()) FOR [Fecha_Hora]
GO
ALTER TABLE [dbo].[PedidosBar] ADD  DEFAULT (getdate()) FOR [Fecha_Hora]
GO
ALTER TABLE [dbo].[QuejasSugerencias] ADD  DEFAULT (getdate()) FOR [Fecha_Reporte]
GO
ALTER TABLE [dbo].[ReseñasClientes] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
ALTER TABLE [dbo].[AsignacionMesero]  WITH CHECK ADD FOREIGN KEY([ID_Mesero])
REFERENCES [dbo].[Meseros] ([ID_Mesero])
GO
ALTER TABLE [dbo].[AsignacionMesero]  WITH CHECK ADD FOREIGN KEY([ID_Pedido])
REFERENCES [dbo].[Pedidos] ([ID_Pedido])
GO
ALTER TABLE [dbo].[AsistenciaEmpleados]  WITH CHECK ADD FOREIGN KEY([ID_Empleado])
REFERENCES [dbo].[Empleados] ([ID_Empleado])
GO
ALTER TABLE [dbo].[ConsumoServicios]  WITH CHECK ADD FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Clientes] ([ID_Cliente])
GO
ALTER TABLE [dbo].[ConsumoServicios]  WITH CHECK ADD FOREIGN KEY([ID_Servicio])
REFERENCES [dbo].[Servicios] ([ID_Servicio])
GO
ALTER TABLE [dbo].[DetallePedido]  WITH CHECK ADD FOREIGN KEY([ID_Item])
REFERENCES [dbo].[Menu] ([ID_Item])
GO
ALTER TABLE [dbo].[DetallePedido]  WITH CHECK ADD FOREIGN KEY([ID_Pedido])
REFERENCES [dbo].[Pedidos] ([ID_Pedido])
GO
ALTER TABLE [dbo].[DetallePedidoBar]  WITH CHECK ADD FOREIGN KEY([ID_Bebida])
REFERENCES [dbo].[Bebidas] ([ID_Bebida])
GO
ALTER TABLE [dbo].[DetallePedidoBar]  WITH CHECK ADD FOREIGN KEY([ID_Pedido])
REFERENCES [dbo].[PedidosBar] ([ID_Pedido])
GO
ALTER TABLE [dbo].[Eventos]  WITH CHECK ADD FOREIGN KEY([ID_Organizador])
REFERENCES [dbo].[Clientes] ([ID_Cliente])
GO
ALTER TABLE [dbo].[Facturacion]  WITH CHECK ADD FOREIGN KEY([ID_Pago])
REFERENCES [dbo].[Pagos] ([ID_Pago])
GO
ALTER TABLE [dbo].[FidelizacionClientes]  WITH CHECK ADD FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Clientes] ([ID_Cliente])
GO
ALTER TABLE [dbo].[Ingredientes]  WITH CHECK ADD FOREIGN KEY([ID_Proveedor])
REFERENCES [dbo].[Proveedores] ([ID_Proveedor])
GO
ALTER TABLE [dbo].[InventarioLicores]  WITH CHECK ADD FOREIGN KEY([ID_Proveedor])
REFERENCES [dbo].[Proveedores] ([ID_Proveedor])
GO
ALTER TABLE [dbo].[Mantenimiento]  WITH CHECK ADD FOREIGN KEY([ID_Habitacion])
REFERENCES [dbo].[Habitaciones] ([ID_Habitacion])
GO
ALTER TABLE [dbo].[NotificacionesCocina]  WITH CHECK ADD  CONSTRAINT [FK_NotificacionesCocina_Menu] FOREIGN KEY([ID_Item])
REFERENCES [dbo].[Menu] ([ID_Item])
GO
ALTER TABLE [dbo].[NotificacionesCocina] CHECK CONSTRAINT [FK_NotificacionesCocina_Menu]
GO
ALTER TABLE [dbo].[NotificacionesCocina]  WITH CHECK ADD  CONSTRAINT [FK_NotificacionesCocina_Pedidos] FOREIGN KEY([ID_Pedido])
REFERENCES [dbo].[Pedidos] ([ID_Pedido])
GO
ALTER TABLE [dbo].[NotificacionesCocina] CHECK CONSTRAINT [FK_NotificacionesCocina_Pedidos]
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD FOREIGN KEY([ID_Reserva])
REFERENCES [dbo].[Reservas] ([ID_Reserva])
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Clientes] ([ID_Cliente])
GO
ALTER TABLE [dbo].[PedidosBar]  WITH CHECK ADD FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Clientes] ([ID_Cliente])
GO
ALTER TABLE [dbo].[QuejasSugerencias]  WITH CHECK ADD FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Clientes] ([ID_Cliente])
GO
ALTER TABLE [dbo].[RecetaIngredientes]  WITH CHECK ADD  CONSTRAINT [FK_RecetaIngredientes_Ingredientes] FOREIGN KEY([ID_Ingrediente])
REFERENCES [dbo].[Ingredientes] ([ID_Ingrediente])
GO
ALTER TABLE [dbo].[RecetaIngredientes] CHECK CONSTRAINT [FK_RecetaIngredientes_Ingredientes]
GO
ALTER TABLE [dbo].[RecetaIngredientes]  WITH CHECK ADD  CONSTRAINT [FK_RecetaIngredientes_Recetas] FOREIGN KEY([ID_Receta])
REFERENCES [dbo].[Recetas] ([ID_Receta])
GO
ALTER TABLE [dbo].[RecetaIngredientes] CHECK CONSTRAINT [FK_RecetaIngredientes_Recetas]
GO
ALTER TABLE [dbo].[Recetas]  WITH CHECK ADD  CONSTRAINT [FK_Recetas_Menu] FOREIGN KEY([ID_Item])
REFERENCES [dbo].[Menu] ([ID_Item])
GO
ALTER TABLE [dbo].[Recetas] CHECK CONSTRAINT [FK_Recetas_Menu]
GO
ALTER TABLE [dbo].[ReseñasClientes]  WITH CHECK ADD FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Clientes] ([ID_Cliente])
GO
ALTER TABLE [dbo].[ReservacionMesas]  WITH CHECK ADD FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Clientes] ([ID_Cliente])
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Clientes] ([ID_Cliente])
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD FOREIGN KEY([ID_Habitacion])
REFERENCES [dbo].[Habitaciones] ([ID_Habitacion])
GO
ALTER TABLE [dbo].[ReservasSalones]  WITH CHECK ADD  CONSTRAINT [FK_ReservasSalones_Clientes] FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Clientes] ([ID_Cliente])
GO
ALTER TABLE [dbo].[ReservasSalones] CHECK CONSTRAINT [FK_ReservasSalones_Clientes]
GO
ALTER TABLE [dbo].[ReservasSalones]  WITH CHECK ADD  CONSTRAINT [FK_ReservasSalones_Empleados] FOREIGN KEY([ID_EmpleadoResponsable])
REFERENCES [dbo].[Empleados] ([ID_Empleado])
GO
ALTER TABLE [dbo].[ReservasSalones] CHECK CONSTRAINT [FK_ReservasSalones_Empleados]
GO
ALTER TABLE [dbo].[ReservasSalones]  WITH CHECK ADD  CONSTRAINT [FK_ReservasSalones_SalonesEventos] FOREIGN KEY([ID_Salon])
REFERENCES [dbo].[SalonesEventos] ([ID_Salon])
GO
ALTER TABLE [dbo].[ReservasSalones] CHECK CONSTRAINT [FK_ReservasSalones_SalonesEventos]
GO
ALTER TABLE [dbo].[ServiciosPorEvento]  WITH CHECK ADD  CONSTRAINT [FK_ServiciosPorEvento_ReservasSalones] FOREIGN KEY([ID_ReservaSalon])
REFERENCES [dbo].[ReservasSalones] ([ID_ReservaSalon])
GO
ALTER TABLE [dbo].[ServiciosPorEvento] CHECK CONSTRAINT [FK_ServiciosPorEvento_ReservasSalones]
GO
ALTER TABLE [dbo].[ServiciosPorEvento]  WITH CHECK ADD  CONSTRAINT [FK_ServiciosPorEvento_ServiciosEventos] FOREIGN KEY([ID_ServicioEvento])
REFERENCES [dbo].[ServiciosEventos] ([ID_ServicioEvento])
GO
ALTER TABLE [dbo].[ServiciosPorEvento] CHECK CONSTRAINT [FK_ServiciosPorEvento_ServiciosEventos]
GO
ALTER TABLE [dbo].[TicketsCocina]  WITH CHECK ADD  CONSTRAINT [FK_TicketsCocina_DetallePedido] FOREIGN KEY([ID_DetallePedido])
REFERENCES [dbo].[DetallePedido] ([ID_Detalle])
GO
ALTER TABLE [dbo].[TicketsCocina] CHECK CONSTRAINT [FK_TicketsCocina_DetallePedido]
GO
ALTER TABLE [dbo].[TicketsCocina]  WITH CHECK ADD  CONSTRAINT [FK_TicketsCocina_Pedidos] FOREIGN KEY([ID_Pedido])
REFERENCES [dbo].[Pedidos] ([ID_Pedido])
GO
ALTER TABLE [dbo].[TicketsCocina] CHECK CONSTRAINT [FK_TicketsCocina_Pedidos]
GO
ALTER TABLE [dbo].[VisitasCorporativas]  WITH CHECK ADD FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Clientes] ([ID_Cliente])
GO
ALTER TABLE [dbo].[AsistenciaEmpleados]  WITH CHECK ADD CHECK  (([Estado]='Ausente' OR [Estado]='Presente'))
GO
ALTER TABLE [dbo].[Bebidas]  WITH CHECK ADD CHECK  (([Tipo]='Refresco' OR [Tipo]='Licor' OR [Tipo]='Vino' OR [Tipo]='Cerveza' OR [Tipo]='Cóctel'))
GO
ALTER TABLE [dbo].[Eventos]  WITH CHECK ADD CHECK  (([Tipo]='Otro' OR [Tipo]='Seminario' OR [Tipo]='Reunión' OR [Tipo]='Fiesta' OR [Tipo]='Boda' OR [Tipo]='Conferencia'))
GO
ALTER TABLE [dbo].[FidelizacionClientes]  WITH CHECK ADD CHECK  (([Nivel]='Oro' OR [Nivel]='Plata' OR [Nivel]='Básico'))
GO
ALTER TABLE [dbo].[Habitaciones]  WITH CHECK ADD CHECK  (([Estado]='Mantenimiento' OR [Estado]='Ocupada' OR [Estado]='Disponible'))
GO
ALTER TABLE [dbo].[Ingredientes]  WITH CHECK ADD CHECK  (([UnidadMedida]='Unidades' OR [UnidadMedida]='Mililitros' OR [UnidadMedida]='Litros' OR [UnidadMedida]='Kilogramos' OR [UnidadMedida]='Gramos'))
GO
ALTER TABLE [dbo].[InventarioLicores]  WITH CHECK ADD CHECK  (([Categoria]='Frutas' OR [Categoria]='Refresco' OR [Categoria]='Cerveza' OR [Categoria]='Vino' OR [Categoria]='Licor'))
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD CHECK  (([Tipo]='Bebida' OR [Tipo]='Postre' OR [Tipo]='Plato fuerte' OR [Tipo]='Entrada'))
GO
ALTER TABLE [dbo].[Meseros]  WITH CHECK ADD CHECK  (([Estado]='Inactivo' OR [Estado]='Activo'))
GO
ALTER TABLE [dbo].[MobiliarioEventos]  WITH CHECK ADD  CONSTRAINT [CK_MobiliarioEventos_Condicion] CHECK  (([Condicion]='Malo' OR [Condicion]='Regular' OR [Condicion]='Bueno' OR [Condicion]='Excelente'))
GO
ALTER TABLE [dbo].[MobiliarioEventos] CHECK CONSTRAINT [CK_MobiliarioEventos_Condicion]
GO
ALTER TABLE [dbo].[NotificacionesCocina]  WITH CHECK ADD  CONSTRAINT [CK_NotificacionesCocina_Estado] CHECK  (([Estado]='Pendiente' OR [Estado]='En proceso' OR [Estado]='Completada'))
GO
ALTER TABLE [dbo].[NotificacionesCocina] CHECK CONSTRAINT [CK_NotificacionesCocina_Estado]
GO
ALTER TABLE [dbo].[NotificacionesCocina]  WITH CHECK ADD  CONSTRAINT [CK_NotificacionesCocina_Prioridad] CHECK  (([Prioridad]='Alta' OR [Prioridad]='Media' OR [Prioridad]='Baja'))
GO
ALTER TABLE [dbo].[NotificacionesCocina] CHECK CONSTRAINT [CK_NotificacionesCocina_Prioridad]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD CHECK  (([Estado]='Cancelado' OR [Estado]='Servido' OR [Estado]='En preparación' OR [Estado]='Pendiente'))
GO
ALTER TABLE [dbo].[PedidosBar]  WITH CHECK ADD CHECK  (([Estado]='Cancelado' OR [Estado]='Servido' OR [Estado]='Pendiente'))
GO
ALTER TABLE [dbo].[QuejasSugerencias]  WITH CHECK ADD CHECK  (([Estado]='Cerrada' OR [Estado]='Resuelta' OR [Estado]='Pendiente'))
GO
ALTER TABLE [dbo].[QuejasSugerencias]  WITH CHECK ADD CHECK  (([Tipo]='Sugerencia' OR [Tipo]='Queja'))
GO
ALTER TABLE [dbo].[RecetaIngredientes]  WITH CHECK ADD  CONSTRAINT [CK_RecetaIngredientes_UnidadMedida] CHECK  (([UnidadMedida]='Gramos' OR [UnidadMedida]='Kilogramos' OR [UnidadMedida]='Litros' OR [UnidadMedida]='Mililitros' OR [UnidadMedida]='Unidades' OR [UnidadMedida]='Cucharadas'))
GO
ALTER TABLE [dbo].[RecetaIngredientes] CHECK CONSTRAINT [CK_RecetaIngredientes_UnidadMedida]
GO
ALTER TABLE [dbo].[Recetas]  WITH CHECK ADD  CONSTRAINT [CK_Recetas_Dificultad] CHECK  (([Dificultad]='Alta' OR [Dificultad]='Media' OR [Dificultad]='Baja'))
GO
ALTER TABLE [dbo].[Recetas] CHECK CONSTRAINT [CK_Recetas_Dificultad]
GO
ALTER TABLE [dbo].[ReseñasClientes]  WITH CHECK ADD CHECK  (([Puntuacion]>=(1) AND [Puntuacion]<=(5)))
GO
ALTER TABLE [dbo].[ReservacionMesas]  WITH CHECK ADD CHECK  (([Estado]='Cancelada' OR [Estado]='Confirmada' OR [Estado]='Pendiente'))
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD CHECK  (([Estado]='Completada' OR [Estado]='Cancelada' OR [Estado]='Confirmada'))
GO
ALTER TABLE [dbo].[ReservasSalones]  WITH CHECK ADD  CONSTRAINT [CK_ReservasSalones_Estado] CHECK  (([Estado]='Cancelada' OR [Estado]='Confirmada' OR [Estado]='Pendiente' OR [Estado]='Completada'))
GO
ALTER TABLE [dbo].[ReservasSalones] CHECK CONSTRAINT [CK_ReservasSalones_Estado]
GO
ALTER TABLE [dbo].[SalonesEventos]  WITH CHECK ADD  CONSTRAINT [CK_SalonesEventos_Estado] CHECK  (([Estado]='Mantenimiento' OR [Estado]='Disponible' OR [Estado]='Reservado'))
GO
ALTER TABLE [dbo].[SalonesEventos] CHECK CONSTRAINT [CK_SalonesEventos_Estado]
GO
ALTER TABLE [dbo].[TicketsCocina]  WITH CHECK ADD  CONSTRAINT [CK_TicketsCocina_Estado] CHECK  (([Estado]='Pendiente' OR [Estado]='En preparación' OR [Estado]='Listo'))
GO
ALTER TABLE [dbo].[TicketsCocina] CHECK CONSTRAINT [CK_TicketsCocina_Estado]
GO
/****** Object:  StoredProcedure [dbo].[sp_MarcarItemListo]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para marcar ítem como listo
CREATE PROCEDURE [dbo].[sp_MarcarItemListo]
    @ID_Ticket INT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRANSACTION;
    
    -- Marcar ticket como listo
    UPDATE [dbo].[TicketsCocina]
    SET Estado = 'Listo'
    WHERE ID_Ticket = @ID_Ticket;
    
    -- Verificar si todo el pedido está listo
    IF NOT EXISTS (
        SELECT 1 FROM [dbo].[TicketsCocina] 
        WHERE ID_Pedido = (SELECT ID_Pedido FROM [dbo].[TicketsCocina] WHERE ID_Ticket = @ID_Ticket)
        AND Estado <> 'Listo'
    )
    BEGIN
        UPDATE [dbo].[Pedidos]
        SET Estado = 'Servido'
        WHERE ID_Pedido = (SELECT ID_Pedido FROM [dbo].[TicketsCocina] WHERE ID_Ticket = @ID_Ticket);
    END
    
    COMMIT TRANSACTION;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ProcesarPedidoRestaurante]    Script Date: 22/05/2025 11:56:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ProcesarPedidoRestaurante]
    @ID_Pedido INT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Verificar disponibilidad de ingredientes
        IF EXISTS (
            SELECT 1
            FROM [dbo].[DetallePedido] DP
            JOIN [dbo].[Recetas] R ON DP.ID_Item = R.ID_Item
            JOIN [dbo].[RecetaIngredientes] RI ON R.ID_Receta = RI.ID_Receta
            JOIN [dbo].[Ingredientes] I ON RI.ID_Ingrediente = I.ID_Ingrediente
            WHERE DP.ID_Pedido = @ID_Pedido
            AND (I.StockDisponible - (RI.Cantidad * DP.Cantidad)) < 0
        )
        BEGIN
            RAISERROR('No hay suficiente inventario para completar el pedido', 16, 1);
            RETURN;
        END
        
        -- Actualizar estado del pedido
        UPDATE [dbo].[Pedidos]
        SET Estado = 'En preparación'
        WHERE ID_Pedido = @ID_Pedido;
        
        -- Generar tickets de cocina (opcional, podría ser otra tabla)
        INSERT INTO [dbo].[TicketsCocina] (
            ID_Pedido, ID_DetallePedido, FechaHora, Estado
        )
        SELECT 
            @ID_Pedido,
            DP.ID_Detalle,
            GETDATE(),
            'Pendiente'
        FROM [dbo].[DetallePedido] DP
        WHERE DP.ID_Pedido = @ID_Pedido;
        
        -- Registrar tiempo estimado de preparación
        DECLARE @TiempoTotal INT;
        
        SELECT @TiempoTotal = SUM(R.TiempoPreparacion * DP.Cantidad)
        FROM [dbo].[DetallePedido] DP
        JOIN [dbo].[Recetas] R ON DP.ID_Item = R.ID_Item
        WHERE DP.ID_Pedido = @ID_Pedido;
        
        UPDATE [dbo].[Pedidos]
        SET Fecha_Hora = DATEADD(MINUTE, @TiempoTotal, Fecha_Hora)
        WHERE ID_Pedido = @ID_Pedido;
        
        COMMIT TRANSACTION;
        
        -- Retornar información para la cocina
        SELECT * FROM [dbo].[V_RecetasParaCocina] 
        WHERE ID_Pedido = @ID_Pedido;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO
USE [master]
GO
ALTER DATABASE [Best_Western_plus] SET  READ_WRITE 
GO
