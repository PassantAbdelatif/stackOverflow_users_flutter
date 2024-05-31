// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sof_users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SofUsersResponseModel _$SofUsersResponseModelFromJson(
        Map<String, dynamic> json) =>
    SofUsersResponseModel(
      users: (json['items'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMore: json['has_more'] as bool?,
      quotaMax: (json['quota_max'] as num?)?.toInt(),
      quotaRemaining: (json['quota_remaining'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SofUsersResponseModelToJson(
        SofUsersResponseModel instance) =>
    <String, dynamic>{
      'items': instance.users,
      'has_more': instance.hasMore,
      'quota_max': instance.quotaMax,
      'quota_remaining': instance.quotaRemaining,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      badgeCounts: json['badge_counts'] == null
          ? null
          : BadgeCounts.fromJson(json['badge_counts'] as Map<String, dynamic>),
      accountId: (json['account_id'] as num?)?.toInt(),
      isEmployee: json['is_employee'] as bool?,
      lastModifiedDate: (json['last_modified_date'] as num?)?.toInt(),
      lastAccessDate: (json['last_access_date'] as num?)?.toInt(),
      reputationChangeYear: (json['reputation_change_year'] as num?)?.toInt(),
      reputationChangeQuarter:
          (json['reputation_change_quarter'] as num?)?.toInt(),
      reputationChangeMonth: (json['reputation_change_month'] as num?)?.toInt(),
      reputationChangeWeek: (json['reputation_change_week'] as num?)?.toInt(),
      reputationChangeDay: (json['reputation_change_day'] as num?)?.toInt(),
      reputation: (json['reputation'] as num?)?.toInt(),
      creationDate: (json['creation_date'] as num?)?.toInt(),
      userType: $enumDecodeNullable(_$UserTypeEnumMap, json['user_type']),
      userId: (json['user_id'] as num?)?.toInt(),
      acceptRate: (json['accept_rate'] as num?)?.toInt(),
      location: json['location'] as String?,
      websiteUrl: json['website_url'] as String?,
      link: json['link'] as String?,
      profileImage: json['profile_image'] as String?,
      displayName: json['display_name'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'badge_counts': instance.badgeCounts,
      'account_id': instance.accountId,
      'is_employee': instance.isEmployee,
      'last_modified_date': instance.lastModifiedDate,
      'last_access_date': instance.lastAccessDate,
      'reputation_change_year': instance.reputationChangeYear,
      'reputation_change_quarter': instance.reputationChangeQuarter,
      'reputation_change_month': instance.reputationChangeMonth,
      'reputation_change_week': instance.reputationChangeWeek,
      'reputation_change_day': instance.reputationChangeDay,
      'reputation': instance.reputation,
      'creation_date': instance.creationDate,
      'user_type': _$UserTypeEnumMap[instance.userType],
      'user_id': instance.userId,
      'accept_rate': instance.acceptRate,
      'location': instance.location,
      'website_url': instance.websiteUrl,
      'link': instance.link,
      'profile_image': instance.profileImage,
      'display_name': instance.displayName,
    };

const _$UserTypeEnumMap = {
  UserType.MODERATOR: 'moderator',
  UserType.REGISTERED: 'registered',
};

BadgeCounts _$BadgeCountsFromJson(Map<String, dynamic> json) => BadgeCounts(
      bronze: (json['bronze'] as num?)?.toInt(),
      silver: (json['silver'] as num?)?.toInt(),
      gold: (json['gold'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BadgeCountsToJson(BadgeCounts instance) =>
    <String, dynamic>{
      'bronze': instance.bronze,
      'silver': instance.silver,
      'gold': instance.gold,
    };
