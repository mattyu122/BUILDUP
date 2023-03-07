import 'dart:convert';

User123 user123FromJson(String str) => User123.fromJson(json.decode(str));

String user123ToJson(User123 data) => json.encode(data.toJson());

class User123 {
  User123({
    required this.id,
    required this.tags,
    required this.userName,
  });

  String id;
  String tags;
  String userName;

  factory User123.fromJson(Map<String, dynamic> json) => User123(
        id: json["id"],
        tags: json["tags"],
        userName: json["userName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tags": tags,
        "userName": userName,
      };
}
