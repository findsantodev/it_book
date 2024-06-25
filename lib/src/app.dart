import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:palm_code/resources/l10n/app_localizations.dart';
import 'package:palm_code/resources/theme.dart';
import 'package:palm_code/src/dependencies_injection.dart';
import 'package:palm_code/src/i18n/localization_store.dart';
import 'package:palm_code/src/i18n/supported_locale.dart';
import 'package:palm_code/src/navigation/navigation_service.dart';

class PalmCode extends StatefulWidget {
  const PalmCode({super.key});

  @override
  State<PalmCode> createState() => _PalmCodeState();
}

class _PalmCodeState extends State<PalmCode> with WidgetsBindingObserver {
  late LocalizationStore _localizationStore;

  @override
  void initState() {
    setUpDI();
    _localizationStore = GetIt.instance.get<LocalizationStore>();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        theme: getThemeData(),
        navigatorKey: GetIt.instance.get<NavigationService>().navigatorKey,
        initialRoute: NavigationService.routeSplash,
        onGenerateRoute: GetIt.instance.get<NavigationService>().generateRoute,
        title: 'Palm Code',
        supportedLocales: supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        locale: _localizationStore.locale,
      ),
    );
  }
}
