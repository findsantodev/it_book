import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:palm_code/resources/constanst/asset_constanst.dart';
import 'package:palm_code/resources/theme.dart';
import 'package:palm_code/src/books/books_store.dart';
import 'package:palm_code/src/widgets/app_bar_widget.dart';
import 'package:palm_code/src/widgets/circular_progress_widget.dart';
import 'package:palm_code/src/widgets/image_widget.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  late BooksStore _booksStore;

  @override
  void initState() {
    _booksStore = GetIt.instance.get<BooksStore>()..fetchBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        showDivider: false,
        title: "Books",
        customLeading: true,
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
              color: Theme.of(context).buttonPrimary,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Observer(
            builder: (context) {
              if (_booksStore.booksState == BooksState.loading) {
                return _buildLoading();
              }

              return _buildBody();
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: appTheme.buttonPrimary,
        tooltip: 'Find',
        onPressed: () {},
        child: const Icon(Icons.find_in_page, color: Colors.white, size: 28),
      ),
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressWidget());

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Observer(
        builder: (context) {
          if (_booksStore.listOfBooks == null ||
              (_booksStore.listOfBooks?.isEmpty ?? false)) {
            return const Text("empty");
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.7,
              ),
              itemCount: _booksStore.listOfBooks?.length,
              itemBuilder: (context, index) {
                final book = _booksStore.listOfBooks![index];
                if (book.formats?.cover != null || book.formats?.cover != "") {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: ImageWidget(
                      photoUrl: book.formats!.cover!,
                      placeholderPath: assetIllustrationBookPlaceholder,
                    ),
                  );
                }
                return Text(book.id.toString());
              },
            );
          }
        },
      ),
    );
  }
}
