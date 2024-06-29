import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:palm_code/resources/constanst/asset_constanst.dart';
import 'package:palm_code/resources/theme.dart';
import 'package:palm_code/src/books/books_store.dart';
import 'package:palm_code/src/widgets/app_bar_widget.dart';
import 'package:palm_code/src/widgets/circular_progress_widget.dart';
import 'package:palm_code/src/widgets/image_widget.dart';
import 'package:palm_code/src/widgets/search_field_widget.dart';

class BooksPage extends StatefulWidget {
  final BooksDashboardFilter? booksDashboardFilter;
  const BooksPage({super.key, this.booksDashboardFilter});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  late BooksStore _booksStore;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchTextController = TextEditingController();
  final FocusNode _focus = FocusNode();
  late final FocusScopeNode _currentFocus = FocusScope.of(context);

  @override
  void initState() {
    _booksStore = GetIt.instance.get<BooksStore>();
    _scrollController.addListener(_scrollListener);
    _focus.addListener(_onFocusChange);

    checkBooksPageFilter();
    super.initState();
  }

  /// ADDING THE SCROLL LISTINER
  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent -
                (MediaQuery.of(context).size.height - (1 / 4)) &&
        !_scrollController.position.outOfRange) {
      _booksStore.checkMoreBooks();
    }
  }

  void checkBooksPageFilter() {
    switch (widget.booksDashboardFilter) {
      case BooksDashboardFilter.popular:
        _booksStore.filterBooks();
      case BooksDashboardFilter.best:
        _booksStore.filterBooks(topic: "best book");
      case BooksDashboardFilter.search:
        _focus.requestFocus();
      default:
    }
  }

  Future _onFocusChange() async {
    if (_focus.hasFocus) {
      _booksStore.focusOnnSearchBook = true;
    } else {
      await Future.delayed(const Duration(milliseconds: 500), () {
        if (!_focus.hasFocus) {
          _booksStore.focusOnnSearchBook = false;
        }
      });
    }
  }

  @override
  void dispose() {
    _focus.removeListener(_onFocusChange);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        if (!_currentFocus.hasPrimaryFocus) {
          _currentFocus.focusedChild?.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundLightest,
        appBar: AppBarWidget(
          showDivider: false,
          customTitleWidget: SizedBox(
            height: 45,
            width: 360,
            child: SearchFieldWidget(
              controller: _searchTextController,
              focus: _focus,
              hintText: "Search for Books",
              enabled: true,
              onEditingComplete: () {
                if (_focus.hasFocus) {
                  _focus.unfocus();
                }
                if (_searchTextController.text != "") {
                  _booksStore.filterBooks(keywords: _searchTextController.text);
                }
              },
            ),
          ),
        ),
        body: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Observer(
              builder: (context) {
                if (_booksStore.focusOnnSearchBook) {
                  return Container();
                } else if (_booksStore.booksState == BooksState.loading) {
                  return _buildLoading();
                }

                return _buildBody();
              },
            ),
          ),
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
          if (_booksStore.listOfBook.isEmpty) {
            return const Text("empty");
          } else {
            return Column(
              children: [
                const SizedBox(height: 16),
                Expanded(
                  child: Observer(
                    builder: (context) {
                      return GridView.builder(
                        controller: _scrollController,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16.0,
                          crossAxisSpacing: 8.0,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: _booksStore.loadMoreBook &&
                                _booksStore.nextBooksPage == ""
                            ? _booksStore.listOfBook.length
                            : _booksStore.listOfBook.length + 4,
                        itemBuilder: (context, index) {
                          if (index < _booksStore.listOfBook.length) {
                            final book = _booksStore.listOfBook[index];
                            if (book.formats?.cover != null ||
                                book.formats?.cover != "") {
                              return GestureDetector(
                                onTap: () =>
                                    _booksStore.navigateToBookDetail(book),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: Theme.of(context).borderBasic,
                                    ),
                                    color: Theme.of(context).backgroundLightest,
                                  ),
                                  padding: const EdgeInsets.all(16),
                                  width: 137,
                                  child: Column(
                                    children: [
                                      Center(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: ImageWidget(
                                            photoUrl: book.formats!.cover ?? "",
                                            height: 150,
                                            width: 105,
                                            placeholderPath:
                                                assetIllustrationBookPlaceholder,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        book.authors?.first.name ?? "",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style:
                                            Theme.of(context).caption1.copyWith(
                                                  color: Theme.of(context)
                                                      .contentSecondary,
                                                ),
                                      ),
                                      Text(
                                        book.title ?? "",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context).body1.copyWith(
                                              color: Theme.of(context)
                                                  .contentInformative,
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
