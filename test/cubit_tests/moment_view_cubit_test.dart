//@dart=2.7

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobiledev_wechatmoments_flutter/presentation/cubit/moment_view_cubit.dart';
import 'package:mobiledev_wechatmoments_flutter/service/tweet_service.dart';
import 'package:mockito/mockito.dart';

import '../test_configs/test_data_config.dart';

void main() {
  final MomentViewCubit _momentViewCubit = MomentViewCubit();

  final MockTweetService tweetService = MockTweetService();

  blocTest(
    'test bloc states when amount due and api gives success response',
    build: () => _momentViewCubit,
    act: (MomentViewCubit cubit) {
      cubit.getUserTweets();
    },
    setUp: () async {
      when(await tweetService.getTweets(TestDataConfig.user)).thenAnswer(
        (realInvocation) => TestDataConfig.jsonTweets,
      );
      when(await _momentViewCubit.getUserTweets()).thenAnswer(
        (realInvocation) => TestDataConfig.jsonTweets,
      );
    },
    verify: (MomentViewCubit cubit) {
      final state = cubit.state as MomentViewTweetsSucccessState;
      expect(state.tweets.length, 2);
    },
    expect: () => [
      isA<MomentViewLoadingState>(),
      isA<MomentViewTweetsSucccessState>(),
    ],
  );
}

class MockTweetService extends Mock implements TweetService {}

class MockMomentViewCubit extends Mock implements MomentViewCubit {}
