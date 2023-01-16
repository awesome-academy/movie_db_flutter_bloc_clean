// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'movie_model.dart';

part 'get_home_response_model.g.dart';

@JsonSerializable(createToJson: false)
class GetUpComingResponseModel {
  GetUpComingResponseModel({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final UpcomingDates? dates;
  final int? page;
  final List<MovieModel>? results;

  @JsonKey(name: 'total_pages')
  final num? totalPages;

  @JsonKey(name: 'total_results')
  final num? totalResults;

  factory GetUpComingResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetUpComingResponseModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class UpcomingDates {
  UpcomingDates({
    required this.maximum,
    required this.minimum,
  });

  final DateTime? maximum;
  final DateTime? minimum;

  factory UpcomingDates.fromJson(Map<String, dynamic> json) =>
      _$UpcomingDatesFromJson(json);
}
