import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/model/sof_users_model.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/model/user_reputation_history_model.dart';
import 'package:stackoverflow_users/src/styles/app_theme.dart';
import 'package:stackoverflow_users/src/styles/colors.dart';

class ReputationTypeWidget extends StatefulWidget {
  final ReputationHistoryType reputationType;
  ReputationTypeWidget({Key? key, required this.reputationType})
      : super(key: key);
  @override
  State<ReputationTypeWidget> createState() => _ReputationTypeWidgetState();
}

class _ReputationTypeWidgetState extends State<ReputationTypeWidget> {
  late AppLocalizations appLocale;
  Color stateColor = OkayColors.deepLalic;

  @override
  void initState() {
    switch (widget.reputationType) {
      case ReputationHistoryType.POST_DOWNVOTED:
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
          color: widget.reputationType.reputationTypeColor,
          borderRadius: const BorderRadius.all(Radius.circular(4.0))),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                ReputationHistoryTypeHelper.getReputationTypeTitle(
                    widget.reputationType, appLocale),
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
