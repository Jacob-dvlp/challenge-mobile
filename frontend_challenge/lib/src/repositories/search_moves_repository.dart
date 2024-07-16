import 'package:frontend_challenge/constant/app_url_contant.dart';

import '../models/search_move_model.dart';
import '../services/clients/http_header_service.dart';
import '../services/interfaces/http_client_i.dart';
import 'interface/search_move_i.dart';

class SearchMovesRepository implements SearchMoveI {
  final HttpClientI httpClientI;
  ResponseModelSearch? responseModelSearch;

  SearchMovesRepository({required this.httpClientI});

  @override
  Future<ResponseModelSearch> searchMoves({required String title}) async {
    try {
      final response = await httpClientI.get(
        route: "${AppUrlContant.searchMoves}$title",
        headers: HttpHeaderService.headers(),
      );
      if (response.statusCode == 200) {
        responseModelSearch = responseModelSearchFromMap(response.body);
      }
      return responseModelSearch!;
    } catch (e) {
      return ResponseModelSearch(
        results: [],
      );
    }
  }
}
