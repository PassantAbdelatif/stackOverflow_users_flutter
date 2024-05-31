import 'package:flutter/material.dart';
import 'package:stackoverflow_users/router.dart';
import 'package:stackoverflow_users/src/styles/colors.dart';

import '../../styles/app_theme.dart';

class CustomAppBars {
  static AppBar getBasicTitleAppBar(
    BuildContext context,
    String title, {
    bool showBackButton = true,
    bool showIcon = false,
    bool showCloseIcon = false,
    bool isNavigateToDashboard = false,
    List<Widget>? actions,
  }) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: OkayColors.black,
          fontFamily: AppTheme.appFont,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
      shadowColor: Colors.transparent,
      leading: showBackButton
          ? IconButton(
              icon: Icon(showCloseIcon ? Icons.close : Icons.arrow_back,
                  color: OkayColors.black),
              onPressed: () {
                if (isNavigateToDashboard) {
                  Navigator.pushNamed(context, AppRoutes.usersListScreen);
                } else {
                  Navigator.of(context).pop();
                }
              },
            )
          : null,
      actions: actions,
    );
  }
}
