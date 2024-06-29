import 'package:flutter/painting.dart';
import 'package:meta/meta.dart';
import 'package:palm_code/resources/constanst/shared_preference_constanst.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepo {
  const SharedPreferencesRepo._();

  static const SharedPreferencesRepo instance = SharedPreferencesRepo._();

  @visibleForTesting
  static const String prefLocaleLanguageCodeKey =
      "pref_app_locale_language_code";
  @visibleForTesting
  static const String prefLocaleCountryCodeKey = "pref_app_locale_country_code";

  Future<SharedPreferences> get _sharedPreferencesInstance =>
      SharedPreferences.getInstance();

  Future<Locale?> loadPreferredLocale() async {
    final instance = await _sharedPreferencesInstance;
    if (!instance.containsKey(prefLocaleLanguageCodeKey)) {
      return null;
    }
    final languageCode = instance.getString(prefLocaleLanguageCodeKey);
    if (languageCode == null) {
      return null;
    }
    final countryCode = instance.getString(prefLocaleCountryCodeKey);
    return Locale(languageCode, countryCode);
  }

  Future<bool> persistPreferredLocale(Locale locale) async {
    final instance = await _sharedPreferencesInstance;
    bool successSavingLanguageCode = true;
    bool successSavingCountryCode = true;
    successSavingLanguageCode = await instance.setString(
      prefLocaleLanguageCodeKey,
      locale.languageCode,
    );
    if (locale.countryCode != null) {
      successSavingCountryCode = await instance.setString(
        prefLocaleCountryCodeKey,
        locale.countryCode!,
      );
    }
    return successSavingLanguageCode && successSavingCountryCode;
  }

  Future<void> saveFavoriteBooksIds(List<String> favoriteBookIds) async {
    final instance = await _sharedPreferencesInstance;
    await instance.setStringList(favoriteBookIdsKey, favoriteBookIds);
  }

  Future<List<String>> getFavoriteBooksIds() async {
    final instance = await _sharedPreferencesInstance;
    final List<String>? listOfStringBookId =
        instance.getStringList(favoriteBookIdsKey);

    if (listOfStringBookId != null) {
      return listOfStringBookId;
    }

    return [];
  }

  Future<void> saveFavoriteBooks(List<String> favoriteBook, String key) async {
    final instance = await _sharedPreferencesInstance;
    await instance.setStringList(key, favoriteBook);
  }

  Future<List<String>> getFavoriteBooks(String key) async {
    final instance = await _sharedPreferencesInstance;
    final List<String>? listOfStringBook = instance.getStringList(key);

    if (listOfStringBook != null) {
      return listOfStringBook;
    }

    return [];
  }
}
