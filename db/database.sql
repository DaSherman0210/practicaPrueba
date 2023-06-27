-- Active: 1686770308319@@127.0.0.1@3306@alquilartemis
CREATE DATABASE pruebaAlquiler;

USE pruebaAlquiler;

DROP DATABASE pruebaAlquiler;

CREATE TABLE usuarios(
    id_usuario INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR (100) NOT NULL,
    edad INT NOT NULL,
    direccion VARCHAR (100) NOT NULL,
    email VARCHAR (100) NOT NULL,
    telefono VARCHAR (100) NOT NULL,
    fecha_registro DATE NOT NULL
);


DROP TABLE usuarios;

CREATE TABLE productos(
    id_producto INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR (100) NOT NULL,
    descripcion VARCHAR (100) NOT NULL,
    precio BIGINT NOT NULL,
    cantidad_stock INT NOT NULL,
    proveedor VARCHAR (100) NOT NULL,
    fecha_creacion DATE NOT NULL
);


DROP TABLE productos;

CREATE TABLE pedidos(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    fecha_pedido INT NOT NULL,
    estado VARCHAR (100) NOT NULL,
    direccion_entrega VARCHAR (100) NOT NULL,
    Foreign Key (id_usuario) REFERENCES usuarios (id_usuario),
    Foreign Key (id_producto) REFERENCES productos (id_producto)
);

CREATE TABLE categorias(
    id_categoria INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR (100) NOT NULL,
    descripcion VARCHAR (100) NOT NULL,
    fecha_creacion DATE NOT NULL,
    fecha_actualizacion DATE NOT NULL,
    usuario_creacion VARCHAR (100) NOT NULL,
    usuario_actualizacion VARCHAR (100) NOT NULL
);

INSERT INTO categorias(id_categoria,nombre,descripcion,fecha_creacion,fecha_actualizacion,usuario_creacion,usuario_actualizacion)VALUES
( 1, "muebles" , "comodos" , "2020/12/25" , "2023/07/30" , "carlos" , "maicol"),
( 2, "salon" , "amplio" , "2022/02/02" , "2010/08/23" , "juan" , "miguel" );




CREATE TABLE ventas(
    id_venta INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_producto INT NOT NULL,
    id_usuario INT NOT NULL,
    cantidad INT NOT NULL,
    precio_total BIGINT NOT NULL,
    fecha_venta DATE NOT NULL,
    metodo_pago VARCHAR (100) NOT NULL,
    Foreign Key (id_producto) REFERENCES productos (id_producto),
    Foreign Key (id_usuario) REFERENCES usuarios (id_usuario)
);

CREATE TABLE comentarios(
    id_comentario INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_producto INT NOT NULL,
    id_usuario INT NOT NULL,
    contenido VARCHAR (100) NOT NULL,
    fecha_comentario DATE NOT NULL,
    valoracion INT NOT NULL,
    aprobado BOOLEAN NOT NULL,
    Foreign Key (id_producto) REFERENCES productos (id_producto),
    Foreign Key (id_usuario) REFERENCES usuarios (id_usuario)
);