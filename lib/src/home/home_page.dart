import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:palm_code/resources/theme.dart';
import 'package:palm_code/src/home/home_store.dart';
import 'package:palm_code/src/home/navigation/app_bar.dart';
import 'package:palm_code/src/home/navigation/main/body.dart';
import 'package:palm_code/src/home/navigation/main/bottom_navigation_bar.dart';
import 'package:palm_code/src/i18n/localization_store.dart';
import 'package:palm_code/src/i18n/supported_locale.dart';
import 'package:palm_code/src/widgets/app_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeStore _homeStore;
  late LocalizationStore _localizationStore;

  @override
  void initState() {
    _homeStore = GetIt.instance.get<HomeStore>();
    _localizationStore = GetIt.instance.get<LocalizationStore>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final int selectedIndex = _homeStore.selectedIndex;
        return Scaffold(
          appBar: AppBarWidget(
            showDivider: false,
            title: AppBarTitleStringResKey.instance.get(selectedIndex),
            customLeading: true,
            actions: [
              if (_homeStore.selectedIndex == 0) ...[
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      if (_localizationStore.locale == enLocale) {
                        _localizationStore.changeLocale(idLocale);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text("Perubahan bahasa ke bahasa Indonesia"),
                          ),
                        );
                      } else {
                        _localizationStore.changeLocale(enLocale);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Language change to English"),
                          ),
                        );
                      }
                    },
                    child: Icon(
                      Icons.translate,
                      color: Theme.of(context).contentPrimary,
                    ),
                  ),
                )
              ]
            ],
          ),
          body:
              PalmCodeNavigationBarBody.instance.get(_homeStore.selectedIndex),
          bottomNavigationBar: PalmCodeBottomNavigationBar(
            currentIndex: _homeStore.selectedIndex,
            onBottomBarItemTapped: _homeStore.onBottomBarItemTapped,
          ),
        );
      },
    );
  }
}
