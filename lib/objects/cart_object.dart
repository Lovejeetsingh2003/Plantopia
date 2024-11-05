class CartObject {
  String? id;
  String? productId;
  int? quantity;

  CartObject({
    this.id,
    this.productId,
    this.quantity,
  });

  factory CartObject.fromJson(Map<String, dynamic> json) => CartObject(
        id: json["id"],
        productId: json["product_id"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "quantity": quantity,
      };
}
