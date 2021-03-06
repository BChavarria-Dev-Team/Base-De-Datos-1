USE [master]
GO
/****** Object:  Database [New EMN Logistics]    Script Date: 17/2/2021 04:58:37 ******/
CREATE DATABASE [New EMN Logistics]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'New EMN Logistics', FILENAME = N'C:\SQL Server\New EMN Logistics\New EMN Logistics.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'New EMN Logistics_log', FILENAME = N'C:\SQL Server\New EMN Logistics\New EMN Logistics_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [New EMN Logistics] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [New EMN Logistics].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [New EMN Logistics] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [New EMN Logistics] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [New EMN Logistics] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [New EMN Logistics] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [New EMN Logistics] SET ARITHABORT OFF 
GO
ALTER DATABASE [New EMN Logistics] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [New EMN Logistics] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [New EMN Logistics] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [New EMN Logistics] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [New EMN Logistics] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [New EMN Logistics] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [New EMN Logistics] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [New EMN Logistics] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [New EMN Logistics] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [New EMN Logistics] SET  DISABLE_BROKER 
GO
ALTER DATABASE [New EMN Logistics] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [New EMN Logistics] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [New EMN Logistics] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [New EMN Logistics] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [New EMN Logistics] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [New EMN Logistics] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [New EMN Logistics] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [New EMN Logistics] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [New EMN Logistics] SET  MULTI_USER 
GO
ALTER DATABASE [New EMN Logistics] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [New EMN Logistics] SET DB_CHAINING OFF 
GO
ALTER DATABASE [New EMN Logistics] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [New EMN Logistics] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [New EMN Logistics] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [New EMN Logistics] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [New EMN Logistics] SET QUERY_STORE = OFF
GO
USE [New EMN Logistics]
GO
/****** Object:  Table [dbo].[DetalleProveedor]    Script Date: 17/2/2021 04:58:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleProveedor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[NombreEmpleado] [nvarchar](15) NOT NULL,
	[ApellidoEmpleado] [nvarchar](15) NOT NULL,
	[CorreoPrivado] [nvarchar](120) NULL,
	[TelefonoPrivado] [char](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 17/2/2021 04:58:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idDetalleProveedor] [int] NOT NULL,
	[NombreEmpresa] [nvarchar](25) NOT NULL,
	[Direccion] [nvarchar](max) NULL,
	[RUC] [char](13) NOT NULL,
	[CorreoEmpresa] [nvarchar](120) NOT NULL,
	[TelefonoEmpresa] [char](8) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[VistaProveedores]    Script Date: 17/2/2021 04:58:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[VistaProveedores]
as 
select NombreEmpresa as 'Empresa', Direccion, CorreoEmpresa as 'Correo Electronico', TelefonoEmpresa 
as 'Telefono empresa del Proveedor', NombreEmpleado as 'Nombre', ApellidoEmpleado as 'Apellido', TelefonoPrivado as 'Telefono', CorreoPrivado as 'Correo'
from Proveedor inner join DetalleProveedor on Proveedor.idDetalleProveedor = DetalleProveedor.id
GO
/****** Object:  Table [dbo].[DetalleCliente]    Script Date: 17/2/2021 04:58:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleCliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[NombreEmpleado] [nvarchar](15) NOT NULL,
	[ApellidoEmpleado] [nvarchar](15) NOT NULL,
	[CorreoPrivado] [nvarchar](120) NULL,
	[TelefonoPrivado] [char](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 17/2/2021 04:58:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idDetalleCliente] [int] NOT NULL,
	[NombreEmpresa] [nvarchar](25) NOT NULL,
	[Direccion] [nvarchar](max) NULL,
	[RUC] [char](13) NOT NULL,
	[CorreoEmpresa] [nvarchar](120) NOT NULL,
	[TelefonoEmpresa] [char](8) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[VistaClientes]    Script Date: 17/2/2021 04:58:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[VistaClientes]
as 
select NombreEmpresa as 'Empresa', Direccion, CorreoEmpresa as 'Correo Electronico', TelefonoEmpresa 
as 'Telefono empresa del Cliente', NombreEmpleado as 'Nombre', ApellidoEmpleado as 'Apellido', TelefonoPrivado as 'Telefono', CorreoPrivado as 'Correo'
from Cliente inner join DetalleCliente on Cliente.idDetalleCliente = DetalleCliente.id
GO
/****** Object:  Table [dbo].[DetalleContenedor]    Script Date: 17/2/2021 04:58:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleContenedor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sizeContenedor] [tinyint] NULL,
	[TipoContenedor] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VistaTipoContenedores]    Script Date: 17/2/2021 04:58:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[VistaTipoContenedores]
as
select TipoContenedor as 'Tipo de Contenedor' from DetalleContenedor
GO
/****** Object:  View [dbo].[VistaSizeContenedores]    Script Date: 17/2/2021 04:58:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[VistaSizeContenedores]
as
select sizeContenedor as 'Tamaño Contenedor' from DetalleContenedor
GO
/****** Object:  Table [dbo].[Contenedor]    Script Date: 17/2/2021 04:58:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contenedor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idDetalleContenedor] [int] NOT NULL,
	[Codigo] [char](4) NOT NULL,
	[PrecioCompra] [float] NULL,
	[PrecioVenta] [float] NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VistaContenedores]    Script Date: 17/2/2021 04:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[VistaContenedores]
as
select TipoContenedor as 'Tipo de Contenedor',  sizeContenedor as 'Tamaño Contenedor', Codigo as 'Codigo de Propietario',
PrecioCompra as 'Precio de Compra', PrecioVenta as 'Precio de Venta'  from DetalleContenedor
inner join Contenedor on DetalleContenedor.id = Contenedor.idDetalleContenedor
GO
/****** Object:  Table [dbo].[Compra]    Script Date: 17/2/2021 04:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idProveedor] [int] NOT NULL,
	[FechaCompra] [datetime] NOT NULL,
	[totalComprado] [float] NULL,
	[idContenedor] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 17/2/2021 04:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NOT NULL,
	[FechaVenta] [datetime] NOT NULL,
	[totalVendido] [float] NULL,
	[idContenedor] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Compra] ADD  DEFAULT (getdate()) FOR [FechaCompra]
GO
ALTER TABLE [dbo].[Contenedor] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT (getdate()) FOR [FechaVenta]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD FOREIGN KEY([idDetalleCliente])
REFERENCES [dbo].[DetalleCliente] ([id])
GO
ALTER TABLE [dbo].[Compra]  WITH CHECK ADD FOREIGN KEY([idContenedor])
REFERENCES [dbo].[Contenedor] ([id])
GO
ALTER TABLE [dbo].[Compra]  WITH CHECK ADD FOREIGN KEY([idProveedor])
REFERENCES [dbo].[Proveedor] ([id])
GO
ALTER TABLE [dbo].[Contenedor]  WITH CHECK ADD FOREIGN KEY([idDetalleContenedor])
REFERENCES [dbo].[DetalleContenedor] ([id])
GO
ALTER TABLE [dbo].[Proveedor]  WITH CHECK ADD FOREIGN KEY([idDetalleProveedor])
REFERENCES [dbo].[DetalleProveedor] ([id])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([id])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([idContenedor])
REFERENCES [dbo].[Contenedor] ([id])
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD CHECK  (([RUC] like '[0][0][1][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD CHECK  (([TelefonoEmpresa] like '[2|8|7|5][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Contenedor]  WITH CHECK ADD CHECK  (([Codigo] like '[0-9][0-9][0-9][A-Z]'))
GO
ALTER TABLE [dbo].[DetalleCliente]  WITH CHECK ADD CHECK  (([TelefonoPrivado] like '[2|8|7|5][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[DetalleProveedor]  WITH CHECK ADD CHECK  (([TelefonoPrivado] like '[2|8|7|5][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Proveedor]  WITH CHECK ADD CHECK  (([RUC] like '[0][0][1][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Proveedor]  WITH CHECK ADD CHECK  (([TelefonoEmpresa] like '[2|8|7|5][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
/****** Object:  StoredProcedure [dbo].[BuscaClienteNombre]    Script Date: 17/2/2021 04:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[BuscaClienteNombre]
@NombreEmpresa nvarchar(25)
as
select NombreEmpresa as 'Empresa', Direccion, CorreoEmpresa as 'Correo Electronico', TelefonoEmpresa 
as 'Telefono empresa del Cliente', NombreEmpleado as 'Nombre', ApellidoEmpleado as 'Apellido',
TelefonoPrivado as 'Telefono del Contacto', CorreoPrivado as 'Correo del Contacto',RUC as 'Numero RUC'
from Cliente inner join DetalleCliente on Cliente.idDetalleCliente = DetalleCliente.id where Cliente.NombreEmpresa = @NombreEmpresa
GO
/****** Object:  StoredProcedure [dbo].[BuscaProveedorNombre]    Script Date: 17/2/2021 04:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[BuscaProveedorNombre]
@NombreEmpresa nvarchar(25)
as
select NombreEmpresa as 'Empresa', Direccion, CorreoEmpresa as 'Correo Electronico', TelefonoEmpresa 
as 'Telefono empresa del Proveedor', NombreEmpleado as 'Nombre', ApellidoEmpleado as 'Apellido', TelefonoPrivado as 'Telefono', CorreoPrivado as 'Correo'
from Proveedor inner join DetalleProveedor on Proveedor.idDetalleProveedor = DetalleProveedor.id where Proveedor.NombreEmpresa = @NombreEmpresa
GO
/****** Object:  StoredProcedure [dbo].[DiccionarioDeDatos]    Script Date: 17/2/2021 04:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DiccionarioDeDatos]
AS
select 
	d.object_id,
	a.name [table], -- identificara la Tabla
	b.name [column], -- identificara la columna
	c.name [type], -- identificara el Tipo
	CASE-- recibe el tipo de columna
	  --cuando c es   numerico  o   c es     decimal   o  c es      Float   entonces se precisa el numero
		WHEN c.name = 'numeric' OR  c.name = 'decimal' OR c.name = 'float'  THEN b.precision
		ELSE null
	END [Precision], 
--  recibe maximo tama�o de b
	b.max_length, 
	CASE -- recibe si la columna acepta nulos
		WHEN b.is_nullable = 0 THEN 'NO'
		ELSE 'SI'
	END [Permite Nulls],
	CASE -- recibe si la columna es identity (autoincrementable)
		WHEN b.is_identity = 0 THEN 'NO'
		ELSE 'SI'
	END [Es Autonumerico],	
	ep.value [Descripcion],-- recibe la descripcion de la columna(si la hay)
	f.ForeignKey, -- recibe si es llave foranea
	f.ReferenceTableName, -- recibe la referencia de la tabla
	f.ReferenceColumnName -- recibe la referencia de la columna
from sys.tables a   
      --          //    Seleciona y muestra toda la informacion   \\          --
	inner join sys.columns b on a.object_id= b.object_id 
	inner join sys.systypes c on b.system_type_id= c.xtype 
	inner join sys.objects d on a.object_id= d.object_id 
	LEFT JOIN sys.extended_properties ep ON d.object_id = ep.major_id AND b.column_Id = ep.minor_id
	LEFT JOIN (SELECT 
				f.name AS ForeignKey,
				OBJECT_NAME(f.parent_object_id) AS TableName,
				COL_NAME(fc.parent_object_id,fc.parent_column_id) AS ColumnName,
				OBJECT_NAME (f.referenced_object_id) AS ReferenceTableName,
				COL_NAME(fc.referenced_object_id,fc.referenced_column_id) AS ReferenceColumnName
				FROM sys.foreign_keys AS f
				INNER JOIN sys.foreign_key_columns AS fc ON f.OBJECT_ID = fc.constraint_object_id) 	f ON f.TableName =a.name AND f.ColumnName =b.name
WHERE a.name <> 'sysdiagrams' 
ORDER BY a.name,b.column_Id
GO
/****** Object:  StoredProcedure [dbo].[ListarClientes]    Script Date: 17/2/2021 04:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ListarClientes]
as
select NombreEmpresa as 'Empresa', Direccion, CorreoEmpresa as 'Correo Electronico', TelefonoEmpresa 
as 'Telefono empresa del Cliente', NombreEmpleado as 'Nombre', ApellidoEmpleado as 'Apellido',
TelefonoPrivado as 'Telefono del Contacto', CorreoPrivado as 'Correo del Contacto',RUC as 'Numero RUC'
from Cliente inner join DetalleCliente on Cliente.idDetalleCliente = DetalleCliente.id
GO
/****** Object:  StoredProcedure [dbo].[ListarContenedoresComprados]    Script Date: 17/2/2021 04:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ListarContenedoresComprados] 
as
select FechaCompra as 'Dia en que se Compro', totalComprado as 'Total Pagado', Proveedor.NombreEmpresa as 'Proveedor',
DetalleContenedor.TipoContenedor as 'Tipo de Contenedor', DetalleContenedor.sizeContenedor as 'Tamaño del Contenedor',
Contenedor.Codigo as 'Codigo De Propietario', Contenedor.Estado
from Compra inner join Contenedor on Compra.idContenedor = Contenedor.id inner join DetalleContenedor on
Contenedor.idDetalleContenedor = DetalleContenedor.id inner join Proveedor on Compra.idProveedor = Proveedor.id where Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ListarContenedoresVendidos]    Script Date: 17/2/2021 04:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ListarContenedoresVendidos]
as
select FechaVenta as 'Dia en que se Vendio', totalVendido as 'Total Obtenido', Cliente.NombreEmpresa as 'Comprador',
DetalleContenedor.TipoContenedor as 'Tipo de Contenedor', DetalleContenedor.sizeContenedor as 'Tamaño del Contenedor',
Contenedor.Codigo as 'Codigo De Propietario', Contenedor.Estado
from Venta inner join Contenedor on Venta.idContenedor = Contenedor.id inner join DetalleContenedor on
Contenedor.idDetalleContenedor = DetalleContenedor.id inner join Cliente on Venta.idCliente = Cliente.id where Estado = 0
GO
/****** Object:  StoredProcedure [dbo].[ListarGanancias]    Script Date: 17/2/2021 04:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ListarGanancias]
as

select Proveedor.NombreEmpresa as 'Empresa Proveedora', Cliente.NombreEmpresa as 'Empresa Compradora',
DetalleContenedor.TipoContenedor as 'Tipo de Contenedor', DetalleContenedor.sizeContenedor as 'Tamaño del Contenedor',
Contenedor.Codigo as 'Codigo de Contenedor', Compra.totalComprado as 'Se Compro en el valor de', 
Venta.totalVendido as 'Se Vendio con el valor de', totalVendido-totalComprado as 'Se obtuvo una ganancia de', Estado
from Compra inner join Proveedor on Compra.idProveedor = Proveedor.id 
inner join Contenedor on Compra.idContenedor = Contenedor.id inner join Venta on Contenedor.id = Venta.idContenedor
inner join Cliente on Venta.idCliente = Cliente.id inner join DetalleContenedor on Contenedor.idDetalleContenedor = DetalleContenedor.id
where Estado = 0
GO
/****** Object:  StoredProcedure [dbo].[ListarProveedores]    Script Date: 17/2/2021 04:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ListarProveedores]
as
select NombreEmpresa as 'Empresa', Direccion, CorreoEmpresa as 'Correo Electronico', TelefonoEmpresa 
as 'Telefono empresa del Cliente', NombreEmpleado as 'Nombre', ApellidoEmpleado as 'Apellido',
TelefonoPrivado as 'Telefono del Contacto', CorreoPrivado as 'Correo del Contacto',RUC as 'Numero RUC'
from Proveedor inner join DetalleProveedor on Proveedor.idDetalleProveedor = DetalleProveedor.id
GO
/****** Object:  StoredProcedure [dbo].[ModificaCliente]    Script Date: 17/2/2021 04:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificaCliente]
	-- Add the parameters for the stored procedure here
	@NombreEmpresa nvarchar(25),	
	@Direccion nvarchar(max),
	@CorreoPriv nvarchar(120),
	@TelefonoPriv char(8)
	as
	declare @idCliente as int 
	declare @idDetalle as int
	set @idCliente = (select id from Cliente where NombreEmpresa = @NombreEmpresa)
	update Cliente set Direccion = @Direccion where id = @idCliente
	set @idDetalle = (select DetalleCliente.id from DetalleCliente inner join Cliente on DetalleCliente.id = Cliente.idDetalleCliente where NombreEmpresa = @NombreEmpresa)
	update DetalleCliente set TelefonoPrivado = @TelefonoPriv,CorreoPrivado = @CorreoPriv where id = @idDetalle
GO
/****** Object:  StoredProcedure [dbo].[ModificaProveedor]    Script Date: 17/2/2021 04:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificaProveedor]
	-- Add the parameters for the stored procedure here
	@NombreEmpresa nvarchar(25),	
	@Direccion nvarchar(max),
	@CorreoPriv nvarchar(120),
	@TelefonoPriv char(8)
	as
	declare @idCliente as int 
	declare @idDetalle as int
	set @idCliente = (select id from Cliente where NombreEmpresa = @NombreEmpresa)
	update Cliente set Direccion = @Direccion where id = @idCliente
	set @idDetalle = (select DetalleCliente.id from DetalleCliente inner join Cliente on DetalleCliente.id = Cliente.idDetalleCliente where NombreEmpresa = @NombreEmpresa)
	update DetalleCliente set TelefonoPrivado = @TelefonoPriv,CorreoPrivado = @CorreoPriv where id = @idDetalle
	
GO
/****** Object:  StoredProcedure [dbo].[NuevaCompra]    Script Date: 17/2/2021 04:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NuevaCompra]
@NombreEmpresa nvarchar(25),
@PrecioCompra float,
@sizeContenedor tinyInt ,
@CodigoPropietario char(4),
@TipoContenedor varchar(15)
as
declare @idEmpresa as int 
declare @idDetalle as int
declare @idContenedor as int 
declare @fechaCompras as datetime
	set @fechaCompras = GETDATE()
	if exists (select id from Proveedor where NombreEmpresa = @NombreEmpresa)
		begin 
			set @idEmpresa = (select id from Proveedor where NombreEmpresa = @NombreEmpresa)
				if exists (select id from DetalleContenedor where TipoContenedor = @TipoContenedor and sizeContenedor = @sizeContenedor)
				begin
					set @idDetalle = (select id from DetalleContenedor where TipoContenedor = @TipoContenedor and sizeContenedor = @sizeContenedor)					
					insert into Contenedor (idDetalleContenedor,Codigo,PrecioCompra)values(@idDetalle,@CodigoPropietario,@PrecioCompra)
					set @idContenedor = (select id from Contenedor where Codigo = @CodigoPropietario)
					insert into Compra (idProveedor,FechaCompra,totalComprado,idContenedor) values (@idEmpresa,@fechaCompras,@PrecioCompra,@idContenedor)
				end
				else 
				begin
					insert into DetalleContenedor values (@sizeContenedor,@TipoContenedor)
					set @idDetalle = (select id from DetalleContenedor where TipoContenedor = @TipoContenedor and sizeContenedor = @sizeContenedor)
					insert into Contenedor (idDetalleContenedor,Codigo,PrecioCompra)values(@idDetalle,@CodigoPropietario,@PrecioCompra)
					set @idContenedor = (select id from Contenedor where Codigo = @CodigoPropietario)
					insert into Compra (idProveedor,FechaCompra,totalComprado,idContenedor) values (@idEmpresa,@fechaCompras,@PrecioCompra,@idContenedor)
				end							
		end
	else	
		begin 
			print 'La Empresa no esta registrada en la base de datos'
		end

		
GO
/****** Object:  StoredProcedure [dbo].[NuevaVenta]    Script Date: 17/2/2021 04:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NuevaVenta]
@NombreEmpresa nvarchar(25),
@PrecioVenta float,
@CodigoPropietario char(4)
as
declare @idEmpresa as int 
declare @idDetalle as int
declare @idContenedor as int 
declare @fechaVentas as datetime
	set @fechaVentas = GETDATE()
	if exists (select id from Cliente where NombreEmpresa = @NombreEmpresa)
		begin 
			set @idEmpresa = (select id from Cliente where NombreEmpresa = @NombreEmpresa)
				set @idContenedor = (select id from Contenedor where Codigo = @CodigoPropietario)				
				insert into Venta (idCliente,FechaVenta,totalVendido,idContenedor) values (@idEmpresa,@fechaVentas,@PrecioVenta,@idContenedor)
				update Contenedor set Estado = 0, PrecioVenta = @PrecioVenta where id = @idContenedor
		end
	else	
		begin 
			print 'La Empresa no esta registrada en la base de datos'
		end
GO
/****** Object:  StoredProcedure [dbo].[NuevoCliente]    Script Date: 17/2/2021 04:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[NuevoCliente]
@NombreEmpresa nvarchar(25),
@NombreEmpleado nvarchar(15),
@ApellidoEmpleado nvarchar(15),
@Direccion nvarchar(max),
@RUC char (13),
@CorreoEmpresa nvarchar(120),
@CorreoPriv nvarchar(120),
@TelefonoEmpresa char(8),
@TelefonoPriv char(8)
as
declare @idDetalleCliente as int

insert into DetalleCliente (NombreEmpleado,ApellidoEmpleado,CorreoPrivado,TelefonoPrivado) values (@NombreEmpleado,@ApellidoEmpleado,@CorreoPriv,@TelefonoPriv)

set @idDetalleCliente = (select id from DetalleCliente where NombreEmpleado = @NombreEmpleado)

insert into Cliente (idDetalleCliente,NombreEmpresa,Direccion,RUC,CorreoEmpresa,TelefonoEmpresa) values (@idDetalleCliente,@NombreEmpresa,@Direccion,@RUC,@CorreoEmpresa,@TelefonoEmpresa)
GO
/****** Object:  StoredProcedure [dbo].[NuevoProveedor]    Script Date: 17/2/2021 04:58:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NuevoProveedor]
@NombreEmpresa nvarchar(25),
@NombreEmpleado nvarchar(15),
@ApellidoEmpleado nvarchar(15),
@Direccion nvarchar(max),
@RUC char (13),
@CorreoEmpresa nvarchar(120),
@CorreoPriv nvarchar(120),
@TelefonoEmpresa char(8),
@TelefonoPriv char(8)
as
declare @idDetalleProveedor as int

insert into DetalleProveedor(NombreEmpleado,ApellidoEmpleado,CorreoPrivado,TelefonoPrivado) values (@NombreEmpleado,@ApellidoEmpleado,@CorreoPriv,@TelefonoPriv)

set @idDetalleProveedor = (select id from DetalleProveedor where NombreEmpleado = @NombreEmpleado)

insert into Proveedor(idDetalleProveedor,NombreEmpresa,Direccion,RUC,CorreoEmpresa,TelefonoEmpresa) values (@idDetalleProveedor,@NombreEmpresa,@Direccion,@RUC,@CorreoEmpresa,@TelefonoEmpresa)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave que representa un objeto Cliente en la base de datos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cliente', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave que hace referencia a un objeto DetalleCliente en la base de datos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cliente', @level2type=N'COLUMN',@level2name=N'idDetalleCliente'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre de la Empresa Cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cliente', @level2type=N'COLUMN',@level2name=N'NombreEmpresa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Direccion o Localizacion de la empresa cliente fisicamente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cliente', @level2type=N'COLUMN',@level2name=N'Direccion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Registro Unico de Contribuyente de la empresa cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cliente', @level2type=N'COLUMN',@level2name=N'RUC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Correo para contactar a la empresa cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cliente', @level2type=N'COLUMN',@level2name=N'CorreoEmpresa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Telefono para contactar a la empresa cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cliente', @level2type=N'COLUMN',@level2name=N'TelefonoEmpresa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave que representa una compra en la base de datos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Compra', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave que hace referencia a un objeto Proveedor en la base de datos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Compra', @level2type=N'COLUMN',@level2name=N'idProveedor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha en que se realizo la accion Compra' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Compra', @level2type=N'COLUMN',@level2name=N'FechaCompra'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total Pagado durante la accion Compra' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Compra', @level2type=N'COLUMN',@level2name=N'totalComprado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave que hace referenca al objeto Contenedor en la base de datos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Compra', @level2type=N'COLUMN',@level2name=N'idContenedor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave que representa un objeto Contenedor en la Base de datos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Contenedor', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave que referencia a un objeto DetalleContenedor en la base de datos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Contenedor', @level2type=N'COLUMN',@level2name=N'idDetalleContenedor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codigo de propietario de un contenedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Contenedor', @level2type=N'COLUMN',@level2name=N'Codigo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Precio de Compra del contenedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Contenedor', @level2type=N'COLUMN',@level2name=N'PrecioCompra'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Precio de Venta del Contenedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Contenedor', @level2type=N'COLUMN',@level2name=N'PrecioVenta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si el contenedor esta disponible para ser vendido' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Contenedor', @level2type=N'COLUMN',@level2name=N'Estado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave que representa un objeto DetalleCliente en la bd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DetalleCliente', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del Representante de una empresa Cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DetalleCliente', @level2type=N'COLUMN',@level2name=N'NombreEmpleado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Apellido del Representante de una empresa Cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DetalleCliente', @level2type=N'COLUMN',@level2name=N'ApellidoEmpleado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Correo Personal del Representante de una empresa Cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DetalleCliente', @level2type=N'COLUMN',@level2name=N'CorreoPrivado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Telefono Personal del Representante de una empresa Cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DetalleCliente', @level2type=N'COLUMN',@level2name=N'TelefonoPrivado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave que representa un objeto DetalleContenedor en la bd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DetalleContenedor', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tamaño del contenedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DetalleContenedor', @level2type=N'COLUMN',@level2name=N'sizeContenedor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo del Contenedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DetalleContenedor', @level2type=N'COLUMN',@level2name=N'TipoContenedor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave que representa un objeto DetalleProveedor en la bd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DetalleProveedor', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del representante de una Empresa Proveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DetalleProveedor', @level2type=N'COLUMN',@level2name=N'NombreEmpleado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Apellido del representante de una Empresa Proveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DetalleProveedor', @level2type=N'COLUMN',@level2name=N'ApellidoEmpleado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Correo Personal del representante de una Empresa Proveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DetalleProveedor', @level2type=N'COLUMN',@level2name=N'CorreoPrivado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Telefono personal del representante de una Empresa Proveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DetalleProveedor', @level2type=N'COLUMN',@level2name=N'TelefonoPrivado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave que representa una EmpresaProveedor en la bd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Proveedor', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave que referencia a un objeto DetalleProveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Proveedor', @level2type=N'COLUMN',@level2name=N'idDetalleProveedor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre de la EmpresaProveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Proveedor', @level2type=N'COLUMN',@level2name=N'NombreEmpresa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Direccion o localizacion fisica de la empresaProveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Proveedor', @level2type=N'COLUMN',@level2name=N'Direccion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Registro Unico de Contribucion de la empresaProveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Proveedor', @level2type=N'COLUMN',@level2name=N'RUC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Correo Principal de la empresaProveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Proveedor', @level2type=N'COLUMN',@level2name=N'CorreoEmpresa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Telefono Principal de la empresaProveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Proveedor', @level2type=N'COLUMN',@level2name=N'TelefonoEmpresa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave que representa una accion de Venta en la bd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Venta', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave que representa a una empresaCliente ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Venta', @level2type=N'COLUMN',@level2name=N'idCliente'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha en que se realizo la venta' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Venta', @level2type=N'COLUMN',@level2name=N'FechaVenta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total recibido por la venta' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Venta', @level2type=N'COLUMN',@level2name=N'totalVendido'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave que referencia al contenedor vendido' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Venta', @level2type=N'COLUMN',@level2name=N'idContenedor'
GO
USE [master]
GO
ALTER DATABASE [New EMN Logistics] SET  READ_WRITE 
GO
