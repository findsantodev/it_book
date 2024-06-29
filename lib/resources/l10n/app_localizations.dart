import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id')
  ];

  /// empty_section_label
  ///
  /// In en, this message translates to:
  /// **'Empty'**
  String get empty_section_label;

  /// home_app_bar_title
  ///
  /// In en, this message translates to:
  /// **'Jagoan'**
  String get home_app_bar_title;

  /// action_retry
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get action_retry;

  /// home_bottom_nav_dashboard
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get home_bottom_nav_dashboard;

  /// home_bottom_nav_favorite
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get home_bottom_nav_favorite;

  /// dashboard_popular_book_title
  ///
  /// In en, this message translates to:
  /// **'Popular Books'**
  String get dashboard_popular_book_title;

  /// dashboard_popular_book_see_more_label
  ///
  /// In en, this message translates to:
  /// **'See More'**
  String get dashboard_popular_book_see_more_label;

  /// dashboard_best_book_title
  ///
  /// In en, this message translates to:
  /// **'Editor Choice'**
  String get dashboard_best_book_title;

  /// dashboard_best_book_see_more_label
  ///
  /// In en, this message translates to:
  /// **'See More'**
  String get dashboard_best_book_see_more_label;

  /// books_search_hint_label
  ///
  /// In en, this message translates to:
  /// **'Search for Books'**
  String get books_search_hint_label;

  /// book_detail_read_button_label
  ///
  /// In en, this message translates to:
  /// **'READ'**
  String get book_detail_read_button_label;

  /// book_detail_information_title
  ///
  /// In en, this message translates to:
  /// **'Book Information'**
  String get book_detail_information_title;

  /// book_detail_information_author_label
  ///
  /// In en, this message translates to:
  /// **'AUTHORS'**
  String get book_detail_information_author_label;

  /// book_detail_information_translator_label
  ///
  /// In en, this message translates to:
  /// **'TRANSLATORS'**
  String get book_detail_information_translator_label;

  /// book_detail_information_category_label
  ///
  /// In en, this message translates to:
  /// **'CATEGORY'**
  String get book_detail_information_category_label;

  /// book_detail_information_topic_label
  ///
  /// In en, this message translates to:
  /// **'TOPIC'**
  String get book_detail_information_topic_label;

  /// book_detail_information_language_label
  ///
  /// In en, this message translates to:
  /// **'LANGUAGES'**
  String get book_detail_information_language_label;

  /// book_detail_information_copyright_label
  ///
  /// In en, this message translates to:
  /// **'COPYRIGHT'**
  String get book_detail_information_copyright_label;

  /// book_detail_information_copyright_valid_label
  ///
  /// In en, this message translates to:
  /// **'Patent'**
  String get book_detail_information_copyright_valid_label;

  /// book_detail_information_copyright_invalid_label
  ///
  /// In en, this message translates to:
  /// **'Open Source'**
  String get book_detail_information_copyright_invalid_label;

  /// book_detail_information_download_label
  ///
  /// In en, this message translates to:
  /// **'Downloaded'**
  String get book_detail_information_download_label;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'id': return AppLocalizationsId();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
