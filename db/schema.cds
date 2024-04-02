namespace com.alfa;

entity En_Material {
    key folio_entrada : UUID;
        id_proveedor  : String(10);
        fecha_entrada : DateTime;
        no_articulos  : String(10);
        almacenista   : String(20);
}

entity Proveedor {
    key id_proveedor     : UUID;
        nombre           : String(50);
        apellido_paterno : String(25);
        apellido_materno : String(25);
        tipo_persona     : String(10);
        rfc              : String(13);
        razon_social     : String(100);
        regimen_fiscal   : String(50);
        calle            : String(30);
        colonia          : String(30);
        municipio        : String(30);
        estado           : String(30);
        no_exterior      : String(10);
        no_interior      : String(10);
        cp               : String(5);
        telefono1        : String(10);
        telefono2        : String(10);
        email            : String(50);
}

entity Det_En_Material {
    key folio_entrada : UUID;
        id_Material   : UUID;
        rollos        : DateTime;
        metros        : String(10);
        peso          : String(20);
        tipo_rollo    : String(10);
}


entity material {
    key id_Material        : UUID;
        descripcion        : String(10);
        color              : String(10);
        rollos             : String(20);
        rollos_incompletos : String(10);
        peso               : String(10);
}
