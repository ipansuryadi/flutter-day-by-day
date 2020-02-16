import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:mymy/common/network/network_check_impl.dart';
import 'package:mymy/data/omdb_movies/datasouces/omdb_movies_local_datasource_shared_preferences_impl.dart';
import 'package:mymy/data/omdb_movies/models/omdb_movie.dart';
import 'package:mymy/data/omdb_movies/repositories/omdb_movie_repository.dart';
import 'package:mymy/data/omdb_movies/repositories/omdb_movie_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<OmdbMovie> _movieList;

  Future<OmdbMovieRepository> get omdbMovieRepository async =>
      OmdbMovieRepositoryImpl(
          omdbMoviesLocalDatasource:
              OmdbMoviesLocalDatasourceSharedPreferencesImpl(
                  sharedPreferences: await SharedPreferences.getInstance()),
          networkCheck: NetworkCheckImpl(connectivity: Connectivity()));

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildMovieList(),
    );
  }

  Widget _buildMovieList() {
    if (_movieList == null) {
      return _buildLoadingPage();
    } else {
      return Center(
        child: ListView.builder(
            itemCount: _movieList.length, itemBuilder: _buildItemList),
      );
    }
  }

  Widget _buildLoadingPage() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildItemList(BuildContext context, int index) {
    final movie = _movieList[index];
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          key: Key('movie_$index'),
          title: Text(movie.title),
        ),
      ),
    );
  }

  void _getData() async {
    final repository = await omdbMovieRepository;
    try {
      final list = await repository.getMovies();
      if (mounted) {
        setState(() {
          _movieList=list;
        });
      }
    // } on NoConnectionError catch (_) {
    } catch (e) {}
  }
}
