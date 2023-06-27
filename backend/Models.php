<?php 

class Categorias extends Conectar{

    public function get_categorias(){
        try {  
            $conectar = parent:: conexion();
            parent::set_name();
            $stm = $conectar -> prepare("SELECT * FROM categorias");
            $stm -> execute(); 
            return $stm -> fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            return $e -> getMessage();
        }
    }

    public function insert_categoria($nombre , $descripcion , $fecha_creacion , $fecha_actualizacion , $usuario_creacion , $usuario_actualizacion ){
        try {
            $conectar = parent:: conexion();
            parent::set_name();
            $stm = $conectar ->prepare("INSERT INTO categorias (nombre , descripcion , fecha_creacion , fecha_actualizacion , usuario_creacion , usuario_actualizacion) VALUES (?,?,?,?,?,?)");
            $stm -> bindValue(1, $nombre);
            $stm -> bindValue(2, $descripcion);
            $stm -> bindValue(3, $fecha_creacion);
            $stm -> bindValue(4, $fecha_actualizacion);
            $stm -> bindValue(5, $usuario_creacion);
            $stm -> bindValue(6, $usuario_actualizacion);
            $stm -> execute();

            return $stm -> fetchAll(PDO::FETCH_ASSOC);

        } catch (Exception $e) {
            return $e -> getMessage();
        }
    }

}

?>