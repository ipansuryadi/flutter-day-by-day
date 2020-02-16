import 'package:mymy/data/omdb_movies/models/omdb_movie.dart';

abstract class OmdbMoviesRemoteDatasource{
  Future<List<OmdbMovie>> getMovies();
}