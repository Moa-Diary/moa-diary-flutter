import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moa_diary_app/moa_diary_domain/diary/diary.dart';

part 'pagination_response_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class PaginationResponseDto<T> extends Equatable {
  const PaginationResponseDto({
    this.content = const [],
    this.totalPages = 0,
    this.totalElements = 0,
    this.size = 0,
    this.page = 0,
    this.hasMoreResult = false,
  });

  @_MyJsonConverter()
  final List<T> content;

  final int totalPages;
  final int totalElements;
  final int size;
  final int page;
  final bool hasMoreResult;

  @override
  List<Object?> get props => [
        content,
        totalPages,
        totalElements,
        size,
        page,
        hasMoreResult,
      ];

  factory PaginationResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PaginationResponseDtoFromJson<T>(json);

  Map<String, dynamic> toJson() => _$PaginationResponseDtoToJson<T>(this);
}

class _MyJsonConverter<T> extends JsonConverter<T, Map<String, dynamic>> {
  const _MyJsonConverter();

  @override
  T fromJson(json) {
    if (T == DiaryDto) {
      return DiaryDto.fromJson(json) as T;
    }
    throw UnsupportedError('Unsupported type: $T');
  }

  @override
  Map<String, dynamic> toJson(object) {
    if (object is DiaryDto) {
      return object.toJson();
    }
    return {};
  }

}
