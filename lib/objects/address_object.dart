class AddressObject {
  String? id;
  String? username;
  String? phoneNo;
  String? alternatePhoneNo;
  String? pincode;
  String? state;
  String? city;
  String? houseNo;
  String? area;
  String? nearbyLandmark;
  String? addressType;

  AddressObject({
    this.id,
    this.username,
    this.phoneNo,
    this.alternatePhoneNo,
    this.pincode,
    this.state,
    this.city,
    this.houseNo,
    this.area,
    this.nearbyLandmark,
    this.addressType,
  });

  factory AddressObject.fromJson(Map<String, dynamic> json) => AddressObject(
        id: json["id"],
        username: json["username"],
        phoneNo: json["phone_no"],
        alternatePhoneNo: json["alternate_phone_no"],
        pincode: json["pincode"],
        state: json["state"],
        city: json["city"],
        houseNo: json["house_no"],
        area: json["area"],
        nearbyLandmark: json["nearby_landmark"],
        addressType: json["address_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "phone_no": phoneNo,
        "alternate_phone_no": alternatePhoneNo,
        "pincode": pincode,
        "state": state,
        "city": city,
        "house_no": houseNo,
        "area": area,
        "nearby_landmark": nearbyLandmark,
        "address_type": addressType,
      };
}
