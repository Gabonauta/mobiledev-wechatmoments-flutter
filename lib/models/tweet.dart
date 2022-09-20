import 'package:mobiledev_wechatmoments_flutter/models/mymodels.dart';

class Tweet {
  User? sender;
  String? content;

  Tweet({
    this.content,
    this.sender,
  });

  Tweet.fromJson(Map<String, dynamic> json) {
    content = json['content'] ?? 'Dont have comment';
    sender = json["sender"] == null
        ? User(
            nick: "unknown",
            username: "",
            avatar:
                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
            profile: "")
        : User.fromJson(json["sender"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;
    return data;
  }
}
