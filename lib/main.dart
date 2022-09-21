import 'package:flutter/material.dart';
import 'package:mobiledev_wechatmoments_flutter/presentation/repository/repository.dart';
import 'package:mobiledev_wechatmoments_flutter/presentation/views/moment_view_page.dart';
import 'package:mobiledev_wechatmoments_flutter/service/tweet_service.dart';
import 'package:mobiledev_wechatmoments_flutter/service/user_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TweetsRepository tweetService = TweetService();
    final UsersRepository userService = UserService();
    return const MaterialApp(
      title: 'Thoughtworks Recruiting',
      debugShowCheckedModeBanner: false,
      home: MomentViewPage(),
    );
  }
}
