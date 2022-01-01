class StoriesModel {
  StoriesModel({
    required this.status,
    required this.data,
  });
  late final bool status;
  late final List<Story> data;

  StoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data =
        List.from(json['data']).map((story) => Story.fromJson(story)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data.map((story) => Story.toJson(story)).toList();
    return _data;
  }
}

class Story {
  Story({
    required this.id,
    required this.userID,
    required this.image,
    required this.text,
    required this.createdAt,
    required this.updatedAt,
    required this.viewers,
  });
  late final String id;
  User? userID;
  late final String? image;
  late final String text;
  late final String createdAt;
  late final String updatedAt;

  List<User>? viewers;

  Story.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    userID = User.fromJson(json['userID']);
    image = json['image'];
    text = json['text'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];

    viewers =
        List.from(json['viewers']).map((user) => User.fromJson(user)).toList();
  }

  static Map<String, dynamic> toJson(Story story) {
    return {
      "_id": story.id,
      "userID": story.userID,
      "image": story.image,
      "text": story.text,
      "viewers": story.viewers,
      "createdAt": story.createdAt,
      "updatedAt": story.updatedAt,
    };
  }
}

class User {
  User({
    required this.id,
    required this.username,
    required this.fullName,
    required this.image,
  });
  late final String id;
  late final String username;
  late final String fullName;
  late final String image;

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    username = json['username'];
    fullName = json['fullName'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['username'] = username;
    _data['fullName'] = fullName;
    _data['image'] = image;
    return _data;
  }
}
















// class StoriesModel {
//   bool? status;
//   List<Story>? data;
//   StoriesModel({
//     required this.status,
//     required this.data,
//   });

//   factory StoriesModel.fromJson(Map<String, dynamic> json) {
//     return StoriesModel(
//       status: json["status"],
//       data: List.from(json["data"])
//           .map((story) => Story.fromJson(json["data"]))
//           .toList(),
//     );
//   }
// }

// class Story {
//   String? id;
//   User? userID;
//   String? image;
//   String? text;
//   List<User>? viewers;
//   String? createdAt;
//   String? updatedAt;

//   Story({
//     required this.id,
//     required this.userID,
//     required this.image,
//     required this.text,
//     required this.viewers,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory Story.fromJson(Map<String, dynamic> json) {
//     return Story(
//       id: json["_id"],
//       userID: json["userID"] != null ? User.fromJsom(json["userID"]) : null,
//       image: json["image"],
//       text: json["text"],
//       viewers: List.from(json["viewers"])
//           .map((user) => User.fromJsom(user))
//           .toList(),
//       createdAt: json["createdAt"],
//       updatedAt: json["updatedAt"],
//     );
//   }

  // static Map<String, dynamic> toJson(Story story) {
  //   return {
  //     "_id": story.id,
  //     "userID": story.userID,
  //     "image": story.image,
  //     "text": story.text,
  //     "viewers": story.viewers,
  //     "createdAt": story.createdAt,
  //     "updatedAt": story.updatedAt,
  //   };
  // }
// }

// class User {
//   String? id;
//   String? username;
//   String? fullName;
//   String? image;
//   User({
//     required this.id,
//     required this.username,
//     required this.fullName,
//     required this.image,
//   });

//   factory User.fromJsom(Map<String, dynamic> json) {
//     return User(
//       id: json["_id"],
//       username: json["username"],
//       fullName: json["fullName"],
//       image: json["image"],
//     );
//   }
// }
