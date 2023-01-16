// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movie_reponse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMovieReponseModel _$GetMovieReponseModelFromJson(
        Map<String, dynamic> json) =>
    GetMovieReponseModel(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );
