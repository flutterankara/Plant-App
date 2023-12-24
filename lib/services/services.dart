import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:movies_app/database_models/favorites_model.dart';
import 'package:movies_app/database_models/movies_insert_model.dart';
import 'package:movies_app/database_models/register/register_model.dart';
import 'package:movies_app/database_models/response_model.dart';
import 'package:movies_app/database_models/watch_list_model.dart';

import '../database_models/genres_model.dart';
import '../database_models/login/login_user_model.dart';
import '../database_models/movies_model.dart';
import '../database_models/requests_model.dart';
import '../database_models/series_insert_model.dart';
import '../database_models/series_model.dart';

abstract class ILoginService {
  final registerPath = '/viewVerse/register_user.php';
  final loginPath = '/viewVerse/login_user.php';
  final moviePath = "/viewVerse/all_movies.php";
  final seriePath = "/viewVerse/all_series.php";
  final favoritesPath = "/viewVerse/all_favorites.php";
  final watchListPath = "/viewVerse/all_watchList.php";
  final insertMovie = "/viewVerse/insert_movie.php";
  final insertSeries = "/viewVerse/insert_series.php";
  final requestPath = "/viewVerse/requests.php";
  final insertRequestPath = "/viewVerse/add_request.php";
  final deleteRequestPath = "/viewVerse/delete_request.php";
  final genresPath = "/viewVerse/all_genres.php";
  final addDeleteFavoriteMoviePath = "/viewVerse/add_delete_favorite_movie.php";
  final addDeleteFavoriteSeriePath = "/viewVerse/add_delete_favorite_serie.php";
  final addDeleteWatchMoviePath = "/viewVerse/add_delete_watch_movie.php";
  final addDeleteWatchSeriePath = "/viewVerse/add_delete_watch_serie.php";

  ILoginService(this.dio);
  final Dio dio;
  Future<RegisterModel?> fetchRegister(String username, String password,
      int birthyear, String email, String gender);
  Future<LoginModel?> fetchLogin(
    String username,
    String password,
  );
}

class LoginService extends ILoginService {
  LoginService(super.dio);

  @override
  Future<RegisterModel?> fetchRegister(String username, String password,
      int birthyear, String email, String gender) async {
    var model = {
      "username": username,
      "password": password,
      "birthyear": birthyear,
      "email": email,
      "gender": gender
    };

    final response = await dio.post(registerPath, data: model);
    print("object");
    print(response);

    if (response.statusCode == HttpStatus.ok) {
      var data = json.decode(response.data);
      return RegisterModel.fromJson(data);
    }
    return null;
  }

  Future<LoginModel?> fetchLogin(String username, String password) async {
    var model = {
      "username": username,
      "password": password,
    };

    final response = await dio.post(loginPath, data: model);

    if (response.statusCode == HttpStatus.ok) {
      print(response);
      var data = json.decode(response.data);
      return LoginModel.fromJson(data);
    }
    return null;
  }

  Future<MoviesModel?> fetchMovies(String userID) async {
    final response =
        await dio.get(moviePath, queryParameters: {"user_id": userID});
    print("fetch edildi");

    if (response.statusCode == HttpStatus.ok) {
      var data = json.decode(response.data);
      return MoviesModel.fromJson(data);
    }
    return null;
  }

  Future<SeriesModel?> fetchSeries(String userID) async {
    final response =
        await dio.get(seriePath, queryParameters: {"user_id": userID});
    print("fetch edildi");

    if (response.statusCode == HttpStatus.ok) {
      var data = json.decode(response.data);
      return SeriesModel.fromJson(data);
    }
    return null;
  }

  Future<FavoritesModel?> fetchFavorites(String userID) async {
    final response =
        await dio.get(favoritesPath, queryParameters: {"user_id": userID});
    print("fetch edildi");

    if (response.statusCode == HttpStatus.ok) {
      var data = json.decode(response.data);
      return FavoritesModel.fromJson(data);
    }
    return null;
  }

  Future<WatchListModel?> fetchWatchList(String userID) async {
    final response =
        await dio.get(watchListPath, queryParameters: {"user_id": userID});
    print("fetch edildi");

    if (response.statusCode == HttpStatus.ok) {
      var data = json.decode(response.data);
      return WatchListModel.fromJson(data);
    }
    return null;
  }

  Future<MovieInsertModel?> fetchInsertMovie(
      String movieName,
      String releaseDate,
      String imdbRating,
      String directorName,
      String genre1,
      String genre2,
      String genre3,
      String url) async {
    final response = await dio.post(insertMovie,
        data: Movie(
                movieName: movieName,
                releaseDate: releaseDate,
                imdbRating: imdbRating,
                directorName: directorName,
                genre1: genre1,
                genre2: genre2,
                genre3: genre3,
                url: url)
            .toJson());

    if (response.statusCode == HttpStatus.ok) {
      var data = json.decode(response.data);
      return MovieInsertModel.fromJson(data);
    }
    return null;
  }

