import { get_categorias } from "./api.js";

document.addEventListener('DOMContentLoaded' , () =>{
    cargarCategorias();
});

async function cargarCategorias() {
    const categorias = await get_categorias();
    const cuerpo = document.querySelector('#tabla');

    categorias.forEach(categoria => {
        const {id_categoria , nombre , descripcion , fecha_creacion , fecha_actualizacion ,usuario_creacion , usuario_actualizacion} = categoria;
        cuerpo.innerHTML += 
        `
        <tr>
            <th scope="row">${id_categoria}</th>
            <td>${nombre}</td>
            <td>${descripcion}</td>
            <td>${fecha_creacion}</td>
            <td>${fecha_actualizacion}</td>
            <td>${usuario_creacion}</td>
            <td>${usuario_actualizacion}</td>
        </tr>
        `

    });
}

const formulario = document.querySelector('#register');
formulario.addEventListener('submit' , nuevaCategoria);

function nuevaCategoria() {
    e.preventDefault();
    const nombre = document.querySelector('#nombre');
    const descripcion = document.querySelector('#descripcion');
    const fecha_creacion = document.querySelector('#fecha_creacion');
    const fecha_actualizacion = document.querySelector('#fecha_actualizacion');
    const usuario_creacion = document.querySelector('#usuario_creacion');
    const usuario_actualizacion = document.querySelector('#usuario_actualizacion');

    const registro = {
        nombre,
        descripcion,
        fecha_creacion,
        fecha_actualizacion,
        usuario_creacion,
        usuario_actualizacion
    }

    if (validation(registro)) {
        alert('Todos los datos son obligatorios');
    }else{
        return nuevaCategoria(registro);
    }

}

function  validation(obj) {
    return !Object.values(obj).every(element=>element !== "");
}