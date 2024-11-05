class OutdoorObject {
  String? productId;

  OutdoorObject({
    this.productId,
  });

  factory OutdoorObject.fromJson(Map<String, dynamic> json) => OutdoorObject(
        productId: json["product_id"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
      };
}
