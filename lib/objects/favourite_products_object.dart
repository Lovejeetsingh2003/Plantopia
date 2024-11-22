class FavouriteProductsObject {
  String? id;
  String? userId;
  String? productId;
  bool? isFavourite;

  FavouriteProductsObject({
    this.id,
    this.userId,
    this.productId,
    this.isFavourite,
  });

  factory FavouriteProductsObject.fromJson(Map<String, dynamic> json) =>
      FavouriteProductsObject(
        id: json["id"],
        userId: json["user_id"],
        productId: json["product_id"],
        isFavourite: json["is_favourite"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "product_id": productId,
        "is_favourite": isFavourite,
      };
}
