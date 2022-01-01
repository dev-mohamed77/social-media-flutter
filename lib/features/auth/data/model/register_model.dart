class RegisterModel {
  bool? status;
  String? message;
  Data? data;

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] != null ? Data.from(json["data"]) : null;
  }
}

class Data {
  String? id;
  String? username;
  String? email;
  String? phone;
  String? fullName;
  String? pio;
  String? image;
  String? coverImage;
  String? country;
  String? city;
  bool? isAdmin;
  List? followers;
  List? following;
  int? relationShip;
  String? createdAt;
  String? updatedAt;

  Data.from(Map<String, dynamic> json) {
    id = json["_id"];
    username = json["username"];
    email = json["email"];
    phone = json["phone"];
    fullName = json["fullName"];
    pio = json["pio"];
    image = json["image"];
    coverImage = json["coverImage"];
    country = json["country"];
    city = json["city"];
    isAdmin = json["isAdmin"];
    followers = json["followers"];
    following = json["following"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
  }
}
