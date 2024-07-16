import 'package:frontend_challenge/src/models/releases_move_model.dart';
import 'package:frontend_challenge/src/repositories/interface/get_moves_i.dart';
import 'package:frontend_challenge/src/services/interfaces/http_client_i.dart';

import '../../constant/app_url_contant.dart';
import '../services/clients/http_header_service.dart';

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
      if (response.statusCode == 200) {
        responseModelReleasesMove =
            responseModelReleasesMoveFromMap(response.body);
      }
      return responseModelReleasesMove!;
    } catch (e) {
      return ResponseModelReleasesMove(releases: []);
    }
  }
}
