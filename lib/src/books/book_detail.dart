import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:palm_code/resources/constanst/asset_constanst.dart';
import 'package:palm_code/resources/theme.dart';
import 'package:palm_code/src/books/podo/book_item.dart';
import 'package:palm_code/src/favorite/favorite_store.dart';
import 'package:palm_code/src/widgets/app_bar_widget.dart';
import 'package:palm_code/src/widgets/image_widget.dart';
import 'package:palm_code/src/widgets/primary_button.dart';

class BookDetail extends StatefulWidget {
  final BookItem? _bookItem;
  const BookDetail({super.key, BookItem? bookItem}) : _bookItem = bookItem;

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  late FavoriteStore _favoriteStore;

  @override
  void initState() {
    _favoriteStore = GetIt.instance.get<FavoriteStore>()
      ..fetchFavoriteBooksFromLocal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: widget._bookItem?.title,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _imageSection(),
                    _dividerSection(),
                    _titleSection(),
                    _informationSection(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            _dividerSection(),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PrimaryButton(
                    text: "Baca",
                    onPressed: () => _favoriteStore.navigateToWebPage(
                      widget._bookItem?.formats?.textHTML ?? "",
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _informationSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionLabel("Informasi Buku"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Conditional.single(
                context: context,
                conditionBuilder: (_) =>
                    widget._bookItem?.authors?.isNotEmpty ?? false,
                widgetBuilder: (_) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    _buildInforamtionTitle("PENULIS"),
                    _buildInformationDescription(
                      widget._bookItem?.authors?.first.name ?? "",
                    ),
                  ],
                ),
                fallbackBuilder: (_) => const SizedBox(),
              ),
              Conditional.single(
                context: context,
                conditionBuilder: (_) =>
                    widget._bookItem?.translators?.isNotEmpty ?? false,
                widgetBuilder: (_) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    _buildInforamtionTitle("PENULIS"),
                    _buildInformationDescription(
                      widget._bookItem?.translators?.first.name ?? "",
                    ),
                  ],
                ),
                fallbackBuilder: (_) => const SizedBox(),
              ),
              Conditional.single(
                context: context,
                conditionBuilder: (_) =>
                    widget._bookItem?.bookshelves?.isNotEmpty ?? false,
                widgetBuilder: (_) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    _buildInforamtionTitle("CATEGORY"),
                    _buildInformationDescription(
                      widget._bookItem?.bookshelves?.join(', ') ?? "",
                    ),
                  ],
                ),
                fallbackBuilder: (_) => const SizedBox(),
              ),
              Conditional.single(
                context: context,
                conditionBuilder: (_) =>
                    widget._bookItem?.subjects?.isNotEmpty ?? false,
                widgetBuilder: (_) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    _buildInforamtionTitle("TOPIC"),
                    _buildInformationDescription(
                      widget._bookItem?.subjects?.join(', ') ?? "",
                    ),
                  ],
                ),
                fallbackBuilder: (_) => const SizedBox(),
              ),
              Conditional.single(
                context: context,
                conditionBuilder: (_) =>
                    widget._bookItem?.subjects?.isNotEmpty ?? false,
                widgetBuilder: (_) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    _buildInforamtionTitle("BAHASA"),
                    _buildInformationDescription(
                      widget._bookItem?.languages?.join(', ') ?? "",
                    ),
                  ],
                ),
                fallbackBuilder: (_) => const SizedBox(),
              ),
              Conditional.single(
                context: context,
                conditionBuilder: (_) => widget._bookItem?.copyright != null,
                widgetBuilder: (_) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    _buildInforamtionTitle("COPYRIGHT"),
                    _buildInformationDescription(
                      widget._bookItem?.copyright ?? false
                          ? "Dilindungi"
                          : "Bebas",
                    ),
                  ],
                ),
                fallbackBuilder: (_) => const SizedBox(),
              ),
              Conditional.single(
                context: context,
                conditionBuilder: (_) =>
                    widget._bookItem?.downloadCount != null,
                widgetBuilder: (_) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    _buildInforamtionTitle("DIUNDUH"),
                    Row(
                      children: [
                        Icon(
                          Icons.download,
                          color: Theme.of(context).contentPrimary,
                        ),
                        const SizedBox(width: 4),
                        _buildInformationDescription(
                          widget._bookItem?.downloadCount.toString() ?? "",
                        ),
                      ],
                    ),
                  ],
                ),
                fallbackBuilder: (_) => const SizedBox(),
              ),
            ],
          ),
        ],
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

  Widget _buildInforamtionTitle(String title) {
    return Text(
      title,
      textAlign: TextAlign.start,
      style: Theme.of(context).heading4.copyWith(
            color: Theme.of(context).contentTertiary,
          ),
    );
  }

  Widget _buildInformationDescription(String description) {
    return Text(
      description,
      textAlign: TextAlign.start,
      style: Theme.of(context).body3,
    );
  }

  Widget _imageSection() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: ImageWidget(
          photoUrl: widget._bookItem?.formats?.cover ?? "",
          height: 315,
          width: 220.5,
          placeholderPath: assetIllustrationBookPlaceholder,
        ),
      ),
    );
  }

  Widget _dividerSection() {
    return Divider(
      color: Theme.of(context).borderDivider,
      thickness: 1,
      height: 1,
    );
  }

  Widget _titleSection() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget._bookItem?.title ?? "",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).display2,
                ),
              ),
              const SizedBox(width: 8),
              Observer(
                builder: (context) {
                  final _isFavorite = _favoriteStore.listOfFavoriteBookId
                      .contains(widget._bookItem?.id.toString());

                  return IconButton(
                    padding: const EdgeInsets.all(4),
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      if (widget._bookItem?.id != null) {
                        if (_isFavorite) {
                          _favoriteStore.removeBookToFavorite(
                            widget._bookItem!.id.toString(),
                          );
                        } else {
                          _favoriteStore.addBookToFavorite(
                            widget._bookItem!.id.toString(),
                          );
                        }
                      }
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: _isFavorite
                          ? Theme.of(context).buttonPrimary
                          : Theme.of(context).brandDark,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
