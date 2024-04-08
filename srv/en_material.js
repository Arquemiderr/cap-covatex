const cds = require("@sap/cds");
const { rejects } = require("assert");
const { resolve } = require("path");
const { En_Material } = cds.entities("com.alfa");

module.exports = (srv) => {
    //**********READ***********/
    srv.on("READ", "EnMaterial", async (req) => {
        return await SELECT.from(En_Material);
    });

    //**********CREATE***********/
    srv.on("CREATE", "EnMaterial", async (req) => {

        let returnData = await cds
            .transaction(req)
            .run(
                INSERT.into(En_Material).entries({
                    folio_entrada: req.data.folio_entrada,
                    id_proveedor: req.data.id_proveedor,
                    fecha_entrada: req.data.fecha_entrada,
                    no_articulos: req.data.no_articulos,
                    almacenista: req.data.almacenista,
                })
            ).then((resolve, reject) => {
                console.log("Resolve", resolve);
                console.log("Reject", reject);

                if (typeof resolve !== "undefined") {
                    return req.data;
                } else {
                    req.error(409, "Record Not Inserted");
                }
            })
            .catch((err) => {
                console.log(err);
                req.error(err.code, err.message);
            });
        console.log("Before End", returnData);
        return returnData;
    });

    //**********UPDATE***********/
    srv.on("UPDATE", "EnMaterial", async (req) => {
        let returnData = await cds.transaction(req).run(
            [
                UPDATE(En_Material, req.data.folio_entrada).set({
                    fecha_entrada: req.data.fecha_entrada,
                    almacenista: req.data.almacenista
                })
            ]
        ).then((resolve, reject) => {
            console.log("Resolve: ", resolve);
            console.log("Reject: ", reject);
            if (resolve[0] == 0) {
                req.error(409, "Record Not Found");
            }
        }).catch((err) => {
            console.log(err);
            req.error(err.code, err.message)
        });
        console.log("Before End", returnData);
        return returnData;
    });

    //**********DELETE***********/
    srv.on("DELETE", "EnMaterial",async (req) => {
       let returnData =  await cds.transaction(req).run(
            DELETE.from(En_Material).where({
                folio_entrada: req.data.folio_entrada
            })
        ).then((resolve, reject) => {
            console.log("Resolve: ", resolve);
            console.log("Reject", reject);

            if (resolve !== 1) {
                req.error(409, "Record Not Found");
            }
        })
            .catch((err)=>{
                console.log(err);
                req.error(err.code, err.message);
            });
            console.log("Before End", returnData);
            return await returnData;
    });
};