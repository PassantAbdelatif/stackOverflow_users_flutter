import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:stackoverflow_users/src/features/StackOverflowUsers/model/sof_users_model.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/model/user_reputation_history_model.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/usecases/get_sof_users.dart';
import 'package:stackoverflow_users/src/features/StackOverflowUsers/usecases/get_user_reputation._details.dart';

part 'users_event.dart';
part 'users_state.dart';

class SOFUsersBloc extends Bloc<SOFUsersEvent, SOFUsersState> {
  GetSOFUsersUseCase getSOFUsersUseCase;
  GetUserReputationHistoryUseCase getUserReputationHistoryUseCase;

  SOFUsersBloc(this.getSOFUsersUseCase, this.getUserReputationHistoryUseCase)
      : super(NoUsersState()) {
    on<GetSOFUsersEvent>(_attemptGetUsers);
    on<GetUserReputationsHistoryEvent>(_attemptGetUserReputations);
  }

  Future<void> _attemptGetUsers(
      GetSOFUsersEvent event, Emitter<SOFUsersState> emit) async {
    event.currentPage == 1
        ? emit(UsersInitialLoading(message: ""))
        : emit(UsersLoadMoreLoading(message: ""));
    await getSOFUsersUseCase(event.currentPage).then((usersResponse) {
      emit(UsersStateSuccess(
          usersResponse.users ?? [], usersResponse.hasMore ?? false));
    }).onError((error, stackTrace) {
      emit(UsersStateError(errorMessage: error.toString()));
    });
  }

  Future<void> _attemptGetUserReputations(
      GetUserReputationsHistoryEvent event, Emitter<SOFUsersState> emit) async {
    emit(UsersInitialLoading(message: ""));
    await getUserReputationHistoryUseCase(event.userId, event.currentPage)
        .then((reputationsResponse) {
      emit(ReputationsStateSuccess(reputationsResponse.reputations ?? [],
          reputationsResponse.hasMore ?? false));
    }).onError((error, stackTrace) {
      emit(UsersStateError(errorMessage: error.toString()));
    });
  }

  @override
  Future<void> close() {
    // dispose
    return super.close();
  }
}
