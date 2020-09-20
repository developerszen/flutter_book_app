import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));
String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
    int id;
    String name;
    String created_at;
    String updated_at;

    CategoryModel({
        this.id,
        this.name,
        this.created_at,
        this.updated_at,
    });

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id          : json['id'],
        name        : json['name'],
        created_at  : json['created_at'],
        updated_at  : json['updated_at']
    );

    Map<String, dynamic> toJson() => {
        'id'            : id,
        'name'          : name,
        'created_at'    : created_at,
        'updated_at'    : updated_at
    };
}