import 'package:get_it/get_it.dart';
import 'package:palm_code/src/home/navigation/main/base.dart';

import 'package:palm_code/src/i18n/localization_store.dart';

class AppBarTitleStringResKey extends PalmCodeBaseNavigationComponent<String> {
  final LocalizationStore _localizationStore =
      GetIt.instance.get<LocalizationStore>();

  AppBarTitleStringResKey._();

  static AppBarTitleStringResKey instance = AppBarTitleStringResKey._();

  @override
  String get dashboard =>
      _localizationStore.appLocalizations.home_bottom_nav_dashboard;

  @override
  String get favorite =>
      _localizationStore.appLocalizations.home_bottom_nav_favorite;
}
