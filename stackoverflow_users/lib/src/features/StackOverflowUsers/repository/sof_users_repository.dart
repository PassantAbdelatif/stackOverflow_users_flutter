import 'package:stackoverflow_users/src/features/StackOverflowUsers/data/sof_users_dara_source.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/model/sof_users_model.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/model/user_reputation_history_model.dart';
import 'package:stackoverflow_users/src/core/constants/constants.dart';

class SOFUsersRepository {
  final SOFUsersDataSource _sofUsersDataSource;

  SOFUsersRepository(this._sofUsersDataSource);

  Future<SofUsersResponseModel> getSOFUsers(int page) async {
    return _sofUsersDataSource.getSOFUsers(page);
  }

  Future<UserReputationHistoryResponseModel> getUserReputaionHistory(
      int userId, int page) async {
    return _sofUsersDataSource.getUserReputaionHistory(userId, page);
  }
}
