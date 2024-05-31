import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stackoverflow_users/gen/assets.gen.dart';
import 'package:stackoverflow_users/src/core/utils/extensions/string_extension.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/model/user_reputation_history_model.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/presentation/widgets/reputation_type_view.dart';
import 'package:stackoverflow_users/src/styles/app_theme.dart';
import 'package:stackoverflow_users/src/styles/colors.dart';

class UserReputationItem extends StatefulWidget {
  final ReputationHistory reputation;

  UserReputationItem({Key? key, required this.reputation}) : super(key: key);

  @override
  State<UserReputationItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserReputationItem> {
  // Props
  late AppLocalizations appLocale;

  @override
  Widget build(BuildContext context) {
    appLocale = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 8, top: 10),
      child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: OkayColors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              _buildFirstSection(),
              const Divider(
                thickness: 1,
              ),
              SizedBox(height: 10),
              Text("${appLocale.postId} ${widget.reputation.postId ?? 0}",
                  style: TextStyle(
                    fontFamily: AppTheme.appFont,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  )),
              const Divider(
                thickness: 1,
              ),
              _buildAddressDataWidget(),
              const Divider(
                thickness: 1,
              ),
              SizedBox(height: 20),
            ],
          )),
    );
  }

  Padding _buildFirstSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "${appLocale.reputationChange} ${widget.reputation.reputationChange ?? 0}",
                  style: TextStyle(
                    fontFamily: AppTheme.appFont,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  )),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  height: 34,
                  child: ReputationTypeWidget(
                    reputationType: widget.reputation.reputationHistoryType ??
                        ReputationHistoryType.POST_DOWNVOTED,
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAddressDataWidget() {
    return Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  Image.asset(
                    Assets.images.icDottedLine.keyName,
                    height: 23,
                    width: 24,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 300,
                        child: Text(
                          maxLines: 2,
                          (widget.reputation.creationDate ?? 0).readTimestamp(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: OkayColors.lightGrayTextColor,
                              fontSize: 14,
                              fontFamily: AppTheme.appFont,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ]));
  }
}
