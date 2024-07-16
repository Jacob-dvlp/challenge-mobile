import 'imports.dart';

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
      if (response.statusCode == HttpStatus.ok) {
        responseModelSearch = responseModelSearchFromMap(
          response.body,
        );
      }
      return responseModelSearch!;
    } catch (e) {
      return ResponseModelSearch(
        results: [],
      );
    }
  }
}
