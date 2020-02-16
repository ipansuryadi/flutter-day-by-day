
import 'package:mymy/data/omdb_movies/models/omdb_movie.dart';

abstract class OmdbMoviesLocalDatasource{
  Future<List<OmdbMovie>> getMovies();
  Future<void> setMovies(List<OmdbMovie> movies);
}