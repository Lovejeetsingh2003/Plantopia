class IndoorObject {
  String? productId;

  IndoorObject({
    this.productId,
  });

  factory IndoorObject.fromJson(Map<String, dynamic> json) => IndoorObject(
        productId: json["product_id"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
      };
}
