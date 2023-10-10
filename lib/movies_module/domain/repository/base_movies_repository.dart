import 'package:dartz/dartz.dart';
import 'package:movies_tv_app/core/error/failure.dart';
import '../../data/model/movies_model.dart';

abstract class BaseMoviesRepository{
  Future<Either<Failure, List<MoviesModel>>> getNowPlayingMovies();
  Future<Either<Failure, List<MoviesModel>>>getPopularMovies();
  Future<Either<Failure, List<MoviesModel>>> getTopRatedMovies();
}