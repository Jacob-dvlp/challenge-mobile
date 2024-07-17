import 'imports.dart';

class GetMovesRepository implements GetMovesI {
  final HttpClientI httpClientI;
  ResponseModelReleasesMove? responseModelReleasesMove;

  GetMovesRepository({required this.httpClientI});

  @override
  Future<ResponseModelReleasesMove> getReleasesMove() async {
    try {
      final response = await httpClientI.get(
        route: AppUrlContant.releaseMoves,
        headers: HttpHeaderService.headers(),
      );

      if (response.statusCode == HttpStatus.ok) {
        responseModelReleasesMove = responseModelReleasesMoveFromMap(
          response.body,
        );

        print(responseModelReleasesMove!.releases!.length);
      }
      return responseModelReleasesMove!;
    } catch (e) {
      return ResponseModelReleasesMove(
        releases: [],
      );
    }
  }
}
