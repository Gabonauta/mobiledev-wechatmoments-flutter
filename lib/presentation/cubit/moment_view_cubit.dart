import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobiledev_wechatmoments_flutter/config/constants.dart';
import 'package:mobiledev_wechatmoments_flutter/models/mymodels.dart';

import '../repository/repository.dart';
import 'moment_view_state.dart';

class MomentViewCubit extends Cubit<MomentViewState> {
  MomentViewCubit({required this.userService, required this.tweetService})
      : super(MomentViewState.onDefaultState());
  final UsersRepository userService;
  final TweetsRepository tweetService;
  getUserProfile() async {
    try {
      final response =
          await userService.getUserProfile(userName: Constants.userName);

      emit(MomentViewState.onSuccessState(response));
    } catch (e) {
      emit(MomentViewState.onErrorState(e.toString()));
    }
  }

  getUserTweets() async {
    try {
      final response = await tweetService.getTweets(
          userName: Constants.userName, forceApi: true);

      List<Tweet> tweetsList = [];
      tweetsList = response.cast<Tweet>();
      emit(MomentViewState.onTweetsSuccessState(tweetsList));
    } catch (e) {
      emit(MomentViewState.onErrorState(e.toString()));
    }
  }
}
