import 'package:flutter/services.dart';
import 'package:stackoverflow_users/src/core/constants/constants.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/bloc/users_bloc.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/data/sof_users_dara_source.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/repository/sof_users_repository.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/usecases/get_sof_users.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/usecases/get_user_reputation._details.dart';

import '../../../../main.dart';

const String ordersMethodChannel = "com.okay.flutter/orders";

void setupSOFUsersDependencies() {
  getIt.registerFactory(_sofUsersBloc);
}

SOFUsersBloc _sofUsersBloc() =>
    SOFUsersBloc(_getSOFUsersUseCase(), _getUserReputationHistoryUseCase());

GetSOFUsersUseCase _getSOFUsersUseCase() =>
    GetSOFUsersUseCase(_sofUsersRepository());

GetUserReputationHistoryUseCase _getUserReputationHistoryUseCase() =>
    GetUserReputationHistoryUseCase(_sofUsersRepository());

SOFUsersRepository _sofUsersRepository() =>
    SOFUsersRepository(_sofUsersDataSource());

SOFUsersDataSource _sofUsersDataSource() =>
    SOFUsersDataSource(url: Constants.apis.baseURL);
