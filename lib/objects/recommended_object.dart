class RecommendedObject {
  String? id;
  String? productId;

  RecommendedObject({
    this.id,
    this.productId,
  });

  factory RecommendedObject.fromJson(Map<String, dynamic> json) =>
      RecommendedObject(
        id: json["id"],
        productId: json["product_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
      };
}
