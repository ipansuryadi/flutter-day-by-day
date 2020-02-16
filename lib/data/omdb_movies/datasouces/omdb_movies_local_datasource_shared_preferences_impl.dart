import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mymy/data/omdb_movies/datasouces/omdb_movies_local_datasource.dart';
import 'package:mymy/data/omdb_movies/models/omdb_movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OmdbMoviesLocalDatasourceSharedPreferencesImpl
    implements OmdbMoviesLocalDatasource {
  final SharedPreferences sharedPreferences;

  OmdbMoviesLocalDatasourceSharedPreferencesImpl(
      {@required this.sharedPreferences});

  @override
  Future<List<OmdbMovie>> getMovies() async {
    final jsonString = sharedPreferences.getString('omdb_movie_cache');
    if (jsonString != null) {
      List<dynamic> rawList = jsonDecode(jsonString);
      List<OmdbMovie> movieList = rawList
          .map<OmdbMovie>((dynamic rawItem) =>
              OmdbMovie.fromJson(rawItem as Map<String, dynamic>))
          .toList();
      return movieList;
    }
    return null;
  }

  @override
  Future<void> setMovies(List<OmdbMovie> movies) async {
    if(movies==null){
      await sharedPreferences.remove('omdb_movie_cache');
    }else{
      final rawList = movies.map<Map<String, dynamic>>((OmdbMovie movie)=>movie.toJson()).toList();
      final json = jsonEncode(rawList);
      await sharedPreferences.setString('omdb_movie_cache', json);
    }
  }
}
