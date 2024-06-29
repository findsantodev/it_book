import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:palm_code/resources/constanst/asset_constanst.dart';
import 'package:palm_code/resources/theme.dart';
import 'package:palm_code/src/favorite/favorite_store.dart';
import 'package:palm_code/src/i18n/localization_store.dart';
import 'package:palm_code/src/widgets/circular_progress_widget.dart';
import 'package:palm_code/src/widgets/image_widget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late FavoriteStore _favoriteStore;
  late LocalizationStore _localizationStore;

  @override
  void initState() {
    _favoriteStore = GetIt.instance.get<FavoriteStore>()..init();
    _localizationStore = GetIt.instance.get<LocalizationStore>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Observer(
          builder: (context) {
            if (_favoriteStore.favoriteState == FavoriteState.loading) {
              return _buildLoading();
            } else if (_favoriteStore.favoriteErrorMessage != "") {
              return _buildError();
            }

            return _buildBody();
          },
        ),
      ),
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressWidget());

  Widget _buildError() =>
      Center(child: Text(_favoriteStore.favoriteErrorMessage));

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Observer(
        builder: (context) {
          if (_favoriteStore.listOfFavoriteBook.isEmpty) {
            return Text(
              _localizationStore.appLocalizations.empty_section_label,
            );
          } else {
            return Column(
              children: [
                Expanded(
                  child: Observer(
                    builder: (context) {
                      return ListView.separated(
                        itemCount: _favoriteStore.listOfFavoriteBook.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 12);
                        },
                        itemBuilder: (context, index) {
                          if (index <
                              _favoriteStore.listOfFavoriteBook.length) {
                            final book =
                                _favoriteStore.listOfFavoriteBook[index];
                            if (book.formats?.cover != null ||
                                book.formats?.cover != "") {
                              return GestureDetector(
                                onTap: () =>
                                    _favoriteStore.navigateToBookDetail(book),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: Theme.of(context).borderBasic,
                                    ),
                                    color: Theme.of(context).backgroundLightest,
                                  ),
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: ImageWidget(
                                          photoUrl: book.formats!.cover ?? "",
                                          height: 105,
                                          width: 73.5,
                                          placeholderPath:
                                              assetIllustrationBookPlaceholder,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              book.title ?? "",
                                              style: Theme.of(context).body1,
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              book.bookshelves?.join(', ') ??
                                                  "",
                                              style: Theme.of(context)
                                                  .body5
                                                  .copyWith(
                                                    color: Theme.of(context)
                                                        .contentSecondary,
                                                  ),
                                            ),
                                            const SizedBox(height: 8),
                                            Row(
                                              children: [
                                                const Icon(Icons.download),
                                                const SizedBox(width: 4),
                                                Text(
                                                  book.downloadCount.toString(),
                                                  style: Theme.of(context)
                                                      .body5
                                                      .copyWith(
                                                        color: Theme.of(context)
                                                            .contentSecondary,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }
                            return Text(book.id.toString());
                          } else {
                            return const CircularProgressWidget();
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
