import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stackoverflow_users/src/styles/colors.dart';

part "sof_users_model.g.dart";

@JsonSerializable()
class SofUsersResponseModel {
  @JsonKey(name: "items")
  List<User>? users;
  @JsonKey(name: "has_more")
  bool? hasMore;
  @JsonKey(name: "quota_max")
  int? quotaMax;
  @JsonKey(name: "quota_remaining")
  int? quotaRemaining;

  SofUsersResponseModel({
    this.users,
    this.hasMore,
    this.quotaMax,
    this.quotaRemaining,
  });

  factory SofUsersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SofUsersResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SofUsersResponseModelToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "badge_counts")
  BadgeCounts? badgeCounts;
  @JsonKey(name: "account_id")
  int? accountId;
  @JsonKey(name: "is_employee")
  bool? isEmployee;
  @JsonKey(name: "last_modified_date")
  int? lastModifiedDate;
  @JsonKey(name: "last_access_date")
  int? lastAccessDate;
  @JsonKey(name: "reputation_change_year")
  int? reputationChangeYear;
  @JsonKey(name: "reputation_change_quarter")
  int? reputationChangeQuarter;
  @JsonKey(name: "reputation_change_month")
  int? reputationChangeMonth;
  @JsonKey(name: "reputation_change_week")
  int? reputationChangeWeek;
  @JsonKey(name: "reputation_change_day")
  int? reputationChangeDay;
  @JsonKey(name: "reputation")
  int? reputation;
  @JsonKey(name: "creation_date")
  int? creationDate;
  @JsonKey(name: "user_type")
  UserType? userType;
  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "accept_rate")
  int? acceptRate;
  @JsonKey(name: "location")
  String? location;
  @JsonKey(name: "website_url")
  String? websiteUrl;
  @JsonKey(name: "link")
  String? link;
  @JsonKey(name: "profile_image")
  String? profileImage;
  @JsonKey(name: "display_name")
  String? displayName;
  bool isBookmarked = false;

  User({
    this.badgeCounts,
    this.accountId,
    this.isEmployee,
    this.lastModifiedDate,
    this.lastAccessDate,
    this.reputationChangeYear,
    this.reputationChangeQuarter,
    this.reputationChangeMonth,
    this.reputationChangeWeek,
    this.reputationChangeDay,
    this.reputation,
    this.creationDate,
    this.userType,
    this.userId,
    this.acceptRate,
    this.location,
    this.websiteUrl,
    this.link,
    this.profileImage,
    this.displayName,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class BadgeCounts {
  @JsonKey(name: "bronze")
  int? bronze;
  @JsonKey(name: "silver")
  int? silver;
  @JsonKey(name: "gold")
  int? gold;

  BadgeCounts({
    this.bronze,
    this.silver,
    this.gold,
  });

  factory BadgeCounts.fromJson(Map<String, dynamic> json) =>
      _$BadgeCountsFromJson(json);

  Map<String, dynamic> toJson() => _$BadgeCountsToJson(this);
}

enum UserType {
  @JsonValue("moderator")
  MODERATOR,
  @JsonValue("registered")
  REGISTERED
}

extension UserTypeHelper on UserType {
  static String getUserTypeTitle(
      UserType userType, AppLocalizations appLocale) {
    switch (userType) {
      case UserType.MODERATOR:
        return appLocale.moderator;
      case UserType.REGISTERED:
        return appLocale.registered;

      default:
        return appLocale.moderator;
    }
  }

  Color get userTypeColor {
    switch (this) {
      case UserType.MODERATOR:
        return OkayColors.deepLalic;
      case UserType.REGISTERED:
        return OkayColors.lightTeal;

      default:
        return OkayColors.deepLalic;
    }
  }
}
