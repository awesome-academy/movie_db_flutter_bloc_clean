class GetMovieRequest {
  GetMovieRequest(this.apiKey, this.page, this.language);

  final String apiKey;
  final int page;
  final String language;

  Map<String, dynamic> toJson() => {
        'api_key': apiKey,
        'page': page,
        'language': language,
      };
}
