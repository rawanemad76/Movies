class AppConstants{
  static const baseUrl = "https://api.themoviedb.org/3/movie";
  static const apiKey = "0e149f33cd6b451e4abe61362aac2a53";

  static  const getNowPlayingMoviesUrl ="$baseUrl/now_playing?api_key=$apiKey";
  static  const getPopularMoviesUrl ="$baseUrl/popular?api_key=$apiKey";
  static  const getTopRatedMoviesUrl ="$baseUrl/top_rated?api_key=$apiKey";

  static const String baseImageUrl ="https://image.tmdb.org/t/p/w500";

  static String imageUrl(String path)=> "$baseImageUrl$path";

}