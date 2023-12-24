import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/database_models/favorites_model.dart';
import 'package:movies_app/database_models/genres_model.dart';
import 'package:movies_app/database_models/login/login_user_model.dart';
import 'package:movies_app/database_models/register/register_model.dart';
import 'package:movies_app/database_models/requests_model.dart';
import 'package:movies_app/database_models/response_model.dart';
import 'package:movies_app/database_models/series_insert_model.dart';
import 'package:movies_app/database_models/watch_list_model.dart';

import '../database_models/movies_insert_model.dart';
import '../database_models/movies_model.dart';
import '../database_models/series_model.dart';
import '../services/services.dart';

class AuthenticationManager {
  BuildContext context;

  AuthenticationManager({
    required this.context,
  });

  final LoginService loginService = LoginService(Dio(BaseOptions(
    baseUrl: 'https://viewverse.fun',
    headers: {
      'Accept': 'application/x-www-form-urlencoded',
      'Content-Type': 'application/x-www-form-urlencoded',
    },
  )));

  late RegisterModel registerModel;
  late LoginModel userModel;
  late List<Movies> movies;
  late List<Series> series;
  late List<Requests> requests;
  late List<Genres> genres;
  late List<Favorites> favorites;
  late List<WatchList> watchList;
  late ResponseModel insertResponseModel;
  late ResponseModel deleteResponseModel;
  late ResponseModel addFavoriteMovieResponseModel;
  late ResponseModel deleteFavoriteMovieResponseModel;
  late ResponseModel addFavoriteSerieResponseModel;
  late ResponseModel deleteFavoriteSerieResponseModel;
  late ResponseModel addWatchMovieResponseModel;
  late ResponseModel deleteWatchMovieResponseModel;
  late ResponseModel addWatchSerieResponseModel;
  late ResponseModel deleteWatchSerieResponseModel;
  late MovieInsertModel insertMovieResponse;
  late SeriesInsertModel insertSerieResponse;
  bool isLogin = false;
  DateTime formatedDate = DateTime.now().toLocal();
  var responseSnackBar = const SnackBar(
    content: Text("You successfully registered"),
  );
  late String failMessage;

  Future<void> fetchRegister(String username, String password, int birthyear,
      String email, String gender) async {
    final response = await loginService.fetchRegister(
        username, password, birthyear, email, gender);
    registerModel = response!;
    print(registerModel.message!);
  }

  Future<void> fetchLogin(String username, String password) async {
    final response = await loginService.fetchLogin(username, password);
    print(response);
    userModel = response!;
    if (response!.success! == 1) {
      isLogin = true;
    } else {
      isLogin = false;
    }
  }

  Future<void> fetchMovies() async {
    final response = await loginService.fetchMovies(userModel.userId!);
    print(response);
    if (response!.success == 1) {
      movies = response.movies!;
      print(movies.length);
    } else {
      print("hata");
    }
  }

  Future<void> fetchSeries() async {
    final response = await loginService.fetchSeries(userModel.userId!);
    print(response);
    if (response!.success == 1) {
      series = response.series!;
      print(series.length);
    } else {
      print("hata");
    }
  }

  Future<void> fetchFavorites() async {
    final response = await loginService.fetchFavorites(userModel.userId!);
    print(response);
    if (response!.success == 1) {
      favorites = response.favorites!;
    } else {
      print("hata");
    }
  }

  Future<void> fetchWatchList() async {
    final response = await loginService.fetchWatchList(userModel.userId!);
    print(response);
    if (response!.success == 1) {
      watchList = response.watchList!;
    } else {
      print("hata");
    }
  }

  Future<void> fetchInsertMovie(
      String movieName,
      String releaseDate,
      String imdbRating,
      String directorName,
      String genre1,
      String genre2,
      String genre3,
      String url) async {
    final response = await loginService.fetchInsertMovie(movieName, releaseDate,
        imdbRating, directorName, genre1, genre2, genre3, url);
    if (response?.success == 1) {
      print(insertMovieResponse = response!);
      insertMovieResponse = response;
    } else {
      print(insertMovieResponse = response!);
      this.insertMovieResponse = response;
    }
  }

  Future<void> fetchInsertSerie(
      String serieName,
      String releaseDate,
      String imdbRating,
      String directorName,
      String genre1,
      String genre2,
      String genre3,
      String url) async {
    final response = await loginService.fetchInsertSeries(serieName,
        releaseDate, imdbRating, directorName, genre1, genre2, genre3, url);
    if (response?.success == 1) {
      print(insertSerieResponse = response!);
      insertSerieResponse = response;
    } else {
      print(insertSerieResponse = response!);
    }
  }

  Future<void> fetchGenres() async {
    final response = await loginService.fetchGenres();
    print(response);
    if (response!.success == 1) {
      genres = response.genres!;
    } else {
      print("hata");
    }
  }

  Future<void> fetchRequests() async {
    final response = await loginService.fetchRequests();

    if (response!.success == 1) {
      requests = response.requests!;
    } else {
      requests = [];
      print("hata");
    }
  }

  Future<void> fetchInsertRequest(String userID, String requestName) async {
    final response = await loginService.fetchInsertRequest(userID, requestName);
    print(response);
    insertResponseModel = response!;
  }

  Future<void> fetchDeleteRequest(String requestName) async {
    final response = await loginService.fetchDeleteRequest(requestName);
    print(response);
    deleteResponseModel = response!;
  }

  //
  //
  //
  Future<void> addFavoriteMovie(String userID, String movieId) async {
    final response = await loginService.addFavoriteMovie(userID, movieId);
    print(response);
    addFavoriteMovieResponseModel = response!;
  }

  Future<void> deleteFavoriteMovie(String userID, String movieId) async {
    final response = await loginService.deleteFavoriteMovie(userID, movieId);
    print(response);
    deleteFavoriteMovieResponseModel = response!;
  }

  Future<void> addFavoriteSerie(String userID, String serieId) async {
    final response = await loginService.addFavoriteSerie(userID, serieId);
    print(response);
    addFavoriteSerieResponseModel = response!;
  }

  Future<void> deleteFavoriteSerie(String userID, String serieId) async {
    final response = await loginService.deleteFavoriteSerie(userID, serieId);
    print(response);
    deleteFavoriteSerieResponseModel = response!;
  }

  //
  //
  //

  Future<void> addWatchMovie(String userID, String movieId) async {
    final response = await loginService.addWatchMovie(userID, movieId);
    print(response);
    addWatchMovieResponseModel = response!;
  }

  Future<void> deleteWatchMovie(String userID, String movieId) async {
    final response = await loginService.deleteWatchMovie(userID, movieId);
    print(response);
    deleteWatchMovieResponseModel = response!;
  }

  Future<void> addWatchSerie(String userID, String serieId) async {
    final response = await loginService.addWatchSerie(userID, serieId);
    print(response);
    addWatchSerieResponseModel = response!;
  }

  Future<void> deleteWatchSerie(String userID, String serieId) async {
    final response = await loginService.deleteWatchSerie(userID, serieId);
    print(response);
    deleteWatchSerieResponseModel = response!;
  }
}
