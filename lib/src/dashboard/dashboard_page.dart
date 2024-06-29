import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:palm_code/resources/constanst/asset_constanst.dart';
import 'package:palm_code/resources/theme.dart';
import 'package:palm_code/src/books/books_store.dart';
import 'package:palm_code/src/books/podo/book_item.dart';
import 'package:palm_code/src/dashboard/dashboard_store.dart';
import 'package:palm_code/src/i18n/localization_store.dart';
import 'package:palm_code/src/widgets/circular_progress_widget.dart';
import 'package:palm_code/src/widgets/image_widget.dart';
import 'package:palm_code/src/widgets/search_field_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late DashboardStore _dashboardStore;
  late LocalizationStore _localizationStore;

  @override
  void initState() {
    _dashboardStore = GetIt.instance.get<DashboardStore>()..init();
    _localizationStore = GetIt.instance.get<LocalizationStore>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Theme.of(context).backgroundApp,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Observer(
          builder: (context) {
            if (_dashboardStore.dashboardState == DashboardState.loading) {
              return _buildLoading();
            }

            return _buildBody();
          },
        ),
      ),
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressWidget());

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Observer(
        builder: (context) {
          if (_dashboardStore.listOfPopularBook.isEmpty &&
              _dashboardStore.listOfBestBook.isEmpty) {
            return Text(
              _localizationStore.appLocalizations.empty_section_label,
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: GestureDetector(
                      onTap: () => _dashboardStore
                          .navigateToBooks(BooksDashboardFilter.search),
                      child: SearchFieldWidget(
                        hintText: _localizationStore
                            .appLocalizations.books_search_hint_label,
                        enabled: false,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildSectionLabel(
                          _localizationStore
                              .appLocalizations.dashboard_popular_book_title,
                        ),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () => _dashboardStore
                            .navigateToBooks(BooksDashboardFilter.popular),
                        child: Text(
                          _localizationStore.appLocalizations
                              .dashboard_popular_book_see_more_label,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          style: Theme.of(context).body5,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Conditional.single(
                    context: context,
                    conditionBuilder: (_) =>
                        _dashboardStore.listOfPopularBook.isNotEmpty,
                    widgetBuilder: (_) => SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: _dashboardStore.listOfPopularBook
                            .take(10)
                            .map(
                              (book) => _buildBookItemCard(book),
                            )
                            .toList(),
                      ),
                    ),
                    fallbackBuilder: (_) => const SizedBox(),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: _buildSectionLabel(
                          _localizationStore
                              .appLocalizations.dashboard_best_book_title,
                        ),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () => _dashboardStore
                            .navigateToBooks(BooksDashboardFilter.best),
                        child: Text(
                          _localizationStore.appLocalizations
                              .dashboard_best_book_see_more_label,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          style: Theme.of(context).body5,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Conditional.single(
                    context: context,
                    conditionBuilder: (_) =>
                        _dashboardStore.listOfBestBook.isNotEmpty,
                    widgetBuilder: (_) => SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: _dashboardStore.listOfBestBook
                            .take(10)
                            .map(
                              (book) => _buildBookItemCard(book),
                            )
                            .toList(),
                      ),
                    ),
                    fallbackBuilder: (_) => const SizedBox(),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildBookItemCard(BookItem book) {
    return GestureDetector(
      onTap: () => _dashboardStore.navigateToBookDetail(book),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).borderBasic,
          ),
          color: Theme.of(context).backgroundLightest,
        ),
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(16),
        width: 137,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: ImageWidget(
                photoUrl: book.formats!.cover ?? "",
                height: 150,
                width: 105,
                placeholderPath: assetIllustrationBookPlaceholder,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              book.authors?.first.name ?? "",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: Theme.of(context).caption1.copyWith(
                    color: Theme.of(context).contentSecondary,
                  ),
            ),
            Text(
              book.title ?? "",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.start,
              style: Theme.of(context).body1.copyWith(
                    color: Theme.of(context).contentInformative,
                  ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSectionLabel(String label) {
    return Text(
      label,
      textAlign: TextAlign.start,
      style: Theme.of(context).display4,
    );
  }
}
