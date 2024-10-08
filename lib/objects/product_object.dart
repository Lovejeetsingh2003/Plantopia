class ProductObject {
  String? id;
  String? productFirstName;
  String? productLastName;
  String? productPic;
  String? productDesc;
  int? productPrice;
  String? productType;
  int? isInstock;

  ProductObject({
    this.id,
    this.productFirstName,
    this.productLastName,
    this.productPic,
    this.productDesc,
    this.productPrice,
    this.productType,
    this.isInstock,
  });

  factory ProductObject.fromJson(Map<String, dynamic> json) => ProductObject(
        id: json["_id"],
        productFirstName: json["product_first_name"],
        productLastName: json["product_last_name"],
        productPic: json["product_pic"],
        productDesc: json["product_desc"],
        productPrice: json["product_price"],
        productType: json["product_type"],
        isInstock: json["is_instock"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "product_first_name": productFirstName,
        "product_last_name": productLastName,
        "product_pic": productPic,
        "product_desc": productDesc,
        "product_price": productPrice,
        "product_type": productType,
        "is_instock": isInstock,
      };

  @override
  String toString() {
    return 'ProductObject( id : $id, $productFirstName,$productLastName, productDesc: $productDesc, productPrice: $productPrice, productPic: $productPic, productType: $productType, isInstock: $isInstock)';
  }
}
