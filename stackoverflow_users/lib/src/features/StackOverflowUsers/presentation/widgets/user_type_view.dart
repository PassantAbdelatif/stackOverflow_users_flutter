import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/model/sof_users_model.dart';
import 'package:stackoverflow_users/src/styles/app_theme.dart';
import 'package:stackoverflow_users/src/styles/colors.dart';

class UserTypeWidget extends StatefulWidget {
  final UserType userType;
  UserTypeWidget({Key? key, required this.userType}) : super(key: key);
  @override
  State<UserTypeWidget> createState() => _UserTypeWidgetState();
}

class _UserTypeWidgetState extends State<UserTypeWidget> {
  late AppLocalizations appLocale;
  Color stateColor = OkayColors.deepLalic;

  @override
  void initState() {
    switch (widget.userType) {
      case UserType.MODERATOR:
        break;
      default:
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appLocale = AppLocalizations.of(context)!;

    return Container(
      decoration: BoxDecoration(
          color: widget.userType.userTypeColor,
          borderRadius: const BorderRadius.all(Radius.circular(4.0))),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(UserTypeHelper.getUserTypeTitle(widget.userType, appLocale),
                style: TextStyle(
                  fontFamily: AppTheme.appFont,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: OkayColors.white,
                ))
          ],
        ),
      ),
    );
  }
}
