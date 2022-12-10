import 'package:peliculas/models/popular_response.dart';

import '../models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  String _baseURL = 'api.themoviedb.org';
  String _apiKEY = 'b27a63dc8eccb5c6c26eb189c0d70eec';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> movieCast = {};
  int _popularPage = 0;

  MoviesProvider() {
    print('Movies provider inicializado');

    this.getOnDisplaysMovies();
    this.getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseURL, endpoint,
        {'api_key': _apiKEY, 'language': _language, 'page': '$page'});

    print('la url es--------> $url');

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplaysMovies() async {
    final jsonData = await this._getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners(); // esto notifica alos widtes si cambian los estados
  }

  getPopularMovies() async {
    _popularPage++;
    final jsonData = await this._getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners(); // esto notifica alos }
  }

  Future<List<Cast>> getMovieCast(int moviId) async {
    if (movieCast.containsKey(moviId)) return movieCast[moviId]!;
    //todo revisar el map
    print('pidiendo info al servidor');

    final jsonData = await this._getJsonData('3/movie/$moviId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);

    movieCast[moviId] = creditsResponse.cast;
    return creditsResponse.cast;
  }
}
