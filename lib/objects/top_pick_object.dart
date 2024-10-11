class TopPickObject {
  String? id;
  String? productId;

  TopPickObject({
    this.id,
    this.productId,
  });

  factory TopPickObject.fromJson(Map<String, dynamic> json) => TopPickObject(
        id: json["id"],
        productId: json["product_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
      };
}
