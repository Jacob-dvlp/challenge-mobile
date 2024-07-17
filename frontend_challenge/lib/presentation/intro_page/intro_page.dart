import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_challenge/constant/app_url_contant.dart';
import 'package:frontend_challenge/utils/colors/app_colors.dart';

import 'state/state_move.dart';

class IntroPage extends ConsumerWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(go.call(context));
    return Scaffold(
      backgroundColor: AppColors.introColorBackGround,
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              child: Image.asset(
                introImagBackGround,
                width: 200,
              ),
            ),
          ),
          const Positioned(
            bottom: 80,
            right: 50,
            left: 50,
            child: Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.red,
                valueColor: AlwaysStoppedAnimation(
                  Color(0xFFFDFDFD),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
