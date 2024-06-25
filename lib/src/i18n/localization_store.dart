import 'dart:ui';

import 'package:mobx/mobx.dart';
import 'package:palm_code/resources/l10n/app_localizations.dart';
import 'package:palm_code/resources/l10n/app_localizations_en.dart';
import 'package:palm_code/resources/l10n/app_localizations_id.dart';
import 'package:palm_code/src/i18n/supported_locale.dart';
import 'package:palm_code/src/repo/shared_preferences_repo.dart';

part 'localization_store.g.dart';

/// Stores state of the currently selected locale by the user and all the
/// strings used in the app.
class LocalizationStore = _LocalizationStore with _$LocalizationStore;

abstract class _LocalizationStore with Store {
  _LocalizationStore();

  @observable
  Locale locale = idLocale;

  /// Important note: Keep this implementation consistent with _lookupLocale(Locale locale) in lib/resources/l10n/app_localizations.dart
  @computed
  AppLocalizations get appLocalizations {
    final languageCode = locale.languageCode;
    switch (languageCode) {
      case 'en':
        return AppLocalizationsEn();
      case 'id':
      default:
        return AppLocalizationsId();
    }
  }

  @action
  Future<bool> changeLocale(Locale locale) async {
    this.locale = locale;
    return SharedPreferencesRepo.instance.persistPreferredLocale(locale);
  }

  @action
  Future<void> loadLocale() async {
    final locale =
        await SharedPreferencesRepo.instance.loadPreferredLocale() ?? idLocale;
    this.locale = locale;
  }
}
