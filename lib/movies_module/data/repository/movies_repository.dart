import 'package:dartz/dartz.dart';
import 'package:movies_tv_app/core/error/exception.dart';
import 'package:movies_tv_app/core/error/failure.dart';
import 'package:movies_tv_app/movies_module/data/data_source/moives_remote_data_source.dart';
import 'package:movies_tv_app/movies_module/data/model/movies_model.dart';
import 'package:movies_tv_app/movies_module/domain/repository/base_movies_repository.dart';

class MoviesRepository extends BaseMoviesRepository{
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;

  MoviesRepository(this.baseMoviesRemoteDataSource);
  
  
  @override
  Future<Either<Failure, List<MoviesModel>>> getNowPlayingMovies() async{
    final result =  await baseMoviesRemoteDataSource.getNowPlayingMovies();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MoviesModel>>> getPopularMovies() async{
    final result = await baseMoviesRemoteDataSource.getPopularMovies();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage),);
    }
  }

  @override
  Future<Either<Failure, List<MoviesModel>>> getTopRatedMovies() async{
    final result = await baseMoviesRemoteDataSource.getTopRatedMovies();
    try{
      return Right(result);
    }on ServerException catch(failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage),);
    }
  }

}