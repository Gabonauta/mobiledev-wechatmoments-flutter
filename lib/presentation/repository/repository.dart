import 'package:mobiledev_wechatmoments_flutter/models/mymodels.dart';

abstract class TweetsRepository {
  Future<List> getTweets({required String userName, bool forceApi = false});
}

abstract class UsersRepository {
  Future<User> getUserProfile({required String userName});
}
