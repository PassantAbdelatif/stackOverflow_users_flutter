import 'dart:convert';

import 'package:stackoverflow_users/src/data/base_data_source.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/model/sof_users_model.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/model/user_reputation_history_model.dart';
import 'package:stackoverflow_users/src/core/constants/constants.dart';

class SOFUsersDataSource extends BaseDataSourceImpl {
  SOFUsersDataSource({required super.url});

  Future<SofUsersResponseModel> getSOFUsers(int page) async {
    final allUsers = await getCallRequest(
        '${Constants.apis.sofUsersRequest}?${Constants.keys.page}=$page&${Constants.keys.page}=${Constants.constants.pageSize}&${Constants.keys.site}=${Constants.keys.stackoverflow}');

    return SofUsersResponseModel.fromJson(allUsers);
  }

  Future<UserReputationHistoryResponseModel> getUserReputaionHistory(
      int userId, int page) async {
    final userReputations = await getCallRequest(
        '${Constants.apis.sofUsersRequest}/$userId/${Constants.apis.reputationHistoryRequest}?${Constants.keys.page}=$page&${Constants.keys.page}=${Constants.constants.pageSize}&${Constants.keys.site}=${Constants.keys.stackoverflow}');

    return UserReputationHistoryResponseModel.fromJson(userReputations);
  }
}
