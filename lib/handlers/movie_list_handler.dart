import "package:arche/global_object.dart";
import "package:arche/requester.dart";
// import "package:flutter/material.dart";
// import "package:http/http.dart";
// import "package:provider/provider.dart";

class MovieListHandler {
  List<String> genreList = [];
  // String apiKey = 'ac603e3fea1520aafec5cae81a86a03b';
  String apiKey =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhYzYwM2UzZmVhMTUyMGFhZmVjNWNhZTgxYTg2YTAzYiIsInN1YiI6IjY0ZWU1MzM0NzdkMjNiMDEyZTg5MDY2ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.iBq9c-ot1mbJvMa_aH8lMc0EDQj8XF3yrJ1-9grTx2Y';

  Iterable? apiDetail;
  Future<Map<String, dynamic>> getGenre() async {
    Map<String, dynamic> result = {};

    String url = "https://api.themoviedb.org/3/genre/movie/list";

    Map<String, String> header = {"Authorization": "Bearer $apiKey"};

    Map<String, dynamic> rawResult = await requestResources(
      url,
      {"language": "en"},
      header,
      'parametered_get',
      "api.themoviedb.org",
      "/3/genre/movie/list",
    );
    result = rawResult;
    custom_print(result, 'genre');
    // notifyListeners();
    return result;
  }

  Future<Map<String, dynamic>> getMoviesByGenre(String genreId) async {
    Map<String, dynamic> result = {};

    String url =
        "https://api.themoviedb.org/3/discover/movie?include_adult=false";

    Map<String, String> header = {"Authorization": "Bearer $apiKey"};

    Map<String, dynamic> rawResult = await requestResources(
        url,
        {"language": "en", "with_genres": genreId, 'include_adult': 'false'},
        header,
        'parametered_get',
        "api.themoviedb.org",
        "/3/discover/movie");
    result = rawResult;
    // notifyListeners();
    return result;
  }

  Future<Map<String, dynamic>> searchMovies(String keyword,
      [String? page]) async {
    Map<String, dynamic> result = {};

    String url =
        "https://api.themoviedb.org/3/search/movie?query=Jack+Reacher&api_key=ac603e3fea1520aafec5cae81a86a03b";

    Map<String, String> header = {"Authorization": "Bearer $apiKey"};

    Map<String, dynamic> rawResult = await requestResources(
        url,
        {
          "query": keyword,
          'page': page ?? "1",
        },
        header,
        'parametered_get',
        "api.themoviedb.org",
        "/3/search/movie");
    result = rawResult;
    // notifyListeners();
    return result;
  }
}
