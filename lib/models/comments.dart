import 'mymodels.dart';

class Comments {
  String? content;
  User? sender;

  Comments({this.content, this.sender});

  Comments.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    sender = json['sender'] != null ? User.fromJson(json['sender']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;
    if (sender != null) {
      data['sender'] = sender!.toJson();
    }
    return data;
  }
}
