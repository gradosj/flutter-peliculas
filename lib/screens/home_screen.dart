import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(
      context,
    );

    print((moviesProvider.onDisplayMovies));

    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas de cine'),
        elevation: 0,
        //     iconTheme: IconTheme.of(context),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // tarjetas principales
            CardSwiper(
              movies: moviesProvider.onDisplayMovies,
            ),
            //slider de peliculas
            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'Populares!',
            ),
          ],
        ),
      ),
    );
  }
}
