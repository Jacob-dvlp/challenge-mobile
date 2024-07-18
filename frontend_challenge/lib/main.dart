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
  await Hive.openBox(movesTable);

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
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.introColorBackGround,
        scrollbarTheme: const ScrollbarThemeData(),
        textTheme: TextTheme(
            bodyMedium: const TextStyle(color: Colors.white, fontSize: 15),
            titleMedium: TextStyle(color: AppColors.colorWhite),
            titleLarge: TextStyle(
              color: AppColors.colorWhite,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            )),
        appBarTheme: AppBarTheme(color: AppColors.introColorBackGround),
        iconTheme: const IconThemeData(
          color: Color(0xFFF44336),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                WidgetStatePropertyAll(AppColors.introColorBackGround),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
    );
  }
}
