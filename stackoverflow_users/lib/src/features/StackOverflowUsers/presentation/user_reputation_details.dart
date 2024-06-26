import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:stackoverflow_users/gen/assets.gen.dart';
import 'package:stackoverflow_users/src/core/constants/constants.dart';
import 'package:stackoverflow_users/src/core/widgets/custom_app_bars.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/bloc/users_bloc.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/model/sof_users_model.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/model/user_reputation_history_model.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/presentation/widgets/reputation_item_widget.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/presentation/widgets/users_loading_widget.dart';
import 'package:stackoverflow_users/src/styles/app_theme.dart';
import 'package:stackoverflow_users/src/styles/colors.dart';

import '../../../../main.dart';

class UserReputationHistoryDetailsScreen extends StatefulWidget {
  final User user;

  const UserReputationHistoryDetailsScreen({Key? key, required this.user})
      : super(key: key);

  @override
  State<UserReputationHistoryDetailsScreen> createState() =>
      _UserReputationHistoryDetailsScreenState();
}

class _UserReputationHistoryDetailsScreenState
    extends State<UserReputationHistoryDetailsScreen> {
  // Props
  late AppLocalizations appLocale;
  late ScrollController controller;
  int currentPage = 1;
  late SOFUsersBloc _bloc;
  late List<ReputationHistory> allReputation = [];
  bool isNext = true;
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;

  @override
  void initState() {
    super.initState();
    controller = ScrollController()..addListener(_scrollListener);
    _bloc = getIt<SOFUsersBloc>();
    _bloc.add(GetUserReputationsHistoryEvent(
        userId: widget.user.userId ?? 0, currentPage: currentPage));
  }

  @override
  Widget build(BuildContext context) {
    appLocale = AppLocalizations.of(context)!;

    return BlocBuilder(
      buildWhen: (ctx, state) => true,
      bloc: _bloc,
      builder: (ctx, state) {
        if (state is ReputationsStateSuccess) {
          isNext = state.isNext;
          if (currentPage == 1) {
            allReputation = state.reputations;
            _isFirstLoadRunning = false;
          } else {
            allReputation.addAll(state.reputations);
            _isLoadMoreRunning = false;
          }
        } else if (state is UsersInitialLoading) {
          _isFirstLoadRunning = true;
        } else if (state is UsersLoadMoreLoading) {
          _isLoadMoreRunning = true;
        }
        return Scaffold(
          backgroundColor: OkayColors.white,
          appBar:
              CustomAppBars.getBasicTitleAppBar(context, appLocale.userDetails),
          body: _buildReputationItemsList(),
        );
      },
    );
  }

  Widget _buildReputationItemsList() {
    return Column(
      children: [
        _isFirstLoadRunning
            ? SizedBox(
                height: MediaQuery.of(context).size.height - 150,
                child: LoadingWidget(),
              )
            : (currentPage == 1 && allReputation.isEmpty)
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        Assets.images.icNoUsers.image(width: 181, height: 181),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 200,
                          child: Text(
                            maxLines: 2,
                            appLocale.noUsers,
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
                          itemCount: allReputation.length,
                          itemBuilder: (ctx, index) {
                            return Column(
                              children: [
                                UserReputationItem(
                                  reputation: allReputation[index],
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

  void _scrollListener() {
    if (controller.position.extentAfter < 300 &&
        isNext &&
        !_isLoadMoreRunning) {
      currentPage++;
      _bloc.add(
        GetUserReputationsHistoryEvent(
            userId: widget.user.userId ?? 0, currentPage: currentPage),
      );
    }
  }

  void _pullToRefresh() {
    currentPage = 1;
    _bloc.add(GetUserReputationsHistoryEvent(
        userId: widget.user.userId ?? 0, currentPage: currentPage));
  }
}
