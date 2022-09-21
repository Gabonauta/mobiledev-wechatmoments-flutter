import 'package:http/http.dart' as http;
import 'package:mobiledev_wechatmoments_flutter/config/url_constants.dart';
import 'package:mobiledev_wechatmoments_flutter/presentation/repository/repository.dart';

import 'dart:convert';

import '../models/mymodels.dart';

class TweetService implements TweetsRepository {
  @override
  Future<List> getTweets(
      {required String userName, bool forceApi = false}) async {
    if (forceApi) {
      return _getApiData(userName);
    }
    return _getLocalData(userName);
  }

  Future<List> _getLocalData(String userName) async {
    List rta = [];
    return rta;
  }

  Future<List> _getApiData(String userName) async {
    final url = UrlConstants.tweetsUrl(userName);
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      try {
        final tweets = body
            .map(
              (item) => Tweet.fromJson(item),
            )
            .toList();
        return tweets;
      } catch (e) {
        throw "Unable to retrieve tweets.";
      }
    } else {
      throw "Unable to retrieve tweets.";
    }
  }
}
