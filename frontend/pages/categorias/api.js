const urlCategorias = "http://localhost/SkylAb-136/practicaPrueba/backend/controller.php?op=GetAll";
const urlNewCategoria= "http://localhost/SkylAb-136/practicaPrueba/backend/controller.php?op=insert";

export const get_categorias = async () => {
    try {
        const categorias = await fetch (urlCategorias);
        const data = await categorias.json();
        return data;
    } catch (error) {
        console.log(error);
    }
}

export const insert_cartegorias = async (registrar) => {
    try {
        await fetch (urlNewCategoria , {
            method: "POST",
            body: JSON.stringify(registrar),
            headers:{
                'Content-Type' : 'application/json'
            }
        })
    } catch (error) {
        console.log(error);
    }
}