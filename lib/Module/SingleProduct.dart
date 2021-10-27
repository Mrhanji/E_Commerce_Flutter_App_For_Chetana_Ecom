// To parse this JSON data, do
//
//     final singleProduct = singleProductFromJson(jsonString);

import 'dart:convert';

List<SingleProduct> singleProductFromJson(String str) => List<SingleProduct>.from(json.decode(str).map((x) => SingleProduct.fromJson(x)));

String singleProductToJson(List<SingleProduct> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SingleProduct {
    SingleProduct({
        this.name,
        this.shortInfo,
        this.longInfo,
        this.mrp,
        this.salePrice,
        this.badge,
        this.saleBy,
        this.categoryId,
        this.returnDay,
        this.exchangeDay,
        this.deliveryCost,
        this.pic,
        this.id,
        this.colors,
        this.sizes,
        this.images,
    });

    String name;
    String shortInfo;
    String longInfo;
    String mrp;
    String salePrice;
    String badge;
    String saleBy;
    String categoryId;
    String returnDay;
    String exchangeDay;
    String deliveryCost;
    String pic;
    String id;
    List<Color> colors;
    List<Size> sizes;
    List<Image> images;

    factory SingleProduct.fromJson(Map<String, dynamic> json) => SingleProduct(
        name: json["name"],
        shortInfo: json["short_info"],
        longInfo: json["long_info"],
        mrp: json["mrp"],
        salePrice: json["sale_price"],
        badge: json["badge"],
        saleBy: json["sale_by"],
        categoryId: json["category_id"],
        returnDay: json["return_day"],
        exchangeDay: json["exchange_day"],
        deliveryCost: json["delivery_cost"],
        pic: json["pic"],
        id: json["id"],
        colors: List<Color>.from(json["colors"].map((x) => Color.fromJson(x))),
        sizes: List<Size>.from(json["Sizes"].map((x) => Size.fromJson(x))),
        images: List<Image>.from(json["Images"].map((x) => Image.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "short_info": shortInfo,
        "long_info": longInfo,
        "mrp": mrp,
        "sale_price": salePrice,
        "badge": badge,
        "sale_by": saleBy,
        "category_id": categoryId,
        "return_day": returnDay,
        "exchange_day": exchangeDay,
        "delivery_cost": deliveryCost,
        "pic": pic,
        "id": id,
        "colors": List<dynamic>.from(colors.map((x) => x.toJson())),
        "Sizes": List<dynamic>.from(sizes.map((x) => x.toJson())),
        "Images": List<dynamic>.from(images.map((x) => x.toJson())),
    };
}

class Color {
    Color({
        this.colorName,
        this.colorHash,
    });

    String colorName;
    String colorHash;

    factory Color.fromJson(Map<String, dynamic> json) => Color(
        colorName: json["color_name"],
        colorHash: json["color_hash"],
    );

    Map<String, dynamic> toJson() => {
        "color_name": colorName,
        "color_hash": colorHash,
    };
}

class Image {
    Image({
        this.path,
    });

    String path;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        path: json["path"],
    );

    Map<String, dynamic> toJson() => {
        "path": path,
    };
}

class Size {
    Size({
        this.size,
        this.stock,
        this.price,
    });

    String size;
    String stock;
    String price;

    factory Size.fromJson(Map<String, dynamic> json) => Size(
        size: json["size"],
        stock: json["stock"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "size": size,
        "stock": stock,
        "price": price,
    };
}
