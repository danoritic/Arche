import '../../handlers/handlers.dart';

class SearchHandler {
  List searchResult = [];
  MovieListHandler movieListHandler = MovieListHandler();
  Future<List> searchMovies(String keyword) async {
    List result = [];
    result =
        ((await movieListHandler.searchMovies(keyword))['results'] as List);

    // notifyListeners();
    return result;
  }
}
