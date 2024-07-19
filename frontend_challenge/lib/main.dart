import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_challenge/presentation/intro_page/intro_page.dart';
import 'package:frontend_challenge/src/repositories/imports.dart';
import 'package:frontend_challenge/utils/colors/app_colors.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'constant/app_url_contant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox(favoriteTable);

  runApp(
    const ProviderScope(
      child: AppWidget(),
    ),
  );
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: AppColors.themeData,
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
    );
  }
}
