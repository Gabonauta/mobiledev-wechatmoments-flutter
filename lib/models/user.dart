class User {
  String? nick;
  String? username;
  String? avatar;
  String? profile;

  User({this.nick, this.username, this.avatar, this.profile});

  User.fromJson(Map<String, dynamic> json) {
    nick = json['nick'];
    username = json['username'];
    avatar = json['avatar'];
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nick'] = nick;
    data['username'] = username;
    data['avatar'] = avatar;
    data['profile'] = profile;
    return data;
  }
}
