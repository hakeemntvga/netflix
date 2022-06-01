import 'package:json_annotation/json_annotation.dart';
import 'package:netflix/core/colors/constant.dart';

part 'search_repo.g.dart';

@JsonSerializable()
class SearchRepo {
  @JsonKey(name: "results")
  List<SeachResultData> results;

  SearchRepo({this.results = const []});

  factory SearchRepo.fromJson(Map<String, dynamic> json) {
    return _$SearchRepoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchRepoToJson(this);
}

@JsonSerializable()
class SeachResultData {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  String get posterImageUrl => '$imageAppendUrl$posterPath';

  SeachResultData({
    this.id,
    this.originalTitle,
    this.posterPath,
  });

  factory SeachResultData.fromJson(Map<String, dynamic> json) {
    return _$SeachResultDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SeachResultDataToJson(this);
}
