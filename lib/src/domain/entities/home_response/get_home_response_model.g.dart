// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_home_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUpComingResponseModel _$GetUpComingResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetUpComingResponseModel(
      dates: json['dates'] == null
          ? null
          : UpcomingDates.fromJson(json['dates'] as Map<String, dynamic>),
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as num?,
      totalResults: json['total_results'] as num?,
    );

UpcomingDates _$UpcomingDatesFromJson(Map<String, dynamic> json) =>
    UpcomingDates(
      maximum: json['maximum'] == null
          ? null
          : DateTime.parse(json['maximum'] as String),
      minimum: json['minimum'] == null
          ? null
          : DateTime.parse(json['minimum'] as String),
    );
