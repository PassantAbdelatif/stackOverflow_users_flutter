import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stackoverflow_users/gen/assets.gen.dart';
import 'package:stackoverflow_users/src/core/providers/shared_preferences_provider.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/model/sof_users_model.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/presentation/widgets/user_type_view.dart';
import 'package:stackoverflow_users/src/styles/app_theme.dart';
import 'package:stackoverflow_users/src/styles/colors.dart';

class UserItem extends StatefulWidget {
  final User user;
  bool isBookmarked;

  final Function(int? userId) onUserItemClicked;
  final Function(int? userId) onbookmarkButtonClicked;

  UserItem(
      {Key? key,
      required this.user,
      required this.isBookmarked,
      required this.onUserItemClicked,
      required this.onbookmarkButtonClicked})
      : super(key: key);

  @override
  State<UserItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  // Props
  late AppLocalizations appLocale;
  bool isBookmarked = false;

  Future<Null> checkIfUserIdBookmarked() async {
    isBookmarked =
        await SharedPrefs.checkIfUserIdBookmarked(widget.user.userId ?? 0);
  }

  @override
  void initState() {
    super.initState();
    checkIfUserIdBookmarked();
  }

  @override
  Widget build(BuildContext context) {
    appLocale = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: () {
        widget.onUserItemClicked(widget.user.userId);
      },
      child: Padding(
        padding:
            const EdgeInsets.only(left: 16.0, right: 16, bottom: 8, top: 10),
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
                const SizedBox(height: 20),
                _buildUserDetailsSection(),
                const Divider(
                  thickness: 1,
                ),
                _buildAddressDataWidget(),
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(height: 20),
              ],
            )),
      ),
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
              Text("${appLocale.reputation} ${widget.user.reputation ?? 0}",
                  style: TextStyle(
                    fontFamily: AppTheme.appFont,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  )),
              IconButton(
                icon: !widget.isBookmarked
                    ? Assets.images.icUnbookmarked.image()
                    : Assets.images.icBookmarked.image(),
                iconSize: 10,
                onPressed: () {
                  widget.onbookmarkButtonClicked(widget.user.userId);
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 110,
                  height: 34,
                  child: UserTypeWidget(
                    userType: widget.user.userType ?? UserType.REGISTERED,
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Padding _buildUserDetailsSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, right: 7),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      (widget.user.profileImage != null
                          ? Image.network(
                              widget.user.profileImage ?? "",
                              width: 50,
                              height: 50,
                            )
                          : Assets.images.defaultProfileImageBigSize
                              .image(width: 50, height: 50)),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 150,
                            child: Text(
                                maxLines: 2,
                                widget.user.displayName ?? "",
                                style: TextStyle(
                                  fontFamily: AppTheme.appFont,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: OkayColors.black,
                                )),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(appLocale.age,
                      style: TextStyle(
                        fontFamily: AppTheme.appFont,
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: OkayColors.okayPurple,
                      )),
                ],
              )
            ],
          ),
          const SizedBox(height: 10),
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
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Assets.images.icMarker.image(),
                      const SizedBox(width: 15),
                      SizedBox(
                        width: 200,
                        child: Text(
                          maxLines: 2,
                          widget.user.location ?? "",
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
