import 'package:dio/dio.dart';
import 'package:movies_tv_app/core/error/exception.dart';
import 'package:movies_tv_app/core/network/error_message_model.dart';
import 'package:movies_tv_app/core/utils/app_constants.dart';
import 'package:movies_tv_app/movies_module/data/model/movies_model.dart';


abstract class BaseMoviesRemoteDataSource{
  Future<List<MoviesModel>> getNowPlayingMovies();
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();
}

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource{
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final result = await Dio().get(AppConstants.getNowPlayingMoviesUrl);
    if (result.statusCode == 200) {
      return List<MoviesModel>.from(
        (result.data["results"] as List).map(
          (element) => MoviesModel.fromJson(element),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(result.data),
      );
    }
  }
  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final result = await Dio().get(AppConstants.getPopularMoviesUrl);
    if (result.statusCode == 200) {
      return List<MoviesModel>.from(
        (result.data["results"] as List).map(
          (element) => MoviesModel.fromJson(element),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(result.data),
      );
    }
  }
  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    final result = await Dio().get(AppConstants.getTopRatedMoviesUrl);
    if (result.statusCode == 200) {
      return List<MoviesModel>.from(
        (result.data["results"] as List).map(
          (element) => MoviesModel.fromJson(element),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(result.data),
      );
    }
  }
}
