import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get empty_section_label => 'Empty';

  @override
  String get home_app_bar_title => 'Jagoan';

  @override
  String get action_retry => 'Retry';

  @override
  String get home_bottom_nav_dashboard => 'Dashboard';

  @override
  String get home_bottom_nav_favorite => 'Favorite';

  @override
  String get dashboard_popular_book_title => 'Popular Books';

  @override
  String get dashboard_popular_book_see_more_label => 'See More';

  @override
  String get dashboard_best_book_title => 'Editor Choice';

  @override
  String get dashboard_best_book_see_more_label => 'See More';

  @override
  String get books_search_hint_label => 'Search for Books';

  @override
  String get book_detail_read_button_label => 'READ';

  @override
  String get book_detail_information_title => 'Book Information';

  @override
  String get book_detail_information_author_label => 'AUTHORS';

  @override
  String get book_detail_information_translator_label => 'TRANSLATORS';

  @override
  String get book_detail_information_category_label => 'CATEGORY';

  @override
  String get book_detail_information_topic_label => 'TOPIC';

  @override
  String get book_detail_information_language_label => 'LANGUAGES';

  @override
  String get book_detail_information_copyright_label => 'COPYRIGHT';

  @override
  String get book_detail_information_copyright_valid_label => 'Patent';

  @override
  String get book_detail_information_copyright_invalid_label => 'Open Source';

  @override
  String get book_detail_information_download_label => 'Downloaded';
}
