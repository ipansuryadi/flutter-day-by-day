import 'package:mymy/data/omdb_movies/models/omdb_movie.dart';

abstract class OmdbMovieRepository{
  Future<List<OmdbMovie>> getMovies();
}