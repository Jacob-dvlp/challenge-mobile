import '../../models/search_move_model.dart';

abstract interface class SearchMoveI {
  Future<ResponseModelSearch> searchMoves({required String title});
}