  Future<SeriesInsertModel?> fetchInsertSeries(
      String seriesName,
      String releaseDate,
      String imdbRating,
      String directorName,
      String genre1,
      String genre2,
      String genre3,
      String url) async {
    final response = await dio.post(insertSeries,
        data: Serie(
                seriesName: seriesName,
                releaseDate: releaseDate,
                imdbRating: imdbRating,
                directorName: directorName,
                genre1: genre1,
                genre2: genre2,
                genre3: genre3,
                url: url)
            .toJson());

    if (response.statusCode == HttpStatus.ok) {
      var data = json.decode(response.data);
      return SeriesInsertModel.fromJson(data);
    }
    return null;
  }

  Future<ResponseModel?> fetchInsertRequest(
      String user_id, String request_name) async {
    var model = {
      "user_id": user_id,
      "request_name": request_name,
    };

    final response = await dio.post(insertRequestPath, data: model);

    if (response.statusCode == HttpStatus.ok) {
      print(response);
      var data = json.decode(response.data);
      return ResponseModel.fromJson(data);
    }
    return null;
  }

  Future<ResponseModel?> fetchDeleteRequest(String requestName) async {
    var model = {
      "request_name": requestName,
    };

    final response = await dio.post(deleteRequestPath, data: model);

    if (response.statusCode == HttpStatus.ok) {
      print(response);
      var data = json.decode(response.data);
      return ResponseModel.fromJson(data);
    }
    return null;
  }

  Future<RequestsModel?> fetchRequests() async {
    final response = await dio.get(requestPath);

    if (response.statusCode == HttpStatus.ok) {
      var data = json.decode(response.data);
      return RequestsModel.fromJson(data);
    }
    return null;
  }

  Future<GenresModel?> fetchGenres() async {
    final response = await dio.get(genresPath);

    if (response.statusCode == HttpStatus.ok) {
      var data = json.decode(response.data);
      return GenresModel.fromJson(data);
    }
    return null;
  }

  //
  //
  //
  Future<ResponseModel?> addFavoriteMovie(String userId, String movieId) async {
    var model = {
      "user_id": userId,
      "movie_id": movieId,
    };

    final response = await dio.post(addDeleteFavoriteMoviePath, data: model);
    print("add Model: $model");
    if (response.statusCode == HttpStatus.ok) {
      print(response);
      var data = json.decode(response.data);
      return ResponseModel.fromJson(data);
    }
    return null;
  }

  Future<ResponseModel?> deleteFavoriteMovie(
      String userId, String movieId) async {
    var model = {
      "user_id": userId,
      "movie_id": movieId,
    };

    final response = await dio.post(addDeleteFavoriteMoviePath, data: model);
    print("delete Model: $model");

    if (response.statusCode == HttpStatus.ok) {
      print(response);
      var data = json.decode(response.data);
      return ResponseModel.fromJson(data);
    }
    return null;
  }

  Future<ResponseModel?> addFavoriteSerie(String userId, String serieId) async {
    var model = {
      "user_id": userId,
      "serie_id": serieId,
    };

    final response = await dio.post(addDeleteFavoriteSeriePath, data: model);
    print("add Model: $model");
    if (response.statusCode == HttpStatus.ok) {
      print(response);
      var data = json.decode(response.data);
      return ResponseModel.fromJson(data);
    }
    return null;
  }

  Future<ResponseModel?> deleteFavoriteSerie(
      String userId, String serieId) async {
    var model = {
      "user_id": userId,
      "serie_id": serieId,
    };

    final response = await dio.post(addDeleteFavoriteSeriePath, data: model);
    print("delete Model: $model");

    if (response.statusCode == HttpStatus.ok) {
      print(response);
      var data = json.decode(response.data);
      return ResponseModel.fromJson(data);
    }
    return null;
  }

  //
  //
  //
  Future<ResponseModel?> addWatchMovie(String userId, String movieId) async {
    var model = {
      "user_id": userId,
      "movie_id": movieId,
    };

    final response = await dio.post(addDeleteWatchMoviePath, data: model);
    print("add Model: $model");
    if (response.statusCode == HttpStatus.ok) {
      print(response);
      var data = json.decode(response.data);
      return ResponseModel.fromJson(data);
    }
    return null;
  }

  Future<ResponseModel?> deleteWatchMovie(String userId, String movieId) async {
    var model = {
      "user_id": userId,
      "movie_id": movieId,
    };

    final response = await dio.post(addDeleteWatchMoviePath, data: model);
    print("delete Model: $model");

    if (response.statusCode == HttpStatus.ok) {
      print(response);
      var data = json.decode(response.data);
      return ResponseModel.fromJson(data);
    }
    return null;
  }

  Future<ResponseModel?> addWatchSerie(String userId, String serieId) async {
    var model = {
      "user_id": userId,
      "serie_id": serieId,
    };

    final response = await dio.post(addDeleteWatchSeriePath, data: model);
    print("add Model: $model");
    if (response.statusCode == HttpStatus.ok) {
      print(response);
      var data = json.decode(response.data);
      return ResponseModel.fromJson(data);
    }
    return null;
  }

  Future<ResponseModel?> deleteWatchSerie(String userId, String serieId) async {
    var model = {
      "user_id": userId,
      "serie_id": serieId,
    };

    final response = await dio.post(addDeleteWatchSeriePath, data: model);
    print("delete Model: $model");

    if (response.statusCode == HttpStatus.ok) {
      print(response);
      var data = json.decode(response.data);
      return ResponseModel.fromJson(data);
    }
    return null;
  }
}
