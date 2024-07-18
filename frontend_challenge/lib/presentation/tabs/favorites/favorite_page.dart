import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend_challenge/presentation/tabs/widget/custom_card_widget.dart';

import '../../../providers/imports.dart';
import '../../../src/models/local_storage_data_model.dart';
import '../../../src/repositories/imports.dart';
import '../state/state_controller.dart';

class FavoritePage extends ConsumerWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localStorage = ref.watch(getDataLocalStorage);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favoritos",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: localStorage.value!,
        builder: (context, box, child) {
          final localStorage = box.values.map((e) {
            return LocalStorageDataMoveModel.fromJson(
              json.encode(e),
            );
          }).toList();

          return localStorage.isNotEmpty
              ? SizedBox(
                  child: GridView.builder(
                    itemCount: localStorage.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 2,
                      mainAxisExtent: 250,
                    ),
                    itemBuilder: (context, index) {
                      final favorites = localStorage[index];
                      final id = int.parse(favorites!.id);
                      return CustomCardWidget(
                        releaseMove: ReleaseMove(
                          id: id,
                          title: favorites.title,
                          posterUrl: favorites.urlImg,
                        ),
                      );
                    },
                  ),
                )
              : const Center(
                  child: Text("Nenhum filme na Lista de favoritos"),
                );
        },
      ),
    );
  }
}
