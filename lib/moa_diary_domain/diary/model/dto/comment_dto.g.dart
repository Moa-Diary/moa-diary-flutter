// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentDto _$CommentDtoFromJson(Map<String, dynamic> json) => CommentDto(
      commentBy: json['commentBy'] as String? ?? '',
      commentByImage: json['commentByImage'] as String? ?? '',
      comment: json['comment'] as String? ?? '',
      commentId: json['commentId'] as int? ?? -1,
      commentLikeCount: json['commentLikeCount'] as int? ?? 0,
    );

Map<String, dynamic> _$CommentDtoToJson(CommentDto instance) =>
    <String, dynamic>{
      'commentBy': instance.commentBy,
      'commentByImage': instance.commentByImage,
      'comment': instance.comment,
      'commentId': instance.commentId,
      'commentLikeCount': instance.commentLikeCount,
    };
