using {com.alfa as alfa} from '../db/schema';

// service CatalogService {
//     entity En_Material as projection on alfa.En_Material;
//     entity Det_En_Material as projection on alfa.Det_En_Material;
//     entity Proveedor as projection on alfa.Proveedor;
//     entity Material as projection on alfa.Material;
// }

define service CatalogService {

    entity En_Material     as
        select from alfa.En_Material {
            folio_entrada,
            ToProveedor.id_proveedor as id_proveedor @mandatory,
            fecha_entrada                            @mandatory,
            no_articulos                             @mandatory,
            almacenista                              @mandatory
        };

    entity Proveedor       as
        select from alfa.Proveedor {
            id_proveedor,
            nombre           @mandatory,
            apellido_paterno @mandatory,
            apellido_materno @mandatory,
            tipo_persona     @mandatory,
            rfc              @mandatory,
            razon_social     @mandatory,
            regimen_fiscal   @mandatory,
            calle            @mandatory,
            colonia          @mandatory,
            municipio        @mandatory,
            estado           @mandatory,
            no_exterior      @mandatory,
            no_interior,
            cp               @mandatory,
            telefono1        @mandatory,
            telefono2,
            email            @mandatory
        };

    entity Det_En_Material as
        select from alfa.Det_En_Material {
            folio_entrada,
            ToMaterial.id_Material as id_Material,
            rollos,
            metros,
            peso,
            tipo_rollo
        };

    entity Material        as
        select from alfa.Material {
            id_Material,
            descripcion        @mandatory,
            color              @mandatory,
            rollos             @mandatory,
            rollos_incompletos @mandatory,
            peso               @mandatory
        };
}
