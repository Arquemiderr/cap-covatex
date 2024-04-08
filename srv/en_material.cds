using com.alfa as alfa from '../db/schema';

service En_Material{
    entity GetEnMaterial as projection on alfa.En_Material;
    entity CreateMaterial as projection on alfa.En_Material;
}