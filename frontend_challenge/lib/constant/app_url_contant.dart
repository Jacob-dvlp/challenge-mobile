import 'key/api_key.dart';

class AppUrlContant {
  static String baseUrl = "https://api.watchmode.com/v1";

  static String releaseMoves = "/releases/?apiKey=$apiKey";

  static String searchMoves =
      "/autocomplete-search/?apiKey=$apiKey&search_value=";

  static String details({required String id}) {
    String url = "/title/$id/details/?apiKey=$apiKey";
    return url;
  }
}

const String introImagBackGround = "assets/img/marvel_Logo.png";

const favoriteTable = "favorite";
const movesTable = "moves";
