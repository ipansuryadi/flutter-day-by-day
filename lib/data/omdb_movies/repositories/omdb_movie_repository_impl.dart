import 'package:flutter/material.dart';
import 'package:mymy/common/errors/no_connection_error.dart';
import 'package:mymy/common/network/network_check.dart';
import 'package:mymy/data/omdb_movies/datasouces/omdb_movies_local_datasource.dart';
import 'package:mymy/data/omdb_movies/models/omdb_movie.dart';
import 'package:mymy/data/omdb_movies/repositories/omdb_movie_repository.dart';

class OmdbMovieRepositoryImpl implements OmdbMovieRepository {
  final OmdbMoviesLocalDatasource omdbMoviesLocalDatasource;
  final NetworkCheck networkCheck;

  OmdbMovieRepositoryImpl({
    @required this.omdbMoviesLocalDatasource,
    @required this.networkCheck,
  });

  @override
  Future<List<OmdbMovie>> getMovies() async {
    // String json = getFakeOmdbMoviesResponse();
    // List<OmdbMovie> movieList = [];
    // List<dynamic> decodedJson = jsonDecode(json);
    // decodedJson.forEach((movie)=>{
    //   movieList.add(OmdbMovie.fromJson(movie as Map<String, dynamic>))
    // });
    // omdbMoviesLocalDatasource.setMovies(movieList);
    final localData = await omdbMoviesLocalDatasource.getMovies();
    if (localData != null && localData.isNotEmpty) {
      return localData;
    // }if(await networkCheck.isOnline()){
      // final movieList = await omdbMoviesRemoteDatasource.getMovies();
      // omdbMoviesLocalDatasource.setMovies(movieList);
      // return movieList;
    }
    throw NoConnectionError();
  }
}
