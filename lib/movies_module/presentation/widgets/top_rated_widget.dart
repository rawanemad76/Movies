import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_tv_app/core/utils/enum.dart';
import 'package:movies_tv_app/movies_module/presentation/controller/bloc.dart';
import 'package:movies_tv_app/movies_module/presentation/controller/states.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/utils/app_constants.dart';

class TopRatedWidget extends StatelessWidget {
  const TopRatedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesStates>(
      builder: (context, state) {
        switch(state.topRatedState){
          case RequestState.loading:
            return const SizedBox(
              child: Center(
                child:  CircularProgressIndicator(),
              ),
            );
          case RequestState.loaded:
            return SizedBox(
              height: 170.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: state.topRatedMovies.length,
                itemBuilder: (context, index) {
                  final movie = state.topRatedMovies[index];
                  return Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () {
                        /// TODO : NAVIGATE TO  MOVIE DETAILS
                      },
                      child: ClipRRect(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(8.0)),
                        child: CachedNetworkImage(
                          width: 120.0,
                          fit: BoxFit.cover,
                          imageUrl: AppConstants.imageUrl(movie.backdropPath),
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[850]!,
                            highlightColor: Colors.grey[800]!,
                            child: Container(
                              height: 170.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                },
              ),

            );
          case RequestState.error:
            return SizedBox(
              child: Center(child: Text(state.topRatedMessage)),
            );
        }
      },
    );
  }
}
