import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_challenge/presentation/tabs/state/state_home.dart';
import 'package:frontend_challenge/utils/colors/app_colors.dart';

import 'home/home_page.dart';
import 'widget/custom_menu_widget.dart';

class HomeTab extends ConsumerWidget {
  const HomeTab({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.introColorBackGround,
      body: PageView(
        pageSnapping: true,
        controller: pageController,
        onPageChanged: (index) {
          ref.watch(indexPage.notifier).state = index;
        },
        children: const [
          HomePage(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        decoration: BoxDecoration(
            color: AppColors.introColorBackGround,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            boxShadow: Theme.of(context).colorScheme.surface == Colors.white
                ? [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.3),
                      blurRadius: 2,
                      offset: const Offset(0.0, -1.0),
                    )
                  ]
                : null),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomBtnItemMenu(
              icon: CupertinoIcons.play,
              title: "Home",
              isEnable: true,
              onTap: () {
                ref.watch(indexPage.notifier).state = 0;
              },
            ),
            CustomBtnItemMenu(
              icon: CupertinoIcons.search_circle,
              title: "Buscar",
              onTap: () {
                ref.watch(indexPage.notifier).update(
                      (state) => 1,
                    );
              },
            ),
            CustomBtnItemMenu(
              icon: Icons.favorite_outline,
              title: "Favoritos",
              onTap: () {
                ref.watch(indexPage.notifier).update(
                      (state) => 2,
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
