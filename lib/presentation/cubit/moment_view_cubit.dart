import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobiledev_wechatmoments_flutter/config/constants.dart';
import 'package:mobiledev_wechatmoments_flutter/models/mymodels.dart';
import 'package:mobiledev_wechatmoments_flutter/service/tweet_service.dart';
import 'package:mobiledev_wechatmoments_flutter/service/user_service.dart';

import 'moment_view_state.dart';

class MomentViewCubit extends Cubit<MomentViewState> {
  MomentViewCubit() : super(MomentViewState.onDefaultState());

  final UserService userService = UserService();

  final TweetService tweetService = TweetService();

  getUserProfile() async {
    try {
      final response = await userService.getUserProfile(Constants.userName);

      emit(MomentViewState.onSuccessState(response));
    } catch (e) {
      emit(MomentViewState.onErrorState(e.toString()));
    }
  }

  getUserTweets() async {
    try {
      final response = await tweetService.getTweets(Constants.userName);

      List<Tweet> tweetsList = [];
      tweetsList = response.cast<Tweet>();
      emit(MomentViewState.onTweetsSuccessState(tweetsList));
    } catch (e) {
      emit(MomentViewState.onErrorState(e.toString()));
    }
  }
}
