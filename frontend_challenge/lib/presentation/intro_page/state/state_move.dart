import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_challenge/routes/app_routes.dart';

import '../../tabs/home_tab.dart';

final go = ProviderFamily((ref, BuildContext context) async {
  return await Future.delayed(
    const Duration(seconds: 5),
    () => AppRoutes.pageWithoutReturn(
      context,
      page: const HomeTab(),
    ),
  );
});
