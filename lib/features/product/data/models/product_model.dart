import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
    int user;
    String name;
    int price;
    String description;
    int stock;
    String chara;
    String game;
    String category;
    String image;

    ProductModel({
        required this.user,
        required this.name,
        required this.price,
        required this.description,
        required this.stock,
        required this.chara,
        required this.game,
        required this.category,
        required this.image,
    });

    ProductModel copyWith({
        int? user,
        String? name,
        int? price,
        String? description,
        int? stock,
        String? chara,
        String? game,
        String? category,
        String? image,
    }) => 
        ProductModel(
            user: user ?? this.user,
            name: name ?? this.name,
            price: price ?? this.price,
            description: description ?? this.description,
            stock: stock ?? this.stock,
            chara: chara ?? this.chara,
            game: game ?? this.game,
            category: category ?? this.category,
            image: image ?? this.image,
        );

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        user: json["user"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        stock: json["stock"],
        chara: json["chara"],
        game: json["game"],
        category: json["category"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "price": price,
        "description": description,
        "stock": stock,
        "chara": chara,
        "game": game,
        "category": category,
        "image": image,
    };
}
