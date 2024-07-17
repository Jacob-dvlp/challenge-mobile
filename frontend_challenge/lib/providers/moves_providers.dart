import 'imports.dart';

final httpClient = Provider<HttpClientI>(
  (ref) {
    return ClientHttpService();
  },
);

final getMoves = Provider<GetMovesI>(
  (ref) {
    final client = ref.read(httpClient);

    return GetMovesRepository(httpClientI: client);
  },
);

final searchMove = Provider(
  (ref) {
    final client = ref.read(httpClient);

    return SearchMovesRepository(httpClientI: client);
  },
);

final getDetails = Provider<GetDetailsMoveI>(
  (
    ref,
  ) {
    final client = ref.read(httpClient);

    return GetDetailsMoveRepository(httpClientI: client);
  },
);
