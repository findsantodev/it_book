import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:palm_code/resources/theme.dart';
import 'package:palm_code/src/home/navigation/main/base.dart';
import 'package:palm_code/src/i18n/localization_store.dart';

/// A BottomNavigationBar widget which serves as the BottomNavigation for PalmCode brand operators
class PalmCodeBottomNavigationBar extends StatelessWidget {
  const PalmCodeBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onBottomBarItemTapped,
  });

  final int currentIndex;
  final ValueChanged<int> onBottomBarItemTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).borderDivider,
          ),
        ),
      ),
      padding: const EdgeInsets.only(top: 8),
      child: BottomNavigationBar(
        items: [
          for (var i = 0;
              i < BottomNavigationBarIcon.instance.numberOfItems;
              i++)
            BottomNavigationBarItem(
              icon: Icon(
                BottomNavigationBarIcon.instance.get(i),
                key: Key('home_btm_nav_icon_$i'),
              ),
              label: BottomNavigationBarStringResKey.instance.get(i),
            )
        ],
        currentIndex: currentIndex,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: Theme.of(context).caption1,
        unselectedLabelStyle: Theme.of(context).caption3,
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundApp,
        unselectedItemColor: Theme.of(context).buttonTertiary,
        selectedItemColor: Theme.of(context).buttonPrimary,
        onTap: onBottomBarItemTapped,
      ),
    );
  }
}

class NotificationDot extends StatelessWidget {
  const NotificationDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appTheme.backgroundApp,
        shape: BoxShape.circle,
      ),
      margin: const EdgeInsets.only(top: 2),
      padding: const EdgeInsets.all(1.0),
      child: Container(
        height: 8,
        width: 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: appTheme.brandRed,
        ),
      ),
    );
  }
}

class BottomNavigationBarIcon
    extends PalmCodeBaseNavigationComponent<IconData> {
  BottomNavigationBarIcon._();

  static BottomNavigationBarIcon instance = BottomNavigationBarIcon._();

  @override
  IconData get dashboard => Icons.book;

  @override
  IconData get favorite => Icons.favorite;
}

class BottomNavigationBarStringResKey
    extends PalmCodeBaseNavigationComponent<String> {
  BottomNavigationBarStringResKey._();

  final LocalizationStore _localizationStore =
      GetIt.instance.get<LocalizationStore>();

  static BottomNavigationBarStringResKey instance =
      BottomNavigationBarStringResKey._();

  @override
  String get dashboard =>
      _localizationStore.appLocalizations.home_bottom_nav_dashboard;

  @override
  String get favorite =>
      _localizationStore.appLocalizations.home_bottom_nav_favorite;
}
