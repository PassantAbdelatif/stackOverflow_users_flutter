part of 'users_bloc.dart';

abstract class SOFUsersEvent {}

class GetSOFUsersEvent extends SOFUsersEvent {
  int currentPage;

  GetSOFUsersEvent({required this.currentPage});
}

class GetUserReputationsHistoryEvent extends SOFUsersEvent {
  int userId;
  int currentPage;

  GetUserReputationsHistoryEvent(
      {required this.userId, required this.currentPage});
}
