import 'package:frontend_challenge/providers/app_providers.dart';
import 'package:frontend_challenge/providers/imports.dart';

bool isFullScreen = false;

final stateHome = FutureProvider(
  dependencies: [getMoves],
  (ref) {
    return ref.watch(getMoves).getReleasesMove();
  },
);


