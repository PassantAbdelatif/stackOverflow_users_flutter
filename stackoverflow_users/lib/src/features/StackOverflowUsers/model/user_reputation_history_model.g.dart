// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_reputation_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserReputationHistoryResponseModel _$UserReputationHistoryResponseModelFromJson(
        Map<String, dynamic> json) =>
    UserReputationHistoryResponseModel(
      reputations: (json['items'] as List<dynamic>?)
          ?.map((e) => ReputationHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMore: json['has_more'] as bool?,
      quotaMax: (json['quota_max'] as num?)?.toInt(),
      quotaRemaining: (json['quota_remaining'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserReputationHistoryResponseModelToJson(
        UserReputationHistoryResponseModel instance) =>
    <String, dynamic>{
      'items': instance.reputations,
      'has_more': instance.hasMore,
      'quota_max': instance.quotaMax,
      'quota_remaining': instance.quotaRemaining,
    };

ReputationHistory _$ReputationHistoryFromJson(Map<String, dynamic> json) {
  
  return ReputationHistory(
    reputationHistoryType: $enumDecodeNullable(
        _$ReputationHistoryTypeEnumMap, json['reputation_history_type']),
    reputationChange: (json['reputation_change'] as num?)?.toInt(),
    postId: (json['post_id'] as num?)?.toInt(),
    creationDate: (json['creation_date'] as num?)?.toInt(),
    userId: (json['user_id'] as num?)?.toInt(),
  );
}

Map<String, dynamic> _$ReputationHistoryToJson(ReputationHistory instance) =>
    <String, dynamic>{
      'reputation_history_type':
          _$ReputationHistoryTypeEnumMap[instance.reputationHistoryType],
      'reputation_change': instance.reputationChange,
      'post_id': instance.postId,
      'creation_date': instance.creationDate,
      'user_id': instance.userId,
    };

const _$ReputationHistoryTypeEnumMap = {
  ReputationHistoryType.POST_DOWNVOTED: 'post_downvoted',
  ReputationHistoryType.POST_UNUPVOTED: 'post_unupvoted',
  ReputationHistoryType.POST_UPVOTED: 'post_upvoted',
  ReputationHistoryType.USER_DELETED: 'user_deleted',
  ReputationHistoryType.ANSWER_UNACCEPTED: 'answer_unaccepted',
  ReputationHistoryType.VOTE_FRAUD_REVERSAL: 'vote_fraud_reversal',
  ReputationHistoryType.ANSWER_ACCEPTED: 'answer_accepted',
  ReputationHistoryType.POST_UNDOWNVOTED: 'post_undownvoted',
};
