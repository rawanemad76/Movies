
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_tv_app/movies_module/presentation/controller/bloc.dart';
import 'package:movies_tv_app/movies_module/presentation/controller/events.dart';
import 'package:movies_tv_app/movies_module/presentation/widgets/now_playing_widget.dart';
import 'package:movies_tv_app/movies_module/presentation/widgets/popular_widget.dart';
import 'package:movies_tv_app/movies_module/presentation/widgets/see_more.dart';
import 'package:movies_tv_app/movies_module/presentation/widgets/top_rated_widget.dart';

import '../../../core/services/services_locator.dart';



class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>sl<MoviesBloc>()..add(GetNowPlayingMoviesEvent())..add(GetPopularMoviesEvent())..add(GetTopRatedMoviesEvent()),
      child: Scaffold(
        backgroundColor: Colors.black38,
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingWidget(),
              SeeMore(text: "Popular"),
              const PopularWidget(),
              SeeMore(text: "Top Rated"),
              const TopRatedWidget(),

            ],
          ),
        ),
      ),
    );
  }
}
