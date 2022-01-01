class AddLikeAndRemove {
  late final bool status;
  late final String message;
  late final LikeData data;
  AddLikeAndRemove({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddLikeAndRemove.fromJson(Map<String, dynamic> json) {
    return AddLikeAndRemove(
      status: json["status"],
      message: json["message"],
      data: LikeData.fromJson(json["data"]),
    );
  }
}

class LikeData {
  late final String id;
  late final String userID;
  late final String description;
  late final String image;
  late final bool isLike;

  late final String createdAt;
  late final String updatedAt;
  LikeData({
    required this.id,
    required this.userID,
    required this.description,
    required this.image,
    required this.isLike,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LikeData.fromJson(Map<String, dynamic> json) {
    return LikeData(
      id: json["_id"],
      userID: json["userID"],
      description: json["description"],
      image: json["image"],
      isLike: json["isLike"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
    );
  }
}
