import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:frontend_challenge/presentation/tabs/home/details/details_page.dart';
import 'package:frontend_challenge/providers/imports.dart';
import 'package:frontend_challenge/routes/app_routes.dart';
import 'package:frontend_challenge/src/repositories/imports.dart';
import 'package:frontend_challenge/utils/colors/app_colors.dart';
import 'package:frontend_challenge/utils/size_device_utils.dart';

import '../widget/custom_shimmer_widget.dart';
import 'state_search/state_search.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(stateData.state).state.results!;
    bool isSearch = ref.read(isSearching.state).state;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Buscar Filme',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey[500],
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        autofocus: true,
                        decoration: InputDecoration.collapsed(
                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: "Buscar um filme",
                          hintStyle: TextStyle(
                            color: Colors.grey[500],
                          ),
                          hoverColor: Colors.transparent,
                        ),
                        onChanged: (value) async {
                          if (value.isNotEmpty) {
                            isSearch = ref.read(isSearching.state).state = true;
                          }
                          if (value.isEmpty) {
                            isSearch =
                                ref.read(isSearching.state).state = false;
                          }
                          final data = ref.read(stateData.state).state =
                              await ref.read(search.call(value).future);
                          if (data.results!.isNotEmpty) {
                            isSearch =
                                ref.read(isSearching.state).state = false;
                          }
                        },
                        onFieldSubmitted: (value) async {
                          if (value.isNotEmpty) {
                            isSearch =
                                ref.read(isSearching.state).state = false;
                          }
                          final resultDataSearching =
                              await ref.read(search.call(value).future);

                          final data = ref.read(stateData.state).state =
                              resultDataSearching;
                          if (data.results!.isNotEmpty) {
                            isSearch =
                                ref.read(isSearching.state).state = false;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (data.isNotEmpty)
              const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text("Histórico de busca:"),
              ),
            SizedBox(
              height: context.sizedDevice.height / 1.5,
              child: isSearch
                  ? const CustomShimmerWidget()
                  : data.isEmpty
                      ? const Center(
                          child: Text("Lista vazia"),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final searchData = data[index];
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: GestureDetector(
                                onTap: () => AppRoutes.page(
                                  context,
                                  page: DetailsPage(
                                      releaseMove: ReleaseMove(
                                    id: searchData.id,
                                    title: searchData.name,
                                    posterUrl: searchData.imageUrl,
                                  )),
                                ),
                                child: Container(
                                    width: 200,
                                    decoration: BoxDecoration(
                                        color: AppColors.colorWhite,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CachedNetworkImage(
                                                  imageUrl: searchData.imageUrl,
                                                  height: 100,
                                                  placeholder: (context, url) =>
                                                      const Center(
                                                    child:
                                                        CircularProgressIndicator
                                                            .adaptive(),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Flexible(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        searchData.name,
                                                        overflow:
                                                            TextOverflow.clip,
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        "Ano: ${searchData.year.toString()}",
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        "Gerero: ${searchData.tmdbType}",
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        "Avaliações: ${searchData.relevance}",
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.black),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons.favorite))
                                        ],
                                      ),
                                    )),
                              ),
                            );
                          },
                        ),
            )
          ],
        ),
      ),
    );
  }
}
