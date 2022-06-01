// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchRepo _$SearchRepoFromJson(Map<String, dynamic> json) => SearchRepo(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => SeachResultData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SearchRepoToJson(SearchRepo instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

SeachResultData _$SeachResultDataFromJson(Map<String, dynamic> json) =>
    SeachResultData(
      id: json['id'] as int?,
      originalTitle: json['original_title'] as String?,
      posterPath: json['poster_path'] as String?,
    );

Map<String, dynamic> _$SeachResultDataToJson(SeachResultData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'original_title': instance.originalTitle,
      'poster_path': instance.posterPath,
    };
