import 'package:stackoverflow_users/src/features/StackOverflowUsers/model/sof_users_model.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/repository/sof_users_repository.dart';

class GetSOFUsersUseCase {
  final SOFUsersRepository _sofUsersRepository;

  GetSOFUsersUseCase(this._sofUsersRepository);

  Future<SofUsersResponseModel> call(int page) async {
    return _sofUsersRepository.getSOFUsers(page);
  }
}
