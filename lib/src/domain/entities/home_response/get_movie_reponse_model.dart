// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'movie_model.dart';

part 'get_movie_reponse_model.g.dart';

@JsonSerializable(createToJson: false)
class GetMovieReponseModel {
  GetMovieReponseModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int? page;
  final List<MovieModel>? results;

  @JsonKey(name: 'total_pages')
  final int? totalPages;

  @JsonKey(name: 'total_results')
  final int? totalResults;

  factory GetMovieReponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetMovieReponseModelFromJson(json);
}
