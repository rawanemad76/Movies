
import 'package:get_it/get_it.dart';
import 'package:movies_tv_app/movies_module/data/data_source/moives_remote_data_source.dart';
import 'package:movies_tv_app/movies_module/data/repository/movies_repository.dart';
import 'package:movies_tv_app/movies_module/domain/repository/base_movies_repository.dart';
import 'package:movies_tv_app/movies_module/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movies_tv_app/movies_module/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movies_tv_app/movies_module/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:movies_tv_app/movies_module/presentation/controller/bloc.dart';

final GetIt sl = GetIt.instance;
class ServicesLocator
{
 void setUp(){
   //dataSource
   sl.registerLazySingleton<BaseMoviesRemoteDataSource>(() => MoviesRemoteDataSource());
   //repository
   sl.registerLazySingleton<BaseMoviesRepository>(() =>MoviesRepository(sl()));
   //useCase
   sl.registerLazySingleton(()=>GetNowPlayingMoviesUseCase(sl()));
   sl.registerLazySingleton(()=>GetPopularMoviesUseCase(sl()));
   sl.registerLazySingleton(()=>GetTopRatedMoviesUseCase(sl()));
   // bloc
   sl.registerFactory(() => MoviesBloc(sl(),sl(),sl(),));

 }
}