SELECT * FROM Habitaciones;

INSERT INTO Habitaciones (ID_Habitacion, Numero_Habitacion, Tipo, Capacidad, Precio_Noche, Estado)
VALUES
();

CREATE TABLE [dbo].[Tipo_Habitacion](
    [ID_Tipo] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Nombre] [varchar](100) NOT NULL, -- Ej: "Suite-1 King Bed, Non-Smoking"
    [Descripcion] [varchar](255) NULL,
    [Capacidad_Adultos] [int] NOT NULL DEFAULT 2,
    [Capacidad_Ninos] [int] NULL,
    [Tipo_Cama] [varchar](100) NOT NULL, -- Ej: "1 King Bed", "2 Double Beds"
);
