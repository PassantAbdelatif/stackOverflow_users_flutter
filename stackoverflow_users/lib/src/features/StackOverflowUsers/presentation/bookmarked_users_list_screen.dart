import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackoverflow_users/gen/assets.gen.dart';
import 'package:stackoverflow_users/main.dart';
import 'package:stackoverflow_users/router.dart';
import 'package:stackoverflow_users/src/core/constants/constants.dart';
import 'package:stackoverflow_users/src/core/providers/shared_preferences_provider.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/bloc/users_bloc.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/model/sof_users_model.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/presentation/widgets/user_item_widget.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/presentation/widgets/users_loading_widget.dart';
import 'package:stackoverflow_users/src/styles/app_theme.dart';
import 'package:stackoverflow_users/src/styles/colors.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookmarkedUsersListScreen extends StatefulWidget {
  List<User> bookmarkedUsersList;
  BookmarkedUsersListScreen({Key? key, required this.bookmarkedUsersList})
      : super(key: key);

  @override
  State<BookmarkedUsersListScreen> createState() =>
      _BookmarkedUsersListScreenState();
}

class _BookmarkedUsersListScreenState extends State<BookmarkedUsersListScreen> {
  late AppLocalizations appLocale;
  late ScrollController controller;
  late SOFUsersBloc _bloc;

  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;
  List<String> bookamrkedIds = [];

  @override
  void initState() {
    super.initState();
    getBookamrkedList();
    controller = ScrollController()..addListener(_scrollListener);
    _bloc = getIt<SOFUsersBloc>();
  }

  getBookamrkedList() {
    bookamrkedIds = widget.bookmarkedUsersList
        .map((user) => '${user.userId ?? 0}')
        .toList();

  }

  @override
  void dispose() {
    super.dispose();
    controller.removeListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    // Props
    appLocale = AppLocalizations.of(context)!;
    return BlocBuilder(
      buildWhen: (ctx, state) => true,
      bloc: _bloc,
      builder: (ctx, state) {
        return Scaffold(
            backgroundColor: OkayColors.white, body: _buildItemsList());
      },
    );
  }

  Widget _buildItemsList() {
    return Column(
      children: [
        _buildHeaderContainer(context),
        _isFirstLoadRunning
            ? SizedBox(
                height: MediaQuery.of(context).size.height - 150,
                child: const LoadingWidget(),
              )
            : (widget.bookmarkedUsersList.isEmpty)
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        Assets.images.icNoUsers.image(width: 180, height: 180),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 200,
                          child: Text(
                            maxLines: 2,
                            appLocale.noBookmarkedUsers,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: OkayColors.greyishBlack,
                              fontFamily: AppTheme.appFont,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Expanded(
                    child: LimitedBox(
                      child: LiquidPullToRefresh(
                        color: OkayColors.lightTeal,
                        showChildOpacityTransition: false,
                        onRefresh: () {
                          return Future.delayed(const Duration(seconds: 1), () {
                            _pullToRefresh();
                          });
                        },
                        child: ListView.builder(
                          controller: controller,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const ScrollPhysics(),
                          itemCount: widget.bookmarkedUsersList.length,
                          itemBuilder: (ctx, index) {
                            return Column(
                              children: [
                                UserItem(
                                  user: widget.bookmarkedUsersList[index],
                                  isBookmarked: bookamrkedIds.contains(
                                      "${widget.bookmarkedUsersList[index].userId ?? 0}"),
                                  onUserItemClicked: (userId) {
                                    Navigator.pushNamed(context,
                                        AppRoutes.userReputationsScreen,
                                        arguments: {
                                          Constants.keys.user:
                                              widget.bookmarkedUsersList[index],
                                        });
                                  },
                                  onbookmarkButtonClicked: (userId) async {
                                    setState(() {
                                      if (bookamrkedIds.contains("$userId")) {
                                        bookamrkedIds.remove('$userId');
                                        widget.bookmarkedUsersList.remove(
                                            widget.bookmarkedUsersList[index]);
                                      } else {
                                        bookamrkedIds.add('$userId');
                                        widget.bookmarkedUsersList.add(
                                            widget.bookmarkedUsersList[index]);
                                      }
                                    });
                                    SharedPrefs.saveBookmaredList(
                                        bookamrkedIds);
                                  },
                                ),
                                const SizedBox(height: 10),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
      ],
    );
  }

  // Private Widgets
  Container _buildHeaderContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 139,
      decoration: BoxDecoration(
        color: OkayColors.white,
        boxShadow: [
          BoxShadow(
            color: OkayColors.black.withOpacity(0.12), // Shadow color
            spreadRadius: 0, // Spread radius
            blurRadius: 12, // Blur radius
            offset: const Offset(0, 20), // Offset in the x and y directions
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 60, left: 24.0, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Assets.images.icClose.image(),
                  iconSize: 20,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(appLocale.bookmarkedUsers,
                    style: TextStyle(
                      fontFamily: AppTheme.appFont,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: OkayColors.black,
                    )),
                const SizedBox(
                  width: 30,
                  height: 30,
                )
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _scrollListener() {}

  void _pullToRefresh() {}
}
