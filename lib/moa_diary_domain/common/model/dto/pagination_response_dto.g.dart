// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationResponseDto<T> _$PaginationResponseDtoFromJson<T>(
        Map<String, dynamic> json) =>
    PaginationResponseDto<T>(
      content: (json['content'] as List<dynamic>?)
              ?.map((e) =>
                  _MyJsonConverter<T>().fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalPages: json['totalPages'] as int? ?? 0,
      totalElements: json['totalElements'] as int? ?? 0,
      size: json['size'] as int? ?? 0,
      page: json['page'] as int? ?? 0,
      hasMoreResult: json['hasMoreResult'] as bool? ?? false,
    );

Map<String, dynamic> _$PaginationResponseDtoToJson<T>(
        PaginationResponseDto<T> instance) =>
    <String, dynamic>{
      'content': instance.content.map(_MyJsonConverter<T>().toJson).toList(),
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'size': instance.size,
      'page': instance.page,
      'hasMoreResult': instance.hasMoreResult,
    };
