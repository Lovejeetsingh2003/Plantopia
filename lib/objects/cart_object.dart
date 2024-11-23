class CartObject {
  String? id;
  String? userId;
  String? productId;
  double? price;
  int? quantity;

  CartObject({
    this.id,
    this.price,
    this.userId,
    this.productId,
    this.quantity,
  });

  factory CartObject.fromJson(Map<String, dynamic> json) => CartObject(
        id: json["id"],
        price: json["price"],
        userId: json["user_id"],
        productId: json["product_id"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "price": price,
        "product_id": productId,
        "quantity": quantity,
      };
}
