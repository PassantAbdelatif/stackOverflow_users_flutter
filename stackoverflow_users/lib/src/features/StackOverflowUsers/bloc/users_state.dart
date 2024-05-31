part of 'users_bloc.dart';

abstract class SOFUsersState {
  const SOFUsersState();
}

class HistoryInitial extends SOFUsersState {}

//State for initial Loading when current page will be 1
class UsersInitialLoading extends SOFUsersState {
  final String message;
  UsersInitialLoading({required this.message});
}

//State for load more Loading when current page will be > 1
class UsersLoadMoreLoading extends SOFUsersState {
  final String message;
  UsersLoadMoreLoading({required this.message});
}

class NoUsersState extends SOFUsersState {}

class UsersStateSuccess extends SOFUsersState {
  final List<User> users;
  bool isNext;

  UsersStateSuccess(this.users, this.isNext);
}

class ReputationsStateSuccess extends SOFUsersState {
  final List<ReputationHistory> reputations;
  bool isNext;

  ReputationsStateSuccess(this.reputations, this.isNext);
}

class UsersStateError extends SOFUsersState {
  final String errorMessage;
  UsersStateError({required this.errorMessage});
}
