import 'package:flutter/cupertino.dart';
import 'package:stackoverflow_users/src/core/constants/constants.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/presentation/user_reputation_details.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/presentation/users_list_screen.dart';

class AppRoutes {
  static const String usersListScreen = '/usersListScreen';
  static const String userReputationsScreen = '/userReputationsScreen';
}

Map<String, Widget Function(BuildContext)> okayRouter = {
  AppRoutes.usersListScreen: (ctx) => UsersListScreen(),
  AppRoutes.userReputationsScreen: (ctx) {
    final args = ModalRoute.of(ctx)!.settings.arguments as Map<String, dynamic>;

    return UserReputationHistoryDetailsScreen(
      user: args[Constants.keys.user],
    );
  },
};
