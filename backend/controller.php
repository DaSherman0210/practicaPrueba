<?php 

ini_set("display_errors" , 1);
ini_set("dispaly_startup_errors" , 1);

error_reporting(E_ALL);

header('Content-Type:application/json');

require_once "Conectar.php";
require_once "Models.php";

$categorias = new Categorias();
$body = json_decode(file_get_contents("php://input") , true); 

switch ($_GET["op"]) {
    case 'GetAll':
        $data = $categorias -> get_categorias();
        echo json_encode($data);
        break;
    case 'insert':
        $data = $categorias -> insert_categoria(
            $body['nombre'],
            $body['descripcion'],
            $body['fecha_creacion'],
            $body['fecha_actualizacion'],
            $body['usuario_creacion'],
            $body['usuario_actualizacion']);
            echo json_encode('Los datos se ingresaron correctamente');
        break;
}

?>