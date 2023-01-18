// Package imports:
import 'package:ez_cache/ez_cache.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:movie_db_flutter_bloc_clean/src/data/datasources/local/cache_key.dart';

part 'movie_model.g.dart';

@JsonSerializable(createToJson: false)
class DataAndTotalPage {
  final List<MovieModel>? data;
  final int? totalPages;

  DataAndTotalPage({this.data, this.totalPages});
}

@HiveType(typeId: CacheKey.listMovie)
class LisMovieModel {
  @HiveField(0)
  final List<MovieModel> data;

  LisMovieModel(this.data);
}

@HiveType(typeId: CacheKey.movie)
@JsonSerializable(createToJson: false)
class MovieModel {
  MovieModel({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  @HiveField(0)
  final bool? adult;

  @HiveField(1)
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @HiveField(2)
  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;

  @HiveField(3)
  final int? id;

  @HiveField(4)
  @JsonKey(name: 'original_language')
  final String? originalLanguage;

  @HiveField(5)
  @JsonKey(name: 'original_title')
  final String? originalTitle;

  @HiveField(6)
  final String? overview;

  @HiveField(7)
  final double? popularity;

  @HiveField(8)
  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @HiveField(9)
  @JsonKey(name: 'release_date')
  final DateTime? releaseDate;

  @HiveField(10)
  final String? title;

  @HiveField(11)
  final bool? video;

  @HiveField(12)
  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  @HiveField(13)
  @JsonKey(name: 'vote_count')
  final int? voteCount;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
}
