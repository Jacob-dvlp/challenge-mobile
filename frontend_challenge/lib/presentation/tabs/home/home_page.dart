import 'package:flutter/material.dart';
import 'package:frontend_challenge/presentation/tabs/home/state_home/state_home.dart';
import 'package:frontend_challenge/presentation/tabs/widget/custom_shimmer_widget.dart';

import '../../../providers/imports.dart';
import '../widget/custom_card_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(stateHome);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Filmes",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          automaticallyImplyLeading: false,
        ),
        body: state.when(
          data: (data) {
            return SizedBox(
              child: GridView.builder(
                itemCount: data.releases!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  mainAxisExtent: 250,
                ),
                itemBuilder: (context, index) {
                  final releaseMove = data.releases![index];
                  return CustomCardWidget(
                    releaseMove: releaseMove,
                  );
                },
              ),
            );
          },
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
          loading: () => const CustomShimmerWidget(),
        ));
  }
}
