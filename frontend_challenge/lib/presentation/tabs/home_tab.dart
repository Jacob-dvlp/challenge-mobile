import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_challenge/presentation/tabs/favorites/favorite_page.dart';
import 'package:frontend_challenge/presentation/tabs/search/search_page.dart';
import 'package:frontend_challenge/utils/colors/app_colors.dart';

import 'home/home_page.dart';
import 'widget/custom_menu_widget.dart';

PageController pageController = PageController();

final indexPage = StateProvider<int>((ref) => 0);

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Scaffold(
        backgroundColor: AppColors.introColorBackGround,
        body: Consumer(builder: (context, ref, child) {
          var page = ref.watch(indexPage.notifier).state;
          return PageView(
            pageSnapping: true,
            controller: pageController,
            onPageChanged: (index) {
              index = page;
            },
            children: [
              if (page == 0) const HomePage(),
              if (page == 1) const SearchPage(),
              if (page == 2) const FavoritePage()
            ],
          );
        }),
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
                icon: CupertinoIcons.play_fill,
                title: "Home",
                isEnable: true,
                onTap: () {
                  ref.watch(indexPage.state).state = 0;
                },
              ),
              CustomBtnItemMenu(
                icon: CupertinoIcons.search_circle_fill,
                title: "Buscar",
                onTap: () {
                  ref.watch(indexPage.state).state = 1;
                },
              ),
              CustomBtnItemMenu(
                icon: Icons.favorite,
                title: "Favoritos",
                onTap: () {
                  ref.watch(indexPage.state).state = 2;
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
