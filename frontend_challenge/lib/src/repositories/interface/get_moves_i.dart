import '../../models/releases_move_model.dart';

abstract interface class GetMovesI {
  Future<ResponseModelReleasesMove> getReleasesMove();
}
