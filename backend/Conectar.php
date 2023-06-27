<?php 

class Conectar {
    protected $dbCnx;

    protected function conexion(){
        try {
            $stm = $this -> dbCnx = new PDO("mysql:local=localhost;dbname=pruebaAlquiler" , "campus" , "campus2023");
            return $stm;
        } catch (Exception $e) {
            return $e -> getMessage();
        }
    }

    public function set_name(){
        return $this-> dbCnx -> query("SET NAMES 'utf8'");
    }
}

?>