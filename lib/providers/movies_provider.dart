import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    print('Movies provider inicializado');

    this.getOnDisplaysMovies();
  }

  getOnDisplaysMovies() async {
    print('getOnDisplaysMovies');
  }
}
