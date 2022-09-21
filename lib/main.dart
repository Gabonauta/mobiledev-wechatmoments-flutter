import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobiledev_wechatmoments_flutter/presentation/cubit/moment_view_cubit.dart';
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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => tweetService),
        RepositoryProvider(create: (_) => userService)
      ],
      child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => MomentViewCubit(
                tweetService: tweetService,
                userService: userService,
              ),
            )
          ],
          child: const MaterialApp(
            title: 'Thoughtworks Recruiting',
            debugShowCheckedModeBanner: false,
            home: MomentViewPage(),
          )),
    );
  }
}
