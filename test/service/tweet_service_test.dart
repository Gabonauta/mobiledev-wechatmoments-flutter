// @dart=2.7
import 'package:flutter_test/flutter_test.dart';
import 'package:mobiledev_wechatmoments_flutter/service/tweet_service.dart';
import 'package:mobiledev_wechatmoments_flutter/service/user_service.dart';
import 'package:mockito/mockito.dart';

import '../test_configs/test_data_config.dart';

void main() {
  final MockTweetService tweetService = MockTweetService();
  test('Verify tweets service returns proper data', () async {
    when(tweetService.getTweets(TestDataConfig.user))
        .thenAnswer((realInvocation) async {
      return TestDataConfig.jsonTweets;
    });
    final response = await tweetService.getTweets(TestDataConfig.user);

    expect(response[0]["content"], 'Good.');
    expect(response[0]["sender"][0]["nick"], 'Super hero');
  });

  test('Verify tweets service returns proper data', () async {
    when(tweetService.getTweets(TestDataConfig.user))
        .thenAnswer((realInvocation) async {
      return TestDataConfig.jsonTweets;
    });
    final response = await tweetService.getTweets(TestDataConfig.user);

    expect(TestDataConfig.user, 'jsmith');
    expect(response.length, 1);
  });
}

class MockTweetService extends Mock implements TweetService {}

class MockUserService extends Mock implements UserService {}
