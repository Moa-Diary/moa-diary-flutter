import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_dto.g.dart';

@JsonSerializable()
class CommentDto extends Equatable {
  const CommentDto({
    this.commentBy = '',
    this.commentByImage = '',
    this.comment = '',
    this.commentId = -1,
    this.commentLikeCount = 0,
  });

  final String commentBy;
  final String commentByImage;
  final String comment;
  final int commentId;
  final int commentLikeCount;

  @override
  List<Object?> get props => [
    commentBy,
    commentByImage,
    comment,
    commentId,
    commentLikeCount,
  ];

  factory CommentDto.fromJson(Map<String, dynamic> json) => _$CommentDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CommentDtoToJson(this);
}
