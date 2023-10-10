import 'package:dartz/dartz.dart';
import 'package:movies_tv_app/core/error/failure.dart';
import 'package:movies_tv_app/movies_module/domain/repository/base_movies_repository.dart';
import '../../data/model/movies_model.dart';

class GetTopRatedMoviesUseCase{
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase(this.baseMoviesRepository);
  Future<Either<Failure, List<MoviesModel>>> execute() async{
    return await baseMoviesRepository.getTopRatedMovies();
  }
}