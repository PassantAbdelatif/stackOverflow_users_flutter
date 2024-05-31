
import 'package:stackoverflow_users/src/features/StackOverflowUsers/model/user_reputation_history_model.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/repository/sof_users_repository.dart';

class GetUserReputationHistoryUseCase {
  final SOFUsersRepository _sofUsersRepository;

  GetUserReputationHistoryUseCase(this._sofUsersRepository);

  Future<UserReputationHistoryResponseModel> call(int userId, int page) async {
    return _sofUsersRepository.getUserReputaionHistory(userId, page);
  }
}
