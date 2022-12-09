import 'package:peliculas/models/popular_response.dart';

import '../models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  String _baseURL = 'api.themoviedb.org';
  String _apiKEY = 'b27a63dc8eccb5c6c26eb189c0d70eec';
  String _lenguaje = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  int _popularPage = 0;

  MoviesProvider() {
    print('Movies provider inicializado');

    this.getOnDisplaysMovies();
    this.getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseURL, endpoint,
        {'api_key': _apiKEY, 'lenguaje': _lenguaje, 'page': '$page'});

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
}
