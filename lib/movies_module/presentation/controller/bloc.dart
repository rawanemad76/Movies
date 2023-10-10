import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_tv_app/core/utils/enum.dart';
import 'package:movies_tv_app/movies_module/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movies_tv_app/movies_module/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movies_tv_app/movies_module/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:movies_tv_app/movies_module/presentation/controller/events.dart';
import 'package:movies_tv_app/movies_module/presentation/controller/states.dart';

class MoviesBloc extends Bloc<MoviesEvent,MoviesStates>{
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;


  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase, this.getTopRatedMoviesUseCase): super( const MoviesStates()){
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase.execute();
       result.fold((l) {
         emit(
           state.copyWith(
             nowPlayingState: RequestState.error,
             nowPlayingMessage: l.message,

           ),
         );
       }, (r) {
         emit(
           state.copyWith(
             nowPlayingState: RequestState.loaded,
             nowPlayingMovies: r,

           ),
         );

       });

    });
    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUseCase.execute();
       result.fold((l) {
         emit(
          state.copyWith(
             popularState: RequestState.error,
             popularMessage: l.message,

           ),
         );
       }, (r) {
         emit(
           state.copyWith(
            popularState: RequestState.loaded,
            popularMovies: r,

           ),
         );

       });

    });
    on<GetTopRatedMoviesEvent>((event, emit) async {
      final result = await getTopRatedMoviesUseCase.execute();
       result.fold((l) {
         emit(
           state.copyWith(
             topRatedState: RequestState.error,
             topRatedMessage: l.message,

           ),
         );
       }, (r) {
         emit(
           state.copyWith(
             topRatedState: RequestState.loaded,
             topRatedMovies: r,

           ),
         );

       });

    });

  }

}