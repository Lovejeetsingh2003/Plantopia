class CartObject {
  String? productId;
  int? quantity;

  CartObject({this.productId, this.quantity});

  factory CartObject.fromJson(Map<String, dynamic> json) =>
      CartObject(productId: json["product_id"], quantity: json["quantity"]);

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "quantity": quantity,
      };
}
