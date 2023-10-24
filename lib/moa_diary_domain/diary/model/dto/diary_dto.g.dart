// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiaryDto _$DiaryDtoFromJson(Map<String, dynamic> json) => DiaryDto(
      diaryId: json['diaryId'] as int? ?? -1,
      userDisplayName: json['userDisplayName'] as String? ?? '',
      userProfileImage: json['userProfileImage'] as String? ?? '',
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
      likeCount: json['likeCount'] as int? ?? 0,
      commentCount: json['commentCount'] as int? ?? 0,
      hashTags: (json['hashTags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      emotion: json['emotion'] as String? ?? '',
      createdAt: json['createdAt'] as int? ?? -1,
      isPublic: json['isPublic'] as bool? ?? false,
      isAvailableComment: json['isAvailableComment'] as bool? ?? false,
      imageUrls: (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      comment: (json['comment'] as List<dynamic>?)
              ?.map((e) => CommentDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DiaryDtoToJson(DiaryDto instance) => <String, dynamic>{
      'diaryId': instance.diaryId,
      'userDisplayName': instance.userDisplayName,
      'userProfileImage': instance.userProfileImage,
      'title': instance.title,
      'content': instance.content,
      'likeCount': instance.likeCount,
      'commentCount': instance.commentCount,
      'hashTags': instance.hashTags,
      'emotion': instance.emotion,
      'createdAt': instance.createdAt,
      'isPublic': instance.isPublic,
      'isAvailableComment': instance.isAvailableComment,
      'imageUrls': instance.imageUrls,
      'comment': instance.comment.map((e) => e.toJson()).toList(),
    };
