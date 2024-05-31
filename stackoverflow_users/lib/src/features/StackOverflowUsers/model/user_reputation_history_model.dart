import 'dart:ui';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:logger/logger.dart';
import 'package:stackoverflow_users/src/core/providers/shared_preferences_provider.dart';
import 'package:stackoverflow_users/src/styles/colors.dart';
part "user_reputation_history_model.g.dart";

@JsonSerializable()
class UserReputationHistoryResponseModel {
  @JsonKey(name: "items")
  List<ReputationHistory>? reputations;
  @JsonKey(name: "has_more")
  bool? hasMore;
  @JsonKey(name: "quota_max")
  int? quotaMax;
  @JsonKey(name: "quota_remaining")
  int? quotaRemaining;

  UserReputationHistoryResponseModel({
    this.reputations,
    this.hasMore,
    this.quotaMax,
    this.quotaRemaining,
  });

  factory UserReputationHistoryResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$UserReputationHistoryResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UserReputationHistoryResponseModelToJson(this);
}

@JsonSerializable()
class ReputationHistory {
  @JsonKey(name: "reputation_history_type")
  ReputationHistoryType? reputationHistoryType;
  @JsonKey(name: "reputation_change")
  int? reputationChange;
  @JsonKey(name: "post_id")
  int? postId;
  @JsonKey(name: "creation_date")
  int? creationDate;
  @JsonKey(name: "user_id")
  int? userId;

  ReputationHistory({
    this.reputationHistoryType,
    this.reputationChange,
    this.postId,
    this.creationDate,
    this.userId,
  });

  factory ReputationHistory.fromJson(Map<String, dynamic> json) =>
      _$ReputationHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$ReputationHistoryToJson(this);
}

enum ReputationHistoryType {
  @JsonValue("post_downvoted")
  POST_DOWNVOTED,
  @JsonValue("post_unupvoted")
  POST_UNUPVOTED,
  @JsonValue("post_upvoted")
  POST_UPVOTED,
  @JsonValue("user_deleted")
  USER_DELETED,
  @JsonValue("answer_unaccepted")
  ANSWER_UNACCEPTED,
  @JsonValue("vote_fraud_reversal")
  VOTE_FRAUD_REVERSAL,
  @JsonValue("answer_accepted")
  ANSWER_ACCEPTED,
  @JsonValue("post_undownvoted")
  POST_UNDOWNVOTED
}

extension ReputationHistoryTypeHelper on ReputationHistoryType {
  static String getReputationTypeTitle(
      ReputationHistoryType reputationType, AppLocalizations appLocale) {
    switch (reputationType) {
      case ReputationHistoryType.POST_DOWNVOTED:
        return appLocale.postDownvoted;
      case ReputationHistoryType.POST_UNUPVOTED:
        return appLocale.postUnupvoted;
      case ReputationHistoryType.POST_UPVOTED:
        return appLocale.postUpvoted;
      case ReputationHistoryType.USER_DELETED:
        return appLocale.userDeleted;
      case ReputationHistoryType.ANSWER_UNACCEPTED:
        return appLocale.answerUnAccepted;
      case ReputationHistoryType.ANSWER_ACCEPTED:
        return appLocale.answerAccepted;
      case ReputationHistoryType.VOTE_FRAUD_REVERSAL:
        return appLocale.voteFraudReversal;
      case ReputationHistoryType.POST_UNDOWNVOTED:
        return appLocale.postUndownvoted;
      default:
        return appLocale.postDownvoted;
    }
  }

  Color get reputationTypeColor {
    switch (this) {
      case ReputationHistoryType.POST_DOWNVOTED:
        return OkayColors.blue;
      case ReputationHistoryType.POST_UNUPVOTED:
        return OkayColors.lightTeal;
      case ReputationHistoryType.POST_UPVOTED:
        return OkayColors.deepLalic;
      case ReputationHistoryType.USER_DELETED:
        return OkayColors.pinkishRed;
      case ReputationHistoryType.ANSWER_UNACCEPTED:
        return OkayColors.green;
      case ReputationHistoryType.POST_UNDOWNVOTED:
      case ReputationHistoryType.ANSWER_ACCEPTED:
        return OkayColors.blush;

      default:
        return OkayColors.deepLalic;
    }
  }
}
