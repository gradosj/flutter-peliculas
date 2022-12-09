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
  MoviesProvider() {
    print('Movies provider inicializado');

    this.getOnDisplaysMovies();
    this.getPopularMovies();
  }

  getOnDisplaysMovies() async {
    var url = Uri.https(_baseURL, '3/movie/now_playing',
        {'api_key': _apiKEY, 'lenguaje': _lenguaje, 'page': '1'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    print(nowPlayingResponse.results[5].title);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners(); // esto notifica alos widtes si cambian los estados
  }

  getPopularMovies() async {
    var url = Uri.https(_baseURL, '3/movie/popular',
        {'api_key': _apiKEY, 'lenguaje': _lenguaje, 'page': '1'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);

    popularMovies = [...popularMovies, ...popularResponse.results];
    print('wiiiiiiiiiiiiiiiiiiiiiiiiii $popularMovies');
    notifyListeners(); // esto notifica alos }
  }
}
