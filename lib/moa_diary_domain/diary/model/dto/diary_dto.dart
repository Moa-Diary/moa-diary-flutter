import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'comment_dto.dart';

part 'diary_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class DiaryDto extends Equatable {
  const DiaryDto({
    this.diaryId = -1,
    this.title = '',
    this.content = '',
    this.likeCount = 0,
    this.commentCount = 0,
    this.hashTags = const [],
    this.emotion = '',
    this.createdAt = '',
    this.isPublic = false,
    this.isAvailableComment = false,
    this.imageUrls = const [],
    this.comment = const [],
  });

  final int diaryId;
  final String title;
  final String content;
  final int likeCount;
  final int commentCount;
  final List<String> hashTags;
  final String emotion;
  final String createdAt;
  final bool isPublic;
  final bool isAvailableComment;
  final List<String> imageUrls;
  final List<CommentDto> comment;

  @override
  List<Object?> get props => [
    diaryId,
    title,
    content,
    likeCount,
    commentCount,
    hashTags,
    emotion,
    createdAt,
    isPublic,
    isAvailableComment,
    imageUrls,
    comment,
  ];

  factory DiaryDto.fromJson(Map<String, dynamic> json) => _$DiaryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DiaryDtoToJson(this);
}
