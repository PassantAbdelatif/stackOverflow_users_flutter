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

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({super.key});

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  late AppLocalizations appLocale;
  late ScrollController controller;
  late SOFUsersBloc _bloc;
  int currentPage = 1;
  late List<User> allUsers = [];
  bool isNext = true;
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;
  List<String> bookamrkedIds = [];

  @override
  void initState() {
    super.initState();
    getBookamrkedList();
    controller = ScrollController()..addListener(_scrollListener);
    _bloc = getIt<SOFUsersBloc>();
    _bloc.add(GetSOFUsersEvent(currentPage: currentPage));
  }

  Future<Null> getBookamrkedList() async {
    bookamrkedIds = await SharedPrefs.getBookmaredList();
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
        if (state is UsersStateSuccess) {
          isNext = state.isNext;
          if (currentPage == 1) {
            allUsers = state.users;
            _isFirstLoadRunning = false;
          } else {
            allUsers.addAll(state.users);
            _isLoadMoreRunning = false;
          }
        } else if (state is UsersInitialLoading) {
          _isFirstLoadRunning = true;
        } else if (state is UsersLoadMoreLoading) {
          _isLoadMoreRunning = true;
        }
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
                child: LoadingWidget(),
              )
            : (currentPage == 1 && allUsers.isEmpty)
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
                            "",
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
                          itemCount: allUsers.length,
                          itemBuilder: (ctx, index) {
                            return Column(
                              children: [
                                UserItem(
                                  user: allUsers[index],
                                  isBookmarked: bookamrkedIds.contains(
                                      "${allUsers[index].userId ?? 0}"),
                                  onUserItemClicked: (userId) {
                                    Navigator.pushNamed(context,
                                        AppRoutes.userReputationsScreen,
                                        arguments: {
                                          Constants.keys.user: allUsers[index],
                                        });
                                  },
                                  onbookmarkButtonClicked: (userId) async {
                                 
                                    setState(() {
                                      if (bookamrkedIds.contains("$userId")) {
                                        bookamrkedIds.remove('$userId');
                                      } else {
                                        bookamrkedIds.add('$userId');
                                      }
                                    });
                                    SharedPrefs.saveBookmaredList(bookamrkedIds);
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
        if (_isLoadMoreRunning)
          const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 40),
              child: SpinKitCircle(
                color: OkayColors.okayPurple,
                size: 50.0,
              )),
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
                  icon: Assets.images.icBookmarkList.image(),
                  iconSize: 20,
                  onPressed: () {
                    // Navigator.pop(context);
                  },
                ),
                Text(appLocale.sofUsers,
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

  void _scrollListener() {
    if (controller.position.extentAfter < 300 &&
        isNext &&
        !_isLoadMoreRunning) {
      currentPage++;
      _bloc.add(
        GetSOFUsersEvent(currentPage: currentPage),
      );
    }
  }

  void _pullToRefresh() {
    currentPage = 1;
    _bloc.add(GetSOFUsersEvent(currentPage: currentPage));
  }
}
